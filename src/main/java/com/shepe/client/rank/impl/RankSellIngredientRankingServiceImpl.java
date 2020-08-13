package com.shepe.client.rank.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shepe.client.rank.RankSellIngredientRankingService;
import com.shepe.client.rank.RankSellIngredientRankingVO;

@Service
public class RankSellIngredientRankingServiceImpl implements RankSellIngredientRankingService {

	@Autowired
	private RankSellIngredientRankingDaoMybatis rankSellIngredientRankingDAO;
	
	@Override
	public void insertRankSellIngredientRanking(RankSellIngredientRankingVO ingreRankingvo) {
		rankSellIngredientRankingDAO.insertRankSellIngredientRanking(ingreRankingvo);
	}

	@Override
	public void updateRankSellIngredientRanking(RankSellIngredientRankingVO ingreRankingvo) {
		rankSellIngredientRankingDAO.updateRankSellIngredientRanking(ingreRankingvo);
	}

	@Override
	public int getRankSellIngredientRankingCnt(RankSellIngredientRankingVO ingreRankingvo) {
		return rankSellIngredientRankingDAO.getRankSellIngredientRankingCnt(ingreRankingvo);
	}

	@Override
	public List<RankSellIngredientRankingVO> getIngredientRankList(RankSellIngredientRankingVO ingreRankingvo) {
		return rankSellIngredientRankingDAO.getIngredientRankList(ingreRankingvo);
	}

	@Override
	public List<RankSellIngredientRankingVO> getRankSellIngredientRankingList(RankSellIngredientRankingVO ingreRankingvo) {
		return rankSellIngredientRankingDAO.getRankSellIngredientRankingList(ingreRankingvo);
	}

}
