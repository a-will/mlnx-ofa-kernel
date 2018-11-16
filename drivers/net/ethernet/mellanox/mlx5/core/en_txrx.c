/*
 * Copyright (c) 2015, Mellanox Technologies. All rights reserved.
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

#include <linux/irq.h>
#include "en.h"

static inline bool mlx5e_channel_no_affinity_change(struct mlx5e_channel *c)
{
	int current_cpu = smp_processor_id();
	const struct cpumask *aff;
	struct irq_data *idata;

	idata = irq_desc_get_irq_data(c->irq_desc);
	aff = irq_data_get_affinity_mask(idata);
	return cpumask_test_cpu(current_cpu, aff);
}

static void mlx5e_handle_tx_dim(struct mlx5e_txqsq *sq)
{
	struct net_dim_sample *sample = &sq->dim_obj.sample;

	if (unlikely(!MLX5E_TEST_BIT(sq->state, MLX5E_SQ_STATE_AM)))
		return;

	net_dim_sample(sq->cq.event_ctr, sample->pkt_ctr, sample->byte_ctr, sample);
	net_dim(&sq->dim_obj.dim, *sample);
}

static void mlx5e_handle_rx_dim(struct mlx5e_rq *rq)
{
	struct net_dim_sample *sample = &rq->dim_obj.sample;

	if (unlikely(!MLX5E_TEST_BIT(rq->state, MLX5E_RQ_STATE_AM)))
		return;

	net_dim_sample(rq->cq.event_ctr, sample->pkt_ctr, sample->byte_ctr, sample);
	net_dim(&rq->dim_obj.dim, *sample);
}

int mlx5e_napi_poll(struct napi_struct *napi, int budget)
{
	struct mlx5e_channel *c = container_of(napi, struct mlx5e_channel,
					       napi);
	bool busy = false;
	int work_done = 0;
	int i;

	clear_bit(MLX5E_CHANNEL_NAPI_SCHED, &c->flags);

	for (i = 0; i < c->num_tc; i++)
		busy |= mlx5e_poll_tx_cq(&c->sq[i].cq, budget);

#ifdef CONFIG_MLX5_EN_SPECIAL_SQ
	for (i = 0; i < c->num_special_sq; i++)
		busy |= mlx5e_poll_tx_cq(&c->special_sq[i].cq, budget);
#endif

	if (c->xdp)
		busy |= mlx5e_poll_xdpsq_cq(&c->rq.xdpsq.cq);

	if (likely(budget)) { /* budget=0 means: don't poll rx rings */
		work_done = mlx5e_poll_rx_cq(&c->rq.cq, budget);
		busy |= work_done == budget;
	}

	busy |= c->rq.post_wqes(&c->rq);

	if (busy) {
		if (likely(mlx5e_channel_no_affinity_change(c)))
			return budget;
		if (budget && work_done == budget)
			work_done--;
	}

	napi_complete_done(napi, work_done);

	/* avoid losing completion event during/after polling cqs */
	if (test_bit(MLX5E_CHANNEL_NAPI_SCHED, &c->flags)) {
		napi_schedule(napi);
		return work_done;
	}

	for (i = 0; i < c->num_tc; i++) {
		mlx5e_handle_tx_dim(&c->sq[i]);
		mlx5e_cq_arm(&c->sq[i].cq);
	}

#ifdef CONFIG_MLX5_EN_SPECIAL_SQ
	for (i = 0; i < c->num_special_sq; i++)
		mlx5e_cq_arm(&c->special_sq[i].cq);
#endif

	mlx5e_handle_rx_dim(&c->rq);

	mlx5e_cq_arm(&c->rq.cq);
	mlx5e_cq_arm(&c->icosq.cq);

	return work_done;
}

void mlx5e_completion_event(struct mlx5_core_cq *mcq)
{
	struct mlx5e_cq *cq = container_of(mcq, struct mlx5e_cq, mcq);

	cq->event_ctr++;
	set_bit(MLX5E_CHANNEL_NAPI_SCHED, &cq->channel->flags);
	napi_schedule(cq->napi);
}

void mlx5e_cq_error_event(struct mlx5_core_cq *mcq, enum mlx5_event event)
{
	struct mlx5e_cq *cq = container_of(mcq, struct mlx5e_cq, mcq);
	struct mlx5e_channel *c = cq->channel;
	struct net_device *netdev = c->netdev;

	netdev_err(netdev, "%s: cqn=0x%.6x event=0x%.2x\n",
		   __func__, mcq->cqn, event);
}
