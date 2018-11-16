#ifndef _COMPAT_NET_TC_ACT_TC_GACT_H
#define _COMPAT_NET_TC_ACT_TC_GACT_H 1

#include "../../../compat/config.h"

#include_next <net/tc_act/tc_gact.h>

#ifdef CONFIG_COMPAT_TCF_GACT
#include <net/pkt_cls.h>
#include <net/netlink.h>
#include <linux/skbuff.h>
#include <uapi/linux/tc_act/tc_gact.h>

#ifndef HAVE_IS_TCF_GACT
#define HAVE_IS_TCF_GACT

static inline bool is_tcf_gact(const struct tc_action *a)
{
#ifdef CONFIG_NET_CLS_ACT
	if (a->ops && a->ops->type == TCA_ACT_GACT) {
		return true;
	}
#endif
	return false;
}
#endif /* HAVE_IS_TCF_GACT */

#ifndef HAVE_IS_TCF_GACT_SHOT
#define HAVE_IS_TCF_GACT_SHOT

static const struct nla_policy gact_policy[TCA_GACT_MAX + 1] = {
	[TCA_GACT_PARMS]		= { .len = sizeof(struct tc_gact) },
};

static struct tc_gact to_gact_compat(const struct tc_action *a)
{
	struct nlattr *tb[TCA_GACT_MAX + 1];
	struct tc_gact g = { .action = TC_ACT_UNSPEC };
	struct sk_buff *skb;
	struct nlattr *nla;

	if (!a->ops || !a->ops->dump || !is_tcf_gact(a))
		return g;

	skb = alloc_skb(256, GFP_KERNEL);
	if (!skb)
		return g;

	if (a->ops->dump(skb, (struct tc_action *) a, 0, 0) < 0)
		goto freeskb;

	nla = (struct nlattr *) skb->data;
	if (nla_parse(tb, TCA_GACT_MAX, nla, skb->len, gact_policy, NULL) < 0)
		goto freeskb;

	if (!tb[TCA_GACT_PARMS])
		goto freeskb;

	g = *((struct tc_gact *) nla_data(tb[TCA_GACT_PARMS]));

freeskb:
	kfree_skb(skb);

	return g;
}

static inline bool is_tcf_gact_shot(const struct tc_action *a)
{
	return to_gact_compat(a).action == TC_ACT_SHOT;
}
#endif

#endif

#endif	/* _COMPAT_NET_TC_ACT_TC_GACT_H */
