package com.shepe.admin.rank.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shepe.admin.rank.RankSellRecipeRankingAdminService;
import com.shepe.admin.rank.RankSellRecipeRankingAdminVO;

@Service
public class RankSellRecipeRankingAdminServiceImpl implements RankSellRecipeRankingAdminService {

	@Autowired
	private RankSellRecipeRankingAdminDaoMybatis rankSellRecipeRankingDAO;
	
	@Override
	public void insertRankSellRecipeRanking(RankSellRecipeRankingAdminVO recipeRankingvo) {
		rankSellRecipeRankingDAO.insertRankSellRecipeRanking(recipeRankingvo);
	}

	@Override
	public void updateRankSellRecipeRanking(RankSellRecipeRankingAdminVO recipeRankingvo) {
		rankSellRecipeRankingDAO.updateRankSellRecipeRanking(recipeRankingvo);
	}

	@Override
	public int getRankSellRecipeRankingCnt(RankSellRecipeRankingAdminVO recipeRankingvo) {
		return rankSellRecipeRankingDAO.getRankSellRecipeRankingCnt(recipeRankingvo);
	}

	@Override
	public List<RankSellRecipeRankingAdminVO> getRecipeRankList(RankSellRecipeRankingAdminVO recipeRankingvo) {
		return rankSellRecipeRankingDAO.getRecipeRankList(recipeRankingvo);
	}

	@Override
	public List<RankSellRecipeRankingAdminVO> getSellRecipeChart(RankSellRecipeRankingAdminVO recipeRankingvo) {
		return rankSellRecipeRankingDAO.getSellRecipeChart(recipeRankingvo);
	}

	@Override
	public List<RankSellRecipeRankingAdminVO> getMonthTopSellRecipeChart(RankSellRecipeRankingAdminVO recipeRankingvo) {
		return rankSellRecipeRankingDAO.getMonthTopSellRecipeChart(recipeRankingvo);
	}

	@Override
	public List<RankSellRecipeRankingAdminVO> getWeekTopSellRecipeChart(RankSellRecipeRankingAdminVO recipeRankingvo) {
		return rankSellRecipeRankingDAO.getWeekTopSellRecipeChart(recipeRankingvo);
	}

	@Override
	public List<RankSellRecipeRankingAdminVO> getDayTopSellRecipeChart(RankSellRecipeRankingAdminVO recipeRankingvo) {
		return rankSellRecipeRankingDAO.getDayTopSellRecipeChart(recipeRankingvo);
	}

	@Override
	public List<RankSellRecipeRankingAdminVO> getSellRecipeAgesChart(RankSellRecipeRankingAdminVO recipeRankingvo) {
		return rankSellRecipeRankingDAO.getSellRecipeAgesChart(recipeRankingvo);
	}

}
