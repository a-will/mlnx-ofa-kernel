/*
 * Copyright (c) 2016, Mellanox Technologies, Ltd.  All rights reserved.
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

#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/mlx5/driver.h>
#include <linux/mlx5/fs.h>
#include "mlx5_core.h"
#include "vxlan.h"

void mlx5e_vxlan_init(struct mlx5e_priv *priv)
{
	struct mlx5e_vxlan_db *vxlan_db = &priv->vxlan;

	spin_lock_init(&vxlan_db->lock);
	INIT_RADIX_TREE(&vxlan_db->tree, GFP_ATOMIC);
	mlx5_vxlan_debugfs_init(priv->mdev);
}

static int mlx5e_vxlan_core_add_port_cmd(struct mlx5_core_dev *mdev, u16 port)
{
	u32 in[MLX5_ST_SZ_DW(add_vxlan_udp_dport_in)]   = {0};
	u32 out[MLX5_ST_SZ_DW(add_vxlan_udp_dport_out)] = {0};

	MLX5_SET(add_vxlan_udp_dport_in, in, opcode,
		 MLX5_CMD_OP_ADD_VXLAN_UDP_DPORT);
	MLX5_SET(add_vxlan_udp_dport_in, in, vxlan_udp_port, port);
	return mlx5_cmd_exec(mdev, in, sizeof(in), out, sizeof(out));
}

static int mlx5e_vxlan_core_del_port_cmd(struct mlx5_core_dev *mdev, u16 port)
{
	u32 in[MLX5_ST_SZ_DW(delete_vxlan_udp_dport_in)]   = {0};
	u32 out[MLX5_ST_SZ_DW(delete_vxlan_udp_dport_out)] = {0};

	MLX5_SET(delete_vxlan_udp_dport_in, in, opcode,
		 MLX5_CMD_OP_DELETE_VXLAN_UDP_DPORT);
	MLX5_SET(delete_vxlan_udp_dport_in, in, vxlan_udp_port, port);
	return mlx5_cmd_exec(mdev, in, sizeof(in), out, sizeof(out));
}

struct mlx5e_vxlan *mlx5e_vxlan_lookup_port(struct mlx5e_priv *priv, u16 port)
{
	struct mlx5e_vxlan_db *vxlan_db = &priv->vxlan;
	struct mlx5e_vxlan *vxlan;

	spin_lock_bh(&vxlan_db->lock);
	vxlan = radix_tree_lookup(&vxlan_db->tree, port);
	spin_unlock_bh(&vxlan_db->lock);

	return vxlan;
}

static void mlx5e_vxlan_add_port(struct work_struct *work)
{
	struct mlx5e_vxlan_work *vxlan_work =
		container_of(work, struct mlx5e_vxlan_work, work);
	struct mlx5e_priv *priv = vxlan_work->priv;
	struct mlx5e_vxlan_db *vxlan_db = &priv->vxlan;
	u16 port = vxlan_work->port;
	struct mlx5e_vxlan *vxlan;
	int err;
#ifdef CONFIG_MLX5_INNER_RSS
	u16 etype;
#endif

	mutex_lock(&priv->state_lock);
	vxlan = mlx5e_vxlan_lookup_port(priv, port);
	if (vxlan) {
		atomic_inc(&vxlan->refcount);
		goto free_work;
	}

	if (mlx5e_vxlan_core_add_port_cmd(priv->mdev, port))
		goto free_work;

	vxlan = kzalloc(sizeof(*vxlan), GFP_KERNEL);
	if (!vxlan)
		goto err_delete_port;

#ifdef CONFIG_MLX5_INNER_RSS
	if (mlx5e_tunnel_inner_ft_supported(priv->mdev)) {
		if (vxlan_work->sa_family == AF_INET)
			etype = ETH_P_IP;
		else if (vxlan_work->sa_family == AF_INET6)
			etype = ETH_P_IPV6;
		else
			goto err_free;

		vxlan->flow_rule = mlx5e_add_udp_tunnel_flow_rule(priv, etype, port);
		if (IS_ERR(vxlan->flow_rule)) {
			pr_warn("Failed to add flow rule for VXLAN port %d\n", port);
			goto err_free;
		}
	}
#endif

	vxlan->udp_port = port;
	atomic_set(&vxlan->refcount, 1);

	spin_lock_bh(&vxlan_db->lock);
	err = radix_tree_insert(&vxlan_db->tree, vxlan->udp_port, vxlan);
	spin_unlock_bh(&vxlan_db->lock);
	if (err)
		goto err_del_flow_rule;

	if (mlx5_vxlan_debugfs_add(priv->mdev, vxlan))
		pr_warn("Failed to add VXLAN port %d to debugfs\n", vxlan->udp_port);

	goto free_work;

err_del_flow_rule:
#ifdef CONFIG_MLX5_INNER_RSS
	if (mlx5e_tunnel_inner_ft_supported(priv->mdev))
		mlx5_del_flow_rules(vxlan->flow_rule);
#endif
err_free:
	kfree(vxlan);
err_delete_port:
	mlx5e_vxlan_core_del_port_cmd(priv->mdev, port);
free_work:
	mutex_unlock(&priv->state_lock);
	kfree(vxlan_work);
}

static void mlx5e_vxlan_del_port(struct work_struct *work)
{
	struct mlx5e_vxlan_work *vxlan_work =
		container_of(work, struct mlx5e_vxlan_work, work);
	struct mlx5e_priv *priv         = vxlan_work->priv;
	struct mlx5e_vxlan_db *vxlan_db = &priv->vxlan;
	u16 port = vxlan_work->port;
	struct mlx5e_vxlan *vxlan;
	bool remove = false;

	mutex_lock(&priv->state_lock);
	spin_lock_bh(&vxlan_db->lock);
	vxlan = radix_tree_lookup(&vxlan_db->tree, port);
	if (!vxlan)
		goto out_unlock;

	if (atomic_dec_and_test(&vxlan->refcount)) {
		radix_tree_delete(&vxlan_db->tree, port);
		remove = true;
	}

out_unlock:
	spin_unlock_bh(&vxlan_db->lock);

	if (remove) {
		mlx5_vxlan_debugfs_remove(priv->mdev, vxlan);
#ifdef CONFIG_MLX5_INNER_RSS
		if (mlx5e_tunnel_inner_ft_supported(priv->mdev))
			mlx5_del_flow_rules(vxlan->flow_rule);
#endif
		mlx5e_vxlan_core_del_port_cmd(priv->mdev, port);
		kfree(vxlan);
	}
	mutex_unlock(&priv->state_lock);
	kfree(vxlan_work);
}

void mlx5e_vxlan_queue_work(struct mlx5e_priv *priv, sa_family_t sa_family,
			    u16 port, int add)
{
	struct mlx5e_vxlan_work *vxlan_work;

	vxlan_work = kmalloc(sizeof(*vxlan_work), GFP_ATOMIC);
	if (!vxlan_work)
		return;

	if (add)
		INIT_WORK(&vxlan_work->work, mlx5e_vxlan_add_port);
	else
		INIT_WORK(&vxlan_work->work, mlx5e_vxlan_del_port);

	vxlan_work->priv = priv;
	vxlan_work->port = port;
	vxlan_work->sa_family = sa_family;
	queue_work(priv->wq, &vxlan_work->work);
}

void mlx5e_vxlan_cleanup(struct mlx5e_priv *priv)
{
	struct mlx5e_vxlan_db *vxlan_db = &priv->vxlan;
	struct mlx5e_vxlan *vxlan;
	unsigned int port = 0;

	/* Lockless since we are the only radix-tree consumers, wq is disabled */
	while (radix_tree_gang_lookup(&vxlan_db->tree, (void **)&vxlan, port, 1)) {
		port = vxlan->udp_port;
		radix_tree_delete(&vxlan_db->tree, port);
		mlx5_vxlan_debugfs_remove(priv->mdev, vxlan);
#ifdef CONFIG_MLX5_INNER_RSS
		if (mlx5e_tunnel_inner_ft_supported(priv->mdev))
			mlx5_del_flow_rules(vxlan->flow_rule);
#endif
		mlx5e_vxlan_core_del_port_cmd(priv->mdev, port);
		kfree(vxlan);
	}
	mlx5_vxlan_debugfs_cleanup(priv->mdev);
}
