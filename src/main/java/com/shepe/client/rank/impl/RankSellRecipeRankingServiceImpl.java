package com.shepe.client.rank.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shepe.client.rank.RankSellRecipeRankingService;
import com.shepe.client.rank.RankSellRecipeRankingVO;

@Service
public class RankSellRecipeRankingServiceImpl implements RankSellRecipeRankingService {

	@Autowired
	private RankSellRecipeRankingDaoMybatis rankSellRecipeRankingDAO;
	
	@Override
	public void insertRankSellRecipeRanking(RankSellRecipeRankingVO recipeRankingvo) {
		rankSellRecipeRankingDAO.insertRankSellRecipeRanking(recipeRankingvo);
	}

	@Override
	public void updateRankSellRecipeRanking(RankSellRecipeRankingVO recipeRankingvo) {
		rankSellRecipeRankingDAO.updateRankSellRecipeRanking(recipeRankingvo);
	}

	@Override
	public int getRankSellRecipeRankingCnt(RankSellRecipeRankingVO recipeRankingvo) {
		return rankSellRecipeRankingDAO.getRankSellRecipeRankingCnt(recipeRankingvo);
	}

	@Override
	public List<RankSellRecipeRankingVO> getRecipeRankList(RankSellRecipeRankingVO recipeRankingvo) {
		return rankSellRecipeRankingDAO.getRecipeRankList(recipeRankingvo);
	}

	@Override
	public List<RankSellRecipeRankingVO> getRankSellRecipeRankingList(RankSellRecipeRankingVO recipeRankingvo) {
		return rankSellRecipeRankingDAO.getRankSellRecipeRankingList(recipeRankingvo);
	}

}
