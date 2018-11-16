/*
 * Copyright (c) 2004 Topspin Communications.  All rights reserved.
 *
 * This software is available to you under a choice of one of two
 * licenses.  You may choose to be licensed under the terms of the GNU
 * General Public License (GPL) Version 2, available from the file
 * COPYING in the main directory of this source tree, or the
 * OpenIB.org BSD license below:
 *
 *     Redistribution and use in source and binary forms, with or
 *     without modification, are permitted provided that the following
 *     conditions are met:
 *
 *      - Redistributions of source code must retain the above
 *        copyright notice, this list of conditions and the following
 *        disclaimer.
 *
 *      - Redistributions in binary form must reproduce the above
 *        copyright notice, this list of conditions and the following
 *        disclaimer in the documentation and/or other materials
 *        provided with the distribution.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
 * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

#include <linux/module.h>
#include <linux/sched/signal.h>

#include <linux/init.h>
#include <linux/seq_file.h>

#include <linux/uaccess.h>

#include "ipoib.h"

static ssize_t show_parent(struct device *d, struct device_attribute *attr,
			   char *buf)
{
	struct net_device *dev = to_net_dev(d);
	struct ipoib_dev_priv *priv = ipoib_priv(dev);

	return sprintf(buf, "%s\n", priv->parent->name);
}
static DEVICE_ATTR(parent, S_IRUGO, show_parent, NULL);

int __ipoib_vlan_add(struct ipoib_dev_priv *ppriv, struct ipoib_dev_priv *priv,
		     u16 pkey, int type)
{
	int result;

	/* Initial ring params */
	priv->sendq_size = ipoib_sendq_size;
	priv->recvq_size = ipoib_recvq_size;

	priv->max_ib_mtu = ppriv->max_ib_mtu;
	/* MTU will be reset when mcast join happens */
	priv->dev->mtu   = IPOIB_UD_MTU(priv->max_ib_mtu);
	priv->mcast_mtu  = priv->admin_mtu = priv->dev->mtu;
	priv->parent = ppriv->dev;
	set_bit(IPOIB_FLAG_SUBINTERFACE, &priv->flags);

	ipoib_set_dev_features(priv, ppriv->ca);

	priv->pkey = pkey;

	memcpy(priv->dev->dev_addr, ppriv->dev->dev_addr, INFINIBAND_ALEN);
	memcpy(&priv->local_gid, &ppriv->local_gid, sizeof(priv->local_gid));
	set_bit(IPOIB_FLAG_DEV_ADDR_SET, &priv->flags);
	priv->dev->broadcast[8] = pkey >> 8;
	priv->dev->broadcast[9] = pkey & 0xff;

	result = ipoib_dev_init(priv->dev, ppriv->ca, ppriv->port);
	if (result < 0) {
		ipoib_warn(ppriv, "failed to initialize subinterface: "
			   "device %s, port %d",
			   ppriv->ca->name, ppriv->port);
		goto err;
	}

	result = register_netdevice(priv->dev);
	if (result) {
		ipoib_warn(priv, "failed to initialize; error %i", result);
		goto register_failed;
	}

	/* RTNL childs don't need proprietary sysfs entries */
	if (type == IPOIB_LEGACY_CHILD) {
		if (ipoib_cm_add_mode_attr(priv->dev))
			goto sysfs_failed;
		if (ipoib_add_pkey_attr(priv->dev))
			goto sysfs_failed;
		if (ipoib_add_umcast_attr(priv->dev))
			goto sysfs_failed;

		if (device_create_file(&priv->dev->dev, &dev_attr_parent))
			goto sysfs_failed;

		if (priv->max_tx_queues > 1) {
			if (ipoib_set_rss_sysfs(priv))
				goto sysfs_failed;
		}
	}

	priv->child_type  = type;
	list_add_tail(&priv->list, &ppriv->child_intfs);

	return 0;

sysfs_failed:
	result = -ENOMEM;
	unregister_netdevice(priv->dev);

register_failed:
	priv->fp.ipoib_dev_cleanup(priv->dev);

err:
	return result;
}

int ipoib_vlan_add(struct net_device *pdev, unsigned short pkey,
		unsigned char child_index)
{
	struct ipoib_dev_priv *ppriv, *priv = NULL;
	char intf_name[IFNAMSIZ];
	struct ipoib_dev_priv *tpriv;
	int result;

	if (!capable(CAP_NET_ADMIN))
		return -EPERM;

	ppriv = ipoib_priv(pdev);

	if (test_bit(IPOIB_FLAG_GOING_DOWN, &ppriv->flags))
		return -EPERM;

	snprintf(intf_name, sizeof intf_name, "%s.%04x",
		 ppriv->dev->name, pkey);

	if (!mutex_trylock(&ppriv->sysfs_mutex))
		return restart_syscall();

	if (!rtnl_trylock()) {
		mutex_unlock(&ppriv->sysfs_mutex);
		return restart_syscall();
	}

	if (!down_write_trylock(&ppriv->vlan_rwsem)) {
		rtnl_unlock();
		mutex_unlock(&ppriv->sysfs_mutex);
		return restart_syscall();
	}

	/*
	 * for the case of non-legacy and same pkey child we wanted to use
	 * a notation of ibN.pkey:index and ibN:index but this is problematic
	 * with tools like ifconfig who treat devices with ":" in their names
	 * as aliases which are restriced, e.t w.r.t counters, etc
	 */
	if (ppriv->pkey != pkey && child_index == 0) /* legacy child */
		snprintf(intf_name, sizeof(intf_name), "%s.%04x",
			 ppriv->dev->name, pkey);
	else if (ppriv->pkey != pkey && child_index != 0) /* non-legacy child */
		snprintf(intf_name, sizeof(intf_name), "%s.%04x.%d",
			 ppriv->dev->name, pkey, child_index);
	else if (ppriv->pkey == pkey && child_index != 0) /* same pkey child */
		snprintf(intf_name, sizeof(intf_name), "%s.%d",
			 ppriv->dev->name, child_index);
	else  {
		ipoib_warn(ppriv, "wrong pkey/child_index pairing %04x %d\n",
			   pkey, child_index);
		result = -EINVAL;
		goto out;
	}

	priv = ipoib_intf_alloc(ppriv->ca, ppriv->port, intf_name);
	if (!priv) {
		result = -ENOMEM;
		goto out;
	}

	/*
	 * First ensure this isn't a duplicate. We check the parent device and
	 * then all of the legacy child interfaces to make sure the Pkey
	 * doesn't match.
	 */
	if (!child_index && ppriv->pkey == pkey) {
		result = -ENOTUNIQ;
		goto out;
	}

	list_for_each_entry(tpriv, &ppriv->child_intfs, list) {
		if (tpriv->pkey == pkey &&
		    tpriv->child_type == IPOIB_LEGACY_CHILD &&
		    tpriv->child_index == child_index) {
			result = -ENOTUNIQ;
			goto out;
		}
	}

	/*
	 * keep the child_index inside the priv, in order to find it when it
	 * needs to be deleted.
	 */
	priv->child_index = child_index;

	result = __ipoib_vlan_add(ppriv, priv, pkey, IPOIB_LEGACY_CHILD);

out:
	up_write(&ppriv->vlan_rwsem);
	rtnl_unlock();
	mutex_unlock(&ppriv->sysfs_mutex);

	if (result && priv) {
		struct rdma_netdev *rn;

		rn = netdev_priv(priv->dev);
		rn->free_rdma_netdev(priv->dev);
		kfree(priv);
	}

	return result;
}

int ipoib_vlan_delete(struct net_device *pdev, unsigned short pkey,
		unsigned char child_index)
{
	struct ipoib_dev_priv *ppriv, *priv, *tpriv;
	struct net_device *dev = NULL;

	if (!capable(CAP_NET_ADMIN))
		return -EPERM;

	ppriv = ipoib_priv(pdev);

	if (test_bit(IPOIB_FLAG_GOING_DOWN, &ppriv->flags))
		return -EPERM;

	if (!mutex_trylock(&ppriv->sysfs_mutex))
		return restart_syscall();

	if (!rtnl_trylock()) {
		mutex_unlock(&ppriv->sysfs_mutex);
		return restart_syscall();
	}

	if (!down_write_trylock(&ppriv->vlan_rwsem)) {
		rtnl_unlock();
		mutex_unlock(&ppriv->sysfs_mutex);
		return restart_syscall();
	}

	list_for_each_entry_safe(priv, tpriv, &ppriv->child_intfs, list) {
		if (priv->pkey == pkey &&
		    priv->child_type == IPOIB_LEGACY_CHILD &&
		    priv->child_index == child_index) {
			list_del(&priv->list);
			dev = priv->dev;
			/* interface in the middle of destruction */
			set_bit(IPOIB_FLAG_GOING_DOWN, &priv->flags);
			break;
		}
	}
	up_write(&ppriv->vlan_rwsem);

	if (dev) {
		ipoib_dbg(ppriv, "delete child vlan %s\n", dev->name);
		unregister_netdevice(dev);
	}

	rtnl_unlock();
	mutex_unlock(&ppriv->sysfs_mutex);

	if (dev) {
		struct rdma_netdev *rn;

		rn = netdev_priv(dev);
		rn->free_rdma_netdev(priv->dev);
		kfree(priv);
		return 0;
	}

	return -ENODEV;
}