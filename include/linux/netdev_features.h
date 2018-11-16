#ifndef _COMPAT_LINUX_NETDEV_FEATURES_H
#define _COMPAT_LINUX_NETDEV_FEATURES_H 1

#include "../../compat/config.h"

#include_next <linux/netdev_features.h>

#ifndef NETIF_F_CSUM_MASK
#define NETIF_F_CSUM_MASK	(NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM | \
				NETIF_F_HW_CSUM)
#endif /* NETIF_F_CSUM_MASK */
#endif	/* _COMPAT_LINUX_NETDEV_FEATURES_H */
