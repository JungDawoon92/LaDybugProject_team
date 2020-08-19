package com.shepe.admin.rank.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shepe.admin.rank.RankSellIngredientRankingAdminService;
import com.shepe.admin.rank.RankSellIngredientRankingAdminVO;

@Service
public class RankSellIngredientRankingAdminServiceImpl implements RankSellIngredientRankingAdminService {

	@Autowired
	private RankSellIngredientRankingAdminDaoMybatis rankSellIngredientRankingDAO;
	
	@Override
	public void insertRankSellIngredientRanking(RankSellIngredientRankingAdminVO ingreRankingvo) {
		rankSellIngredientRankingDAO.insertRankSellIngredientRanking(ingreRankingvo);
	}

	@Override
	public void updateRankSellIngredientRanking(RankSellIngredientRankingAdminVO ingreRankingvo) {
		rankSellIngredientRankingDAO.updateRankSellIngredientRanking(ingreRankingvo);
	}

	@Override
	public int getRankSellIngredientRankingCnt(RankSellIngredientRankingAdminVO ingreRankingvo) {
		return rankSellIngredientRankingDAO.getRankSellIngredientRankingCnt(ingreRankingvo);
	}

	@Override
	public List<RankSellIngredientRankingAdminVO> getIngredientRankList(RankSellIngredientRankingAdminVO ingreRankingvo) {
		return rankSellIngredientRankingDAO.getIngredientRankList(ingreRankingvo);
	}

	@Override
	public List<RankSellIngredientRankingAdminVO> getSellIngredientChart(RankSellIngredientRankingAdminVO ingreRankingvo) {
		return rankSellIngredientRankingDAO.getSellIngredientChart(ingreRankingvo);
	}

	@Override
	public List<RankSellIngredientRankingAdminVO> getMonthTopIngredientChart(RankSellIngredientRankingAdminVO ingreRankingvo) {
		return rankSellIngredientRankingDAO.getMonthTopIngredientChart(ingreRankingvo);
	}

	@Override
	public List<RankSellIngredientRankingAdminVO> getWeekTopIngredientChart(RankSellIngredientRankingAdminVO ingreRankingvo) {
		return rankSellIngredientRankingDAO.getWeekTopIngredientChart(ingreRankingvo);
	}

	@Override
	public List<RankSellIngredientRankingAdminVO> getDayTopIngredientChart(RankSellIngredientRankingAdminVO ingreRankingvo) {
		return rankSellIngredientRankingDAO.getDayTopIngredientChart(ingreRankingvo);
	}

	@Override
	public List<RankSellIngredientRankingAdminVO> getRecipeChart(RankSellIngredientRankingAdminVO ingreRankingvo) {
		return rankSellIngredientRankingDAO.getRecipeChart(ingreRankingvo);
	}

}
