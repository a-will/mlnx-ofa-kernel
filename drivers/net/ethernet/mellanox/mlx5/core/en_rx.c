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

#include <linux/prefetch.h>
#include <linux/ip.h>
#include <linux/ipv6.h>
#include <linux/tcp.h>
#include <linux/bpf_trace.h>
#include <net/busy_poll.h>
#include "en.h"
#include "en_tc.h"
#include "eswitch.h"
#include "en_rep.h"
#include "ipoib/ipoib.h"
#include "en_accel/ipsec_rxtx.h"
#include "lib/clock.h"

static inline bool mlx5e_rx_hw_stamp(struct hwtstamp_config *config)
{
	return config->rx_filter == HWTSTAMP_FILTER_ALL;
}

static inline void mlx5e_read_cqe_slot(struct mlx5e_cq *cq, u32 cqcc,
				       void *data)
{
	u32 ci = cqcc & cq->wq.fbc.sz_m1;

	memcpy(data, mlx5_cqwq_get_wqe(&cq->wq, ci), sizeof(struct mlx5_cqe64));
}

static inline void mlx5e_read_title_slot(struct mlx5e_rq *rq,
					 struct mlx5e_cq *cq, u32 cqcc)
{
	mlx5e_read_cqe_slot(cq, cqcc, &cq->title);
	cq->decmprs_left        = be32_to_cpu(cq->title.byte_cnt);
	cq->decmprs_wqe_counter = be16_to_cpu(cq->title.wqe_counter);
	rq->stats.cqe_compress_blks++;
}

static inline void mlx5e_read_mini_arr_slot(struct mlx5e_cq *cq, u32 cqcc)
{
	mlx5e_read_cqe_slot(cq, cqcc, cq->mini_arr);
	cq->mini_arr_idx = 0;
}

static inline void mlx5e_cqes_update_owner(struct mlx5e_cq *cq, u32 cqcc, int n)
{
	struct mlx5_frag_buf_ctrl *fbc = &cq->wq.fbc;
	u8 op_own = (cqcc >> fbc->log_sz) & 1;
	u32 wq_sz = 1 << fbc->log_sz;
	u32 ci = cqcc & fbc->sz_m1;
	u32 ci_top = min_t(u32, wq_sz, ci + n);

	for (; ci < ci_top; ci++, n--) {
		struct mlx5_cqe64 *cqe = mlx5_cqwq_get_wqe(&cq->wq, ci);

		cqe->op_own = op_own;
	}

	if (unlikely(ci == wq_sz)) {
		op_own = !op_own;
		for (ci = 0; ci < n; ci++) {
			struct mlx5_cqe64 *cqe = mlx5_cqwq_get_wqe(&cq->wq, ci);

			cqe->op_own = op_own;
		}
	}
}

static inline void mlx5e_decompress_cqe(struct mlx5e_rq *rq,
					struct mlx5e_cq *cq, u32 cqcc)
{
	cq->title.byte_cnt     = cq->mini_arr[cq->mini_arr_idx].byte_cnt;
	cq->title.check_sum    = cq->mini_arr[cq->mini_arr_idx].checksum;
	cq->title.op_own      &= 0xf0;
	cq->title.op_own      |= 0x01 & (cqcc >> cq->wq.fbc.log_sz);
	cq->title.wqe_counter  = cpu_to_be16(cq->decmprs_wqe_counter);

	if (rq->wq_type == MLX5_WQ_TYPE_LINKED_LIST_STRIDING_RQ)
		cq->decmprs_wqe_counter +=
			mpwrq_get_cqe_consumed_strides(&cq->title);
	else
		cq->decmprs_wqe_counter =
			mlx5_wq_cyc_ctr2ix(&rq->wqe.wq,
					   cq->decmprs_wqe_counter + 1);
}

static inline void mlx5e_decompress_cqe_no_hash(struct mlx5e_rq *rq,
						struct mlx5e_cq *cq, u32 cqcc)
{
	mlx5e_decompress_cqe(rq, cq, cqcc);
	cq->title.rss_hash_type   = 0;
	cq->title.rss_hash_result = 0;
}

static inline u32 mlx5e_decompress_cqes_cont(struct mlx5e_rq *rq,
					     struct mlx5e_cq *cq,
					     int update_owner_only,
					     int budget_rem)
{
	u32 cqcc = cq->wq.cc + update_owner_only;
	u32 cqe_count;
	u32 i;

	cqe_count = min_t(u32, cq->decmprs_left, budget_rem);

	for (i = update_owner_only; i < cqe_count;
	     i++, cq->mini_arr_idx++, cqcc++) {
		if (cq->mini_arr_idx == MLX5_MINI_CQE_ARRAY_SIZE)
			mlx5e_read_mini_arr_slot(cq, cqcc);

		mlx5e_decompress_cqe_no_hash(rq, cq, cqcc);
		rq->handle_rx_cqe(rq, &cq->title);
	}
	mlx5e_cqes_update_owner(cq, cq->wq.cc, cqcc - cq->wq.cc);
	cq->wq.cc = cqcc;
	cq->decmprs_left -= cqe_count;
	rq->stats.cqe_compress_pkts += cqe_count;

	return cqe_count;
}

static inline u32 mlx5e_decompress_cqes_start(struct mlx5e_rq *rq,
					      struct mlx5e_cq *cq,
					      int budget_rem)
{
	mlx5e_read_title_slot(rq, cq, cq->wq.cc);
	mlx5e_read_mini_arr_slot(cq, cq->wq.cc + 1);
	mlx5e_decompress_cqe(rq, cq, cq->wq.cc);
	rq->handle_rx_cqe(rq, &cq->title);
	cq->mini_arr_idx++;

	return mlx5e_decompress_cqes_cont(rq, cq, 1, budget_rem) - 1;
}

static inline void mlx5e_rx_cache_page_swap(struct mlx5e_page_cache *cache,
					    u32 a, u32 b)
{
	struct mlx5e_dma_info tmp;

	tmp = cache->page_cache[a];
	cache->page_cache[a] = cache->page_cache[b];
	cache->page_cache[b] = tmp;
}

static inline void
mlx5e_rx_cache_reduce_reset_watch(struct mlx5e_page_cache *cache)
{
	struct mlx5e_page_cache_reduce *reduce = &cache->reduce;

	reduce->next_ts = ilog2(cache->sz) == cache->log_min_sz ?
		MAX_JIFFY_OFFSET :
		jiffies + reduce->graceful_period;
	reduce->successive = 0;
}

static inline bool mlx5e_rx_cache_is_empty(struct mlx5e_page_cache *cache)
{
	return cache->head < 0;
}
static inline bool mlx5e_rx_cache_page_busy(struct mlx5e_page_cache *cache,
					    u32 i)
{
	return page_ref_count(cache->page_cache[i].page) != 1;
}

static inline bool mlx5e_rx_cache_check_reduce(struct mlx5e_rq *rq)
{
	struct mlx5e_page_cache *cache = &rq->page_cache;

	if (unlikely(test_bit(MLX5E_RQ_STATE_CACHE_REDUCE_PENDING, &rq->state)))
		return false;

	if (time_before(jiffies, cache->reduce.next_ts))
		return false;

	if (likely(!mlx5e_rx_cache_is_empty(cache)) &&
	    mlx5e_rx_cache_page_busy(cache, cache->head))
		goto reset_watch;

	if (ilog2(cache->sz) == cache->log_min_sz)
		goto reset_watch;

	/* would like to reduce */
	if (cache->reduce.successive < MLX5E_PAGE_CACHE_REDUCE_SUCCESSIVE_CNT) {
		cache->reduce.successive++;
		return false;
	}

	return true;

reset_watch:
	mlx5e_rx_cache_reduce_reset_watch(cache);
	return false;

}

static inline void mlx5e_rx_cache_may_reduce(struct mlx5e_rq *rq)
{
	struct mlx5e_page_cache *cache = &rq->page_cache;
	struct mlx5e_page_cache_reduce *reduce = &cache->reduce;
	int max_new_head;

	if (!mlx5e_rx_cache_check_reduce(rq))
		return;

	/* do reduce */
	rq->stats.cache_rdc++;
	cache->sz >>= 1;
	max_new_head = (cache->sz >> 1) - 1;
	if (cache->head > max_new_head) {
		u32 npages = cache->head - max_new_head;

		cache->head = max_new_head;
		if (cache->lrs >= cache->head)
			cache->lrs = 0;

		memcpy(reduce->pending, &cache->page_cache[cache->head + 1],
		       npages * sizeof(*reduce->pending));
		reduce->npages = npages;
		set_bit(MLX5E_RQ_STATE_CACHE_REDUCE_PENDING, &rq->state);
	}

	mlx5e_rx_cache_reduce_reset_watch(cache);
}

static inline bool mlx5e_rx_cache_extend(struct mlx5e_rq *rq)
{
	struct mlx5e_page_cache *cache = &rq->page_cache;
	struct mlx5e_page_cache_reduce *reduce = &cache->reduce;

	if (ilog2(cache->sz) == cache->log_max_sz)
		return false;

	rq->stats.cache_ext++;
	cache->sz <<= 1;

	mlx5e_rx_cache_reduce_reset_watch(cache);
	schedule_delayed_work_on(smp_processor_id(), &reduce->reduce_work,
				 reduce->delay);
	return true;
}

static inline bool mlx5e_page_is_reserved(struct page *page)
{
	return page_is_pfmemalloc(page) || page_to_nid(page) != numa_mem_id();
}

static inline bool mlx5e_rx_cache_put(struct mlx5e_rq *rq,
				      struct mlx5e_dma_info *dma_info)
{
	struct mlx5e_page_cache *cache = &rq->page_cache;
	if (unlikely(cache->head == cache->sz - 1)) {
		if (!mlx5e_rx_cache_extend(rq)) {
			rq->stats.cache_full++;
			return false;
		}
	}

	if (unlikely(mlx5e_page_is_reserved(dma_info->page))) {
		rq->stats.cache_waive++;
		return false;
	}

	cache->page_cache[++cache->head] = *dma_info;
	return true;
}

static inline bool mlx5e_rx_cache_get(struct mlx5e_rq *rq,
				      struct mlx5e_dma_info *dma_info)
{
	struct mlx5e_page_cache *cache = &rq->page_cache;

	if (unlikely(mlx5e_rx_cache_is_empty(cache)))
		goto err_no_page;

	mlx5e_rx_cache_page_swap(cache, cache->head, cache->lrs);
	cache->lrs++;
	if (cache->lrs >= cache->head)
		cache->lrs = 0;
	if (mlx5e_rx_cache_page_busy(cache, cache->head))
		goto err_no_page;

	rq->stats.cache_reuse++;
	*dma_info = cache->page_cache[cache->head--];

	return true;

err_no_page:
	cache->reduce.successive = 0;

	return false;
}

static inline int mlx5e_page_alloc_mapped(struct mlx5e_rq *rq,
					  struct mlx5e_dma_info *dma_info)
{
	if (!mlx5e_rx_cache_get(rq, dma_info)) {
		dma_info->page = dev_alloc_page();
		if (unlikely(!dma_info->page))
			return -ENOMEM;
		rq->stats.cache_alloc++;
	}

	dma_info->addr = dma_map_page(rq->pdev, dma_info->page, 0,
				      PAGE_SIZE, rq->buff.map_dir);
	if (unlikely(dma_mapping_error(rq->pdev, dma_info->addr))) {
		put_page(dma_info->page);
		dma_info->page = NULL;
		return -ENOMEM;
	}

	return 0;
}

void mlx5e_page_release(struct mlx5e_rq *rq, struct mlx5e_dma_info *dma_info,
			bool recycle)
{
	dma_unmap_page(rq->pdev, dma_info->addr, PAGE_SIZE,
		       rq->buff.map_dir);

	if (likely(recycle) && mlx5e_rx_cache_put(rq, dma_info))
		return;

	put_page(dma_info->page);
}

static inline struct mlx5e_dma_info *get_frag_di(struct mlx5e_wqe_frag_info *wi)
{
	return wi->di;
}

static inline int mlx5e_get_rx_frag(struct mlx5e_rq *rq,
				    struct mlx5e_wqe_frag_info *frag)
{
	if (!frag->offset) {
		/* replenish page */
		int err;

		err = mlx5e_page_alloc_mapped(rq, get_frag_di(frag));
		if (unlikely(err))
			return err;
	}

	return 0;
}

static inline void mlx5e_put_rx_frag(struct mlx5e_rq *rq,
				     struct mlx5e_wqe_frag_info *frag,
				     bool recycle)
{
	if (frag->last_in_page)
		mlx5e_page_release(rq, get_frag_di(frag), recycle);
}

static int mlx5e_alloc_rx_wqe(struct mlx5e_rq *rq, struct mlx5e_rx_wqe_cyc *wqe, u16 ix)
{
	struct mlx5e_wqe_frag_info *frags = &rq->wqe.frags[ix << rq->wqe.log_num_frags];
	int err;
	int i;

	for (i = 0; i < rq->wqe.num_frags; i++, frags++) {
		err = mlx5e_get_rx_frag(rq, frags);
		if (unlikely(err))
			goto free_frags;

		wqe->data[i].addr = cpu_to_be64(get_frag_di(frags)->addr +
						frags->offset + rq->buff.headroom);
	}

	return 0;

free_frags:
	while (--i >= 0)
		mlx5e_put_rx_frag(rq, --frags, true);

	return err;
}

static inline void mlx5e_free_rx_wqe(struct mlx5e_rq *rq,
				     struct mlx5e_wqe_frag_info *wi,
				     bool recycle)
{
	int i;

	for (i = 0; i < rq->wqe.num_frags; i++, wi++)
		mlx5e_put_rx_frag(rq, wi, recycle);
}

void mlx5e_dealloc_rx_wqe(struct mlx5e_rq *rq, u16 ix)
{
	struct mlx5e_wqe_frag_info *wi = &rq->wqe.frags[ix << rq->wqe.log_num_frags];

	mlx5e_free_rx_wqe(rq, wi, false);
}

static int mlx5e_alloc_rx_wqes(struct mlx5e_rq *rq,
			       u16 ix, u8 wqe_bulk)
{
	struct mlx5_wq_cyc *wq = &rq->wqe.wq;
	int err;
	int i;

	for (i = 0; i < wqe_bulk; i++) {
		struct mlx5e_rx_wqe_cyc *wqe = mlx5_wq_cyc_get_wqe(wq, ix + i);

		err = mlx5e_alloc_rx_wqe(rq, wqe, ix + i);
		if (unlikely(err))
			goto free_wqes;
	}

	return 0;

free_wqes:
	while (--i >= 0)
		mlx5e_dealloc_rx_wqe(rq, ix + i);

	return err;
}

static inline void mlx5e_add_skb_frag(struct mlx5e_rq *rq,
				      struct sk_buff *skb,
				      struct mlx5e_dma_info *di,
				      u32 frag_offset, u32 len,
				      unsigned int truesize)
{
	dma_sync_single_for_cpu(rq->pdev,
				di->addr + frag_offset,
				len, DMA_FROM_DEVICE);
	page_ref_inc(di->page);
	skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags,
			di->page, frag_offset, len, truesize);
}

static inline void
mlx5e_copy_skb_header_mpwqe(struct device *pdev,
			    struct sk_buff *skb,
			    struct mlx5e_dma_info *dma_info,
			    u32 offset, u32 headlen)
{
	u16 headlen_pg = min_t(u32, headlen, PAGE_SIZE - offset);
	unsigned int len;

	 /* Aligning len to sizeof(long) optimizes memcpy performance */
	len = ALIGN(headlen_pg, sizeof(long));
	dma_sync_single_for_cpu(pdev, dma_info->addr + offset, len,
				DMA_FROM_DEVICE);
	skb_copy_to_linear_data_offset(skb, 0,
				       page_address(dma_info->page) + offset,
				       len);
	if (unlikely(offset + headlen > PAGE_SIZE)) { /* flow not possible in legacy RQ */
		dma_info++;
		headlen_pg = len;
		len = ALIGN(headlen - headlen_pg, sizeof(long));
		dma_sync_single_for_cpu(pdev, dma_info->addr, len,
					DMA_FROM_DEVICE);
		skb_copy_to_linear_data_offset(skb, headlen_pg,
					       page_address(dma_info->page),
					       len);
	}
}

static inline void mlx5e_post_umr_wqe(struct mlx5e_rq *rq, u16 ix)
{
	struct mlx5e_mpw_info *wi = &rq->mpwqe.info[ix];
	struct mlx5e_icosq *sq = &rq->channel->icosq;
	struct mlx5_wq_cyc *wq = &sq->wq;
	struct mlx5e_umr_wqe *wqe;
	u8 num_wqebbs = DIV_ROUND_UP(sizeof(*wqe), MLX5_SEND_WQE_BB);
	u16 pi;

	/* fill sq edge with nops to avoid wqe wrap around */
	while ((pi = (sq->pc & wq->sz_m1)) > sq->edge) {
		sq->db.ico_wqe[pi].opcode = MLX5_OPCODE_NOP;
		mlx5e_post_nop(wq, sq->sqn, &sq->pc);
	}

	wqe = mlx5_wq_cyc_get_wqe(wq, pi);
	memcpy(wqe, &wi->umr.wqe, sizeof(*wqe));
	wqe->ctrl.opmod_idx_opcode =
		cpu_to_be32((sq->pc << MLX5_WQE_CTRL_WQE_INDEX_SHIFT) |
			    MLX5_OPCODE_UMR);

	sq->db.ico_wqe[pi].opcode = MLX5_OPCODE_UMR;
	sq->pc += num_wqebbs;
	mlx5e_notify_hw(&sq->wq, sq->pc, sq->uar_map, &wqe->ctrl);
}

static int mlx5e_alloc_rx_umr_mpwqe(struct mlx5e_rq *rq,
				    u16 ix)
{
	struct mlx5e_mpw_info *wi = &rq->mpwqe.info[ix];
	struct mlx5e_dma_info *dma_info = &wi->umr.dma_info[0];
	int err;
	int i;

	for (i = 0; i < MLX5_MPWRQ_PAGES_PER_WQE; i++, dma_info++) {
		err = mlx5e_page_alloc_mapped(rq, dma_info);
		if (unlikely(err))
			goto err_unmap;
		wi->umr.mtt[i] = cpu_to_be64(dma_info->addr | MLX5_EN_WR);
	}

	wi->consumed_strides = 0;

	return 0;

err_unmap:
	while (--i >= 0) {
		dma_info--;
		mlx5e_page_release(rq, dma_info, true);
	}

	return err;
}

void mlx5e_free_rx_mpwqe(struct mlx5e_rq *rq, struct mlx5e_mpw_info *wi,
			 bool recycle)
{
	struct mlx5e_dma_info *dma_info = &wi->umr.dma_info[0];
	int i;

	for (i = 0; i < MLX5_MPWRQ_PAGES_PER_WQE; i++, dma_info++)
		mlx5e_page_release(rq, dma_info, recycle);
}

static void mlx5e_post_rx_mpwqe(struct mlx5e_rq *rq)
{
	struct mlx5_wq_ll *wq = &rq->mpwqe.wq;
	struct mlx5e_rx_wqe_ll *wqe = mlx5_wq_ll_get_wqe(wq, wq->head);

	rq->mpwqe.umr_in_progress = false;

	mlx5_wq_ll_push(wq, be16_to_cpu(wqe->next.next_wqe_index));

	/* ensure wqes are visible to device before updating doorbell record */
	dma_wmb();

	mlx5_wq_ll_update_db_record(wq);

	mlx5e_rx_cache_may_reduce(rq);
}

static int mlx5e_alloc_rx_mpwqe(struct mlx5e_rq *rq, u16 ix)
{
	int err;

	err = mlx5e_alloc_rx_umr_mpwqe(rq, ix);
	if (unlikely(err)) {
		rq->stats.buff_alloc_err++;
		return err;
	}
	rq->mpwqe.umr_in_progress = true;
	mlx5e_post_umr_wqe(rq, ix);
	return 0;
}

void mlx5e_dealloc_rx_mpwqe(struct mlx5e_rq *rq, u16 ix)
{
	struct mlx5e_mpw_info *wi = &rq->mpwqe.info[ix];

	mlx5e_free_rx_mpwqe(rq, wi, false);
}

bool mlx5e_post_rx_wqes(struct mlx5e_rq *rq)
{
	struct mlx5_wq_cyc *wq = &rq->wqe.wq;
	u8 wqe_bulk;
	int err;

	if (unlikely(!MLX5E_TEST_BIT(rq->state, MLX5E_RQ_STATE_ENABLED)))
		return false;

	wqe_bulk = rq->wqe.wqe_bulk;

	if (mlx5_wq_cyc_missing(wq) < wqe_bulk)
		return false;

	do {
		u16 head = mlx5_wq_cyc_get_head(wq);

		err = mlx5e_alloc_rx_wqes(rq, head, wqe_bulk);
		if (unlikely(err)) {
			rq->stats.buff_alloc_err++;
			break;
		}

		mlx5_wq_cyc_push_n(wq, wqe_bulk);
	} while (mlx5_wq_cyc_missing(wq) >= wqe_bulk);

	/* ensure wqes are visible to device before updating doorbell record */
	dma_wmb();

	mlx5_wq_cyc_update_db_record(wq);

	mlx5e_rx_cache_may_reduce(rq);

	return !!err;
}

static inline void mlx5e_poll_ico_single_cqe(struct mlx5e_cq *cq,
					     struct mlx5e_icosq *sq,
					     struct mlx5e_rq *rq,
					     struct mlx5_cqe64 *cqe)
{
	struct mlx5_wq_cyc *wq = &sq->wq;
	u16 ci = be16_to_cpu(cqe->wqe_counter) & wq->sz_m1;
	struct mlx5e_sq_wqe_info *icowi = &sq->db.ico_wqe[ci];

	mlx5_cqwq_pop(&cq->wq);

	if (unlikely((cqe->op_own >> 4) != MLX5_CQE_REQ)) {
		WARN_ONCE(true, "mlx5e: Bad OP in ICOSQ CQE: 0x%x\n",
			  cqe->op_own);
		return;
	}

	if (likely(icowi->opcode == MLX5_OPCODE_UMR)) {
		mlx5e_post_rx_mpwqe(rq);
		return;
	}

	if (unlikely(icowi->opcode != MLX5_OPCODE_NOP))
		WARN_ONCE(true,
			  "mlx5e: Bad OPCODE in ICOSQ WQE info: 0x%x\n",
			  icowi->opcode);
}

static void mlx5e_poll_ico_cq(struct mlx5e_cq *cq, struct mlx5e_rq *rq)
{
	struct mlx5e_icosq *sq = container_of(cq, struct mlx5e_icosq, cq);
	struct mlx5_cqe64 *cqe;

	if (unlikely(!MLX5E_TEST_BIT(sq->state, MLX5E_SQ_STATE_ENABLED)))
		return;

	cqe = mlx5_cqwq_get_cqe(&cq->wq);
	if (likely(!cqe))
		return;

	/* by design, there's only a single cqe */
	mlx5e_poll_ico_single_cqe(cq, sq, rq, cqe);

	mlx5_cqwq_update_db_record(&cq->wq);
}

bool mlx5e_post_rx_mpwqes(struct mlx5e_rq *rq)
{
	struct mlx5_wq_ll *wq = &rq->mpwqe.wq;

	if (unlikely(!MLX5E_TEST_BIT(rq->state, MLX5E_RQ_STATE_ENABLED)))
		return false;

	mlx5e_poll_ico_cq(&rq->channel->icosq.cq, rq);

	if (mlx5_wq_ll_is_full(wq))
		return false;

	if (!rq->mpwqe.umr_in_progress)
		mlx5e_alloc_rx_mpwqe(rq, wq->head);

	return true;
}

static void mlx5e_lro_update_hdr(struct sk_buff *skb, struct mlx5_cqe64 *cqe,
				 u32 cqe_bcnt)
{
	struct ethhdr	*eth = (struct ethhdr *)(skb->data);
	struct tcphdr	*tcp;
	int network_depth = 0;
	__be16 proto;
	u16 tot_len;
	void *ip_p;

	u8 l4_hdr_type = get_cqe_l4_hdr_type(cqe);
	u8 tcp_ack = (l4_hdr_type == CQE_L4_HDR_TYPE_TCP_ACK_NO_DATA) ||
		(l4_hdr_type == CQE_L4_HDR_TYPE_TCP_ACK_AND_DATA);

	proto = __vlan_get_protocol(skb, eth->h_proto, &network_depth);

	tot_len = cqe_bcnt - network_depth;
	ip_p = skb->data + network_depth;

	if (proto == htons(ETH_P_IP)) {
		struct iphdr *ipv4 = ip_p;

		tcp = ip_p + sizeof(struct iphdr);
		skb_shinfo(skb)->gso_type = SKB_GSO_TCPV4;

		ipv4->ttl               = cqe->lro_min_ttl;
		ipv4->tot_len           = cpu_to_be16(tot_len);
		ipv4->check             = 0;
		ipv4->check             = ip_fast_csum((unsigned char *)ipv4,
						       ipv4->ihl);
	} else {
		struct ipv6hdr *ipv6 = ip_p;

		tcp = ip_p + sizeof(struct ipv6hdr);
		skb_shinfo(skb)->gso_type = SKB_GSO_TCPV6;

		ipv6->hop_limit         = cqe->lro_min_ttl;
		ipv6->payload_len       = cpu_to_be16(tot_len -
						      sizeof(struct ipv6hdr));
	}

	tcp->psh = get_cqe_lro_tcppsh(cqe);

	if (tcp_ack) {
		tcp->ack                = 1;
		tcp->ack_seq            = cqe->lro_ack_seq_num;
		tcp->window             = cqe->lro_tcp_win;
	}
}

static inline void mlx5e_skb_set_hash(struct mlx5_cqe64 *cqe,
				      struct sk_buff *skb)
{
	u8 cht = cqe->rss_hash_type;
	int ht = (cht & CQE_RSS_HTYPE_L4) ? PKT_HASH_TYPE_L4 :
		 (cht & CQE_RSS_HTYPE_IP) ? PKT_HASH_TYPE_L3 :
					    PKT_HASH_TYPE_NONE;
	skb_set_hash(skb, be32_to_cpu(cqe->rss_hash_result), ht);
}

static inline bool is_last_ethertype_ip(struct sk_buff *skb, int *network_depth)
{
	__be16 ethertype = ((struct ethhdr *)skb->data)->h_proto;

	ethertype = __vlan_get_protocol(skb, ethertype, network_depth);
	return (ethertype == htons(ETH_P_IP) || ethertype == htons(ETH_P_IPV6));
}

static inline void mlx5e_handle_csum(struct net_device *netdev,
				     struct mlx5_cqe64 *cqe,
				     struct mlx5e_rq *rq,
				     struct sk_buff *skb,
				     bool   lro)
{
	int network_depth = 0;

	if (unlikely(!(netdev->features & NETIF_F_RXCSUM)))
		goto csum_none;

	if (lro) {
		skb->ip_summed = CHECKSUM_UNNECESSARY;
		rq->stats.csum_unnecessary++;
		return;
	}

	if (is_last_ethertype_ip(skb, &network_depth)) {
		skb->ip_summed = CHECKSUM_COMPLETE;
		skb->csum = csum_unfold((__force __sum16)cqe->check_sum);
		if (network_depth > ETH_HLEN)
			/* CQE csum is calculated from the IP header and does
			 * not cover VLAN headers (if present). This will add
			 * the checksum manually.
			 */
			skb->csum = csum_partial(skb->data + ETH_HLEN,
						 network_depth - ETH_HLEN,
						 skb->csum);
		rq->stats.csum_complete++;
		return;
	}

	if (likely((cqe->hds_ip_ext & CQE_L3_OK) &&
		   (cqe->hds_ip_ext & CQE_L4_OK))) {
		skb->ip_summed = CHECKSUM_UNNECESSARY;
		if (cqe_is_tunneled(cqe)) {
			skb->csum_level = 1;
			skb->encapsulation = 1;
			rq->stats.csum_unnecessary_inner++;
			return;
		}
		rq->stats.csum_unnecessary++;
		return;
	}
csum_none:
	skb->ip_summed = CHECKSUM_NONE;
	rq->stats.csum_none++;
}

static inline void mlx5e_build_rx_skb(struct mlx5_cqe64 *cqe,
				      u32 cqe_bcnt,
				      struct mlx5e_rq *rq,
				      struct sk_buff *skb)
{
	struct net_device *netdev = rq->netdev;
	int lro_num_seg;

	skb->mac_len = ETH_HLEN;
	lro_num_seg = be32_to_cpu(cqe->srqn) >> 24;
	if (lro_num_seg > 1) {
		mlx5e_lro_update_hdr(skb, cqe, cqe_bcnt);
		skb_shinfo(skb)->gso_size = DIV_ROUND_UP(cqe_bcnt, lro_num_seg);
		/* Subtract one since we already counted this as one
		 * "regular" packet in mlx5e_complete_rx_cqe()
		 */
		rq->stats.packets += lro_num_seg - 1;
		rq->stats.lro_packets++;
		rq->stats.lro_bytes += cqe_bcnt;
	}

	if (unlikely(mlx5e_rx_hw_stamp(rq->tstamp)))
		skb_hwtstamps(skb)->hwtstamp =
				mlx5_timecounter_cyc2time(rq->clock, get_cqe_ts(cqe));

	skb_record_rx_queue(skb, rq->ix);

	if (likely(netdev->features & NETIF_F_RXHASH))
		mlx5e_skb_set_hash(cqe, skb);

	if (cqe_has_vlan(cqe)) {
		__vlan_hwaccel_put_tag(skb, htons(ETH_P_8021Q),
				       be16_to_cpu(cqe->vlan_info));
		rq->stats.removed_vlan_packets++;
	}

	skb->mark = be32_to_cpu(cqe->sop_drop_qpn) & MLX5E_TC_FLOW_ID_MASK;

	mlx5e_handle_csum(netdev, cqe, rq, skb, !!lro_num_seg);

	skb->protocol = eth_type_trans(skb, netdev);
	if (unlikely(mlx5_get_cqe_ft(cqe) ==
		     cpu_to_be32(MLX5_FS_OFFLOAD_FLOW_TAG)))
		skb->protocol = 0xffff;
}

static inline void mlx5e_complete_rx_cqe(struct mlx5e_rq *rq,
					 struct mlx5_cqe64 *cqe,
					 u32 cqe_bcnt,
					 struct sk_buff *skb)
{
	u8 l4_hdr_type = get_cqe_l4_hdr_type(cqe);

	rq->stats.packets++;
	rq->stats.bytes += cqe_bcnt;
	mlx5e_build_rx_skb(cqe, cqe_bcnt, rq, skb);

	if (l4_hdr_type != CQE_L4_HDR_TYPE_TCP_ACK_NO_DATA) {
		rq->dim_obj.sample.pkt_ctr  = rq->stats.packets;
		rq->dim_obj.sample.byte_ctr = rq->stats.bytes;
	}
}

static inline void mlx5e_xmit_xdp_doorbell(struct mlx5e_xdpsq *sq)
{
	struct mlx5_wq_cyc *wq = &sq->wq;
	struct mlx5e_tx_wqe *wqe;
	u16 pi = (sq->pc - 1) & wq->sz_m1; /* last pi */

	wqe  = mlx5_wq_cyc_get_wqe(wq, pi);

	mlx5e_notify_hw(wq, sq->pc, sq->uar_map, &wqe->ctrl);
}

static inline bool mlx5e_xmit_xdp_frame(struct mlx5e_rq *rq,
					struct mlx5e_dma_info *di,
					const struct xdp_buff *xdp)
{
	struct mlx5e_xdpsq       *sq   = &rq->xdpsq;
	struct mlx5_wq_cyc       *wq   = &sq->wq;
	u16                       pi   = sq->pc & wq->sz_m1;
	struct mlx5e_tx_wqe      *wqe  = mlx5_wq_cyc_get_wqe(wq, pi);

	struct mlx5_wqe_ctrl_seg *cseg = &wqe->ctrl;
	struct mlx5_wqe_eth_seg  *eseg = &wqe->eth;
	struct mlx5_wqe_data_seg *dseg;

	ptrdiff_t data_offset = xdp->data - xdp->data_hard_start;
	dma_addr_t dma_addr  = di->addr + data_offset;
	unsigned int dma_len = xdp->data_end - xdp->data;

	prefetchw(wqe);

	if (unlikely(dma_len < MLX5E_XDP_MIN_INLINE ||
		     MLX5E_SW2HW_MTU(rq->channel->priv, rq->netdev->mtu) < dma_len)) {
		rq->stats.xdp_drop++;
		return false;
	}

	if (unlikely(!mlx5e_wqc_has_room_for(wq, sq->cc, sq->pc, 1))) {
		if (sq->db.doorbell) {
			/* SQ is full, ring doorbell */
			mlx5e_xmit_xdp_doorbell(sq);
			sq->db.doorbell = false;
		}
		rq->stats.xdp_tx_full++;
		return false;
	}

	dma_sync_single_for_device(sq->pdev, dma_addr, dma_len, PCI_DMA_TODEVICE);

	cseg->fm_ce_se = 0;

	dseg = (struct mlx5_wqe_data_seg *)eseg + 1;

	/* copy the inline part if required */
	if (sq->min_inline_mode != MLX5_INLINE_MODE_NONE) {
		memcpy(eseg->inline_hdr.start, xdp->data, MLX5E_XDP_MIN_INLINE);
		eseg->inline_hdr.sz = cpu_to_be16(MLX5E_XDP_MIN_INLINE);
		dma_len  -= MLX5E_XDP_MIN_INLINE;
		dma_addr += MLX5E_XDP_MIN_INLINE;
		dseg++;
	}

	/* write the dma part */
	dseg->addr       = cpu_to_be64(dma_addr);
	dseg->byte_count = cpu_to_be32(dma_len);

	cseg->opmod_idx_opcode = cpu_to_be32((sq->pc << 8) | MLX5_OPCODE_SEND);

	/* move page to reference to sq responsibility,
	 * and mark so it's not put back in page-cache.
	 */
	__set_bit(MLX5E_RQ_FLAG_XDP_XMIT, rq->flags); /* non-atomic */
	sq->db.di[pi] = *di;
	sq->pc++;

	sq->db.doorbell = true;

	rq->stats.xdp_tx++;
	return true;
}

/* returns true if packet was consumed by xdp */
static inline int mlx5e_xdp_handle(struct mlx5e_rq *rq,
				   struct mlx5e_dma_info *di,
				   void *va, u16 *rx_headroom, u32 *len)
{
	const struct bpf_prog *prog = READ_ONCE(rq->xdp_prog);
	struct xdp_buff xdp;
	u32 act;

	if (!prog)
		return false;

	xdp.data = va + *rx_headroom;
	xdp_set_data_meta_invalid(&xdp);
	xdp.data_end = xdp.data + *len;
	xdp.data_hard_start = va;

	act = bpf_prog_run_xdp(prog, &xdp);
	switch (act) {
	case XDP_PASS:
		*rx_headroom = xdp.data - xdp.data_hard_start;
		*len = xdp.data_end - xdp.data;
		return false;
	case XDP_TX:
		if (unlikely(!mlx5e_xmit_xdp_frame(rq, di, &xdp)))
			trace_xdp_exception(rq->netdev, prog, act);
		return true;
	default:
		bpf_warn_invalid_xdp_action(act);
	case XDP_ABORTED:
		trace_xdp_exception(rq->netdev, prog, act);
	case XDP_DROP:
		rq->stats.xdp_drop++;
		return true;
	}
}

struct sk_buff *
mlx5e_skb_from_cqe_linear(struct mlx5e_rq *rq, struct mlx5_cqe64 *cqe,
			  struct mlx5e_wqe_frag_info *wi, u32 cqe_bcnt)
{
	struct mlx5e_dma_info *di = get_frag_di(wi);
	u16 rx_headroom = rq->buff.headroom;
	struct sk_buff *skb;
	void *va, *data;
	bool consumed;
	u32 frag_size;

	if (unlikely((cqe->op_own >> 4) != MLX5_CQE_RESP_SEND)) {
		rq->stats.wqe_err++;
		return NULL;
	}

	va             = page_address(di->page) + wi->offset;
	data           = va + rx_headroom;
	frag_size      = MLX5_SKB_FRAG_SZ(rx_headroom + cqe_bcnt);

	dma_sync_single_range_for_cpu(rq->pdev, di->addr, wi->offset,
				      frag_size, DMA_FROM_DEVICE);
	prefetch(data);

	rcu_read_lock();
	consumed = mlx5e_xdp_handle(rq, di, va, &rx_headroom, &cqe_bcnt);
	rcu_read_unlock();
	if (consumed)
		return NULL; /* page/packet was consumed by XDP */

	skb = build_skb(va, frag_size);
	if (unlikely(!skb)) {
		rq->stats.buff_alloc_err++;
		return NULL;
	}

	/* queue up for recycling/reuse */
	page_ref_inc(di->page);

	skb_reserve(skb, rx_headroom);
	skb_put(skb, cqe_bcnt);

	return skb;
}

struct sk_buff *
mlx5e_skb_from_cqe_nonlinear(struct mlx5e_rq *rq, struct mlx5_cqe64 *cqe,
			     struct mlx5e_wqe_frag_info *wi, u32 cqe_bcnt)
{
	u16 headlen = min_t(u16, MLX5_RX_MAX_HEAD, cqe_bcnt);
	u16 frag_headlen = headlen;
	u32 byte_cnt       = cqe_bcnt - headlen;
	struct mlx5e_wqe_frag_info *head_wi = wi;
	struct sk_buff *skb;
	struct mlx5e_rq_frag_info *frag_info = &rq->wqe.frag_info[0];

	if (unlikely((cqe->op_own >> 4) != MLX5_CQE_RESP_SEND)) {
		rq->stats.wqe_err++;
		return NULL;
	}

	skb = napi_alloc_skb(rq->cq.napi,
			     ALIGN(MLX5_RX_MAX_HEAD, sizeof(long)));
	if (unlikely(!skb)) {
		rq->stats.buff_alloc_err++;
		return NULL;
	}

	prefetchw(skb->data);

	while (byte_cnt) {
		u32 frag_consumed_bytes =
			min_t(u32, frag_info->frag_size - frag_headlen, byte_cnt);

		mlx5e_add_skb_frag(rq, skb, get_frag_di(wi),
				   wi->offset + frag_headlen,
				   frag_consumed_bytes, frag_info->frag_stride);
		byte_cnt -= frag_consumed_bytes;
		frag_headlen = 0;
		frag_info++;
		wi++;
	}

	/* copy header */
	mlx5e_copy_skb_header_mpwqe(rq->pdev, skb,
				    get_frag_di(head_wi),
				    head_wi->offset, headlen);
	/* skb linear part was allocated with headlen and aligned to long */
	skb->tail += headlen;
	skb->len  += headlen;

	return skb;
}

void mlx5e_handle_rx_cqe(struct mlx5e_rq *rq, struct mlx5_cqe64 *cqe)
{
	struct mlx5_wq_cyc *wq = &rq->wqe.wq;
	struct mlx5e_wqe_frag_info *wi;
	struct mlx5e_rx_wqe_cyc *wqe;
	struct sk_buff *skb;
	u32 cqe_bcnt;
	u16 ci;

	ci             = be16_to_cpu(cqe->wqe_counter) & wq->sz_m1;
	wqe            = mlx5_wq_cyc_get_wqe(wq, ci);
	wi             = &rq->wqe.frags[ci << rq->wqe.log_num_frags];
	cqe_bcnt       = be32_to_cpu(cqe->byte_cnt);

	skb = rq->wqe.skb_from_cqe(rq, cqe, wi, cqe_bcnt);
	if (!skb) {
		/* probably for XDP */
		if (__test_and_clear_bit(MLX5E_RQ_FLAG_XDP_XMIT, rq->flags)) {
			/* do not return page to cache,
			 * it will be returned on XDP_TX completion.
			 */
			goto wq_ll_pop;
		}
		goto free_wqe;
	}

	mlx5e_complete_rx_cqe(rq, cqe, cqe_bcnt, skb);
	napi_gro_receive(rq->cq.napi, skb);

free_wqe:
	mlx5e_free_rx_wqe(rq, wi, true);
wq_ll_pop:
	mlx5_wq_cyc_pop(wq);
}

#ifdef CONFIG_MLX5_ESWITCH
void mlx5e_handle_rx_cqe_rep(struct mlx5e_rq *rq, struct mlx5_cqe64 *cqe)
{
	struct net_device *netdev = rq->netdev;
	struct mlx5e_priv *priv = netdev_priv(netdev);
	struct mlx5e_rep_priv *rpriv  = priv->ppriv;
	struct mlx5_eswitch_rep *rep = rpriv->rep;
	struct mlx5e_rep_context *context;
	struct mlx5_wq_cyc *wq = &rq->wqe.wq;
	struct mlx5e_wqe_frag_info *wi;
	struct mlx5e_rx_wqe_cyc *wqe;
	struct sk_buff *skb;
	u32 cqe_bcnt;
	u16 ci;

	ci             = be16_to_cpu(cqe->wqe_counter) & wq->sz_m1;
	wqe            = mlx5_wq_cyc_get_wqe(wq, ci);
	wi             = &rq->wqe.frags[ci << rq->wqe.log_num_frags];
	cqe_bcnt       = be32_to_cpu(cqe->byte_cnt);

	skb = rq->wqe.skb_from_cqe(rq, cqe, wi, cqe_bcnt);
	if (!skb) {
		/* probably for XDP */
		if (__test_and_clear_bit(MLX5E_RQ_FLAG_XDP_XMIT, rq->flags)) {
			/* do not return page to cache,
			 * it will be returned on XDP_TX completion.
			 */
			goto wq_ll_pop;
		}
		goto free_wqe;
	}

	mlx5e_complete_rx_cqe(rq, cqe, cqe_bcnt, skb);

	context = mlx5e_rep_to_context(rep);
	if (context->vlan && skb_vlan_tag_present(skb))
		skb_vlan_pop(skb);

	napi_gro_receive(rq->cq.napi, skb);

free_wqe:
	mlx5e_free_rx_wqe(rq, wi, true);
wq_ll_pop:
	mlx5_wq_cyc_pop(wq);
}
#endif

static inline void mlx5e_mpwqe_fill_rx_skb(struct mlx5e_rq *rq,
					   struct mlx5_cqe64 *cqe,
					   struct mlx5e_mpw_info *wi,
					   u32 cqe_bcnt,
					   struct sk_buff *skb)
{
	u16 stride_ix      = mpwrq_get_cqe_stride_index(cqe);
	u32 wqe_offset     = stride_ix << rq->mpwqe.log_stride_sz;
	u32 head_offset    = wqe_offset & (PAGE_SIZE - 1);
	u32 page_idx       = wqe_offset >> PAGE_SHIFT;
	struct mlx5e_dma_info *di = &wi->umr.dma_info[page_idx];
	struct mlx5e_dma_info *head_di = di;
	u16 headlen = min_t(u16, MLX5_RX_MAX_HEAD, cqe_bcnt);
	u32 frag_offset    = head_offset + headlen;
	u16 byte_cnt       = cqe_bcnt - headlen;

	if (unlikely(frag_offset >= PAGE_SIZE)) {
		di++;
		frag_offset -= PAGE_SIZE;
	}

	while (byte_cnt) {
		u32 pg_consumed_bytes =
			min_t(u32, PAGE_SIZE - frag_offset, byte_cnt);
		unsigned int truesize =
			ALIGN(pg_consumed_bytes, BIT(rq->mpwqe.log_stride_sz));

		mlx5e_add_skb_frag(rq, skb, di, frag_offset,
				   pg_consumed_bytes, truesize);
		byte_cnt -= pg_consumed_bytes;
		frag_offset = 0;
		di++;
	}
	/* copy header */
	mlx5e_copy_skb_header_mpwqe(rq->pdev, skb, head_di,
				    head_offset, headlen);
	/* skb linear part was allocated with headlen and aligned to long */
	skb->tail += headlen;
	skb->len  += headlen;
}

void mlx5e_handle_rx_cqe_mpwrq(struct mlx5e_rq *rq, struct mlx5_cqe64 *cqe)
{
	u16 cstrides       = mpwrq_get_cqe_consumed_strides(cqe);
	u16 wqe_id         = be16_to_cpu(cqe->wqe_id);
	struct mlx5e_mpw_info *wi = &rq->mpwqe.info[wqe_id];
	struct mlx5e_rx_wqe_ll *wqe = mlx5_wq_ll_get_wqe(&rq->mpwqe.wq, wqe_id);
	struct sk_buff *skb;
	u16 cqe_bcnt;

	wi->consumed_strides += cstrides;

	if (unlikely((cqe->op_own >> 4) != MLX5_CQE_RESP_SEND)) {
		rq->stats.wqe_err++;
		goto mpwrq_cqe_out;
	}

	if (unlikely(mpwrq_is_filler_cqe(cqe))) {
		rq->stats.mpwqe_filler++;
		goto mpwrq_cqe_out;
	}

	skb = napi_alloc_skb(rq->cq.napi,
			     ALIGN(MLX5_RX_MAX_HEAD, sizeof(long)));
				   sizeof(long)));
	if (unlikely(!skb)) {
		rq->stats.buff_alloc_err++;
		goto mpwrq_cqe_out;
	}

	prefetchw(skb->data);
	cqe_bcnt = mpwrq_get_cqe_byte_cnt(cqe);

	mlx5e_mpwqe_fill_rx_skb(rq, cqe, wi, cqe_bcnt, skb);
	mlx5e_complete_rx_cqe(rq, cqe, cqe_bcnt, skb);
	napi_gro_receive(rq->cq.napi, skb);

mpwrq_cqe_out:
	if (likely(wi->consumed_strides < rq->mpwqe.num_strides))
		return;

	mlx5e_free_rx_mpwqe(rq, wi, true);
	mlx5_wq_ll_pop(&rq->mpwqe.wq, cqe->wqe_id, &wqe->next.next_wqe_index);
}

int mlx5e_poll_rx_cq(struct mlx5e_cq *cq, int budget)
{
	struct mlx5e_rq *rq = container_of(cq, struct mlx5e_rq, cq);
	struct mlx5e_xdpsq *xdpsq;
	struct mlx5_cqe64 *cqe;
	int work_done = 0;

	if (unlikely(!MLX5E_TEST_BIT(rq->state, MLX5E_RQ_STATE_ENABLED)))
		return 0;

	if (cq->decmprs_left)
		work_done += mlx5e_decompress_cqes_cont(rq, cq, 0, budget);

	cqe = mlx5_cqwq_get_cqe(&cq->wq);
	if (!cqe)
		return 0;

	xdpsq = &rq->xdpsq;

	do {
		if (mlx5_get_cqe_format(cqe) == MLX5_COMPRESSED) {
			work_done +=
				mlx5e_decompress_cqes_start(rq, cq,
							    budget - work_done);
			continue;
		}

		mlx5_cqwq_pop(&cq->wq);

		rq->handle_rx_cqe(rq, cqe);
	} while ((++work_done < budget) && (cqe = mlx5_cqwq_get_cqe(&cq->wq)));

	if (xdpsq->db.doorbell) {
		mlx5e_xmit_xdp_doorbell(xdpsq);
		xdpsq->db.doorbell = false;
	}

	mlx5_cqwq_update_db_record(&cq->wq);

	/* ensure cq space is freed before enabling more cqes */
	wmb();

	return work_done;
}

bool mlx5e_poll_xdpsq_cq(struct mlx5e_cq *cq)
{
	struct mlx5e_xdpsq *sq;
	struct mlx5_cqe64 *cqe;
	struct mlx5e_rq *rq;
	u16 sqcc;
	int i;

	sq = container_of(cq, struct mlx5e_xdpsq, cq);

	if (unlikely(!MLX5E_TEST_BIT(sq->state, MLX5E_SQ_STATE_ENABLED)))
		return false;

	cqe = mlx5_cqwq_get_cqe(&cq->wq);
	if (!cqe)
		return false;

	rq = container_of(sq, struct mlx5e_rq, xdpsq);

	/* sq->cc must be updated only after mlx5_cqwq_update_db_record(),
	 * otherwise a cq overrun may occur
	 */
	sqcc = sq->cc;

	i = 0;
	do {
		u16 wqe_counter;
		bool last_wqe;

		mlx5_cqwq_pop(&cq->wq);

		wqe_counter = be16_to_cpu(cqe->wqe_counter);

		do {
			struct mlx5e_dma_info *di;
			u16 ci;

			last_wqe = (sqcc == wqe_counter);

			ci = sqcc & sq->wq.sz_m1;
			di = &sq->db.di[ci];

			sqcc++;
			/* Recycle RX page */
			mlx5e_page_release(rq, di, true);
		} while (!last_wqe);
	} while ((++i < MLX5E_TX_CQ_POLL_BUDGET) && (cqe = mlx5_cqwq_get_cqe(&cq->wq)));

	mlx5_cqwq_update_db_record(&cq->wq);

	/* ensure cq space is freed before enabling more cqes */
	wmb();

	sq->cc = sqcc;
	return (i == MLX5E_TX_CQ_POLL_BUDGET);
}

void mlx5e_free_xdpsq_descs(struct mlx5e_xdpsq *sq)
{
	struct mlx5e_rq *rq = container_of(sq, struct mlx5e_rq, xdpsq);
	struct mlx5e_dma_info *di;
	u16 ci;

	while (sq->cc != sq->pc) {
		ci = sq->cc & sq->wq.sz_m1;
		di = &sq->db.di[ci];
		sq->cc++;

		mlx5e_page_release(rq, di, false);
	}
}

#ifdef CONFIG_MLX5_CORE_IPOIB

#define MLX5_IB_GRH_DGID_OFFSET 24
#define MLX5_GID_SIZE           16

static inline void mlx5i_complete_rx_cqe(struct mlx5e_rq *rq,
					 struct mlx5_cqe64 *cqe,
					 u32 cqe_bcnt,
					 struct sk_buff *skb)
{
	struct hwtstamp_config *tstamp;
	struct net_device *netdev;
	struct mlx5e_priv *priv;
	char *pseudo_header;
	u32 qpn;
	u8 *dgid;
	u8 g;

	qpn = be32_to_cpu(cqe->sop_drop_qpn) & 0xffffff;
	netdev = mlx5i_pkey_get_netdev(rq->netdev, qpn);

	/* No mapping present, cannot process SKB. This might happen if a child
	 * interface is going down while having unprocessed CQEs on parent RQ
	 */
	if (unlikely(!netdev)) {
		/* TODO: add drop counters support */
		skb->dev = NULL;
		pr_warn_once("Unable to map QPN %u to dev - dropping skb\n", qpn);
		return;
	}

	priv = mlx5i_epriv(netdev);
	tstamp = &priv->tstamp;

	g = (be32_to_cpu(cqe->flags_rqpn) >> 28) & 3;
	dgid = skb->data + MLX5_IB_GRH_DGID_OFFSET;
	if ((!g) || dgid[0] != 0xff)
		skb->pkt_type = PACKET_HOST;
	else if (memcmp(dgid, netdev->broadcast + 4, MLX5_GID_SIZE) == 0)
		skb->pkt_type = PACKET_BROADCAST;
	else
		skb->pkt_type = PACKET_MULTICAST;

	/* TODO: IB/ipoib: Allow mcast packets from other VFs
	 * 68996a6e760e5c74654723eeb57bf65628ae87f4
	 */

	skb_pull(skb, MLX5_IB_GRH_BYTES);

	skb->protocol = *((__be16 *)(skb->data));

	skb->ip_summed = CHECKSUM_COMPLETE;
	skb->csum = csum_unfold((__force __sum16)cqe->check_sum);

	if (unlikely(mlx5e_rx_hw_stamp(tstamp)))
		skb_hwtstamps(skb)->hwtstamp =
				mlx5_timecounter_cyc2time(rq->clock, get_cqe_ts(cqe));

	skb_record_rx_queue(skb, rq->ix);

	if (likely(netdev->features & NETIF_F_RXHASH))
		mlx5e_skb_set_hash(cqe, skb);

	/* 20 bytes of ipoib header and 4 for encap existing */
	pseudo_header = skb_push(skb, MLX5_IPOIB_PSEUDO_LEN);
	memset(pseudo_header, 0, MLX5_IPOIB_PSEUDO_LEN);
	skb_reset_mac_header(skb);
	skb_pull(skb, MLX5_IPOIB_HARD_LEN);

	skb->dev = netdev;

	rq->stats.csum_complete++;
	rq->stats.packets++;
	rq->stats.bytes += cqe_bcnt;
}

void mlx5i_handle_rx_cqe(struct mlx5e_rq *rq, struct mlx5_cqe64 *cqe)
{
	struct mlx5_wq_cyc *wq = &rq->wqe.wq;
	struct mlx5e_wqe_frag_info *wi;
	struct mlx5e_rx_wqe_cyc *wqe;
	struct sk_buff *skb;
	u32 cqe_bcnt;
	u16 ci;

	ci             = be16_to_cpu(cqe->wqe_counter) & wq->sz_m1;
	wqe            = mlx5_wq_cyc_get_wqe(wq, ci);
	wi             = &rq->wqe.frags[ci << rq->wqe.log_num_frags];
	cqe_bcnt       = be32_to_cpu(cqe->byte_cnt);

	skb = rq->wqe.skb_from_cqe(rq, cqe, wi, cqe_bcnt);
	if (!skb)
		goto wq_free_wqe;

	mlx5i_complete_rx_cqe(rq, cqe, cqe_bcnt, skb);
	if (unlikely(!skb->dev)) {
		dev_kfree_skb_any(skb);
		goto wq_free_wqe;
	}
	napi_gro_receive(rq->cq.napi, skb);

wq_free_wqe:
	mlx5e_free_rx_wqe(rq, wi, true);
	mlx5_wq_cyc_pop(wq);
}

#endif /* CONFIG_MLX5_CORE_IPOIB */

#ifdef CONFIG_MLX5_EN_IPSEC

void mlx5e_ipsec_handle_rx_cqe(struct mlx5e_rq *rq, struct mlx5_cqe64 *cqe)
{
	struct mlx5_wq_cyc *wq = &rq->wqe.wq;
	struct mlx5e_wqe_frag_info *wi;
	struct mlx5e_rx_wqe *wqe;
	struct sk_buff *skb;
	u32 cqe_bcnt;
	u16 ci;

	ci             = be16_to_cpu(cqe->wqe_counter) & wq->sz_m1;
	wqe            = mlx5_wq_cyc_get_wqe(wq, ci);
	wi             = &rq->wqe.frags[ci << rq->wqe.log_num_frags];
	cqe_bcnt       = be32_to_cpu(cqe->byte_cnt);

	skb = rq->wqe.skb_from_cqe(rq, cqe, wi, cqe_bcnt);
	if (unlikely(!skb))
		goto free_wqe;

	skb = mlx5e_ipsec_handle_rx_skb(rq->netdev, skb);
	if (unlikely(!skb))
		goto free_wqe;

	mlx5e_complete_rx_cqe(rq, cqe, cqe_bcnt, skb);
	napi_gro_receive(rq->cq.napi, skb);

free_wqe:
	mlx5e_free_rx_wqe(rq, wi, true);
	mlx5_wq_cyc_pop(wq);
}

#endif /* CONFIG_MLX5_EN_IPSEC */
