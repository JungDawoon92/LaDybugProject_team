package com.shepe.admin.rank.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shepe.admin.rank.RankSellIngredientRankingAdminVO;

@Repository
public class RankSellIngredientRankingAdminDaoMybatis {

	@Autowired
	private SqlSessionTemplate rankIngreRanking;
	
	public void insertRankSellIngredientRanking (RankSellIngredientRankingAdminVO ingreRankingvo) {
		rankIngreRanking.insert("adrankSellIngredientRankingDAO.insertRankSellIngredientRanking", ingreRankingvo);
	}
	
	public void updateRankSellIngredientRanking (RankSellIngredientRankingAdminVO ingreRankingvo) {
		rankIngreRanking.update("adrankSellIngredientRankingDAO.updateRankSellIngredientRanking", ingreRankingvo);
	}
	
	public int getRankSellIngredientRankingCnt (RankSellIngredientRankingAdminVO ingreRankingvo) {
		return rankIngreRanking.selectOne("adrankSellIngredientRankingDAO.getRankSellIngredientRankingCnt", ingreRankingvo);
	}
	
	public List<RankSellIngredientRankingAdminVO> getIngredientRankList (RankSellIngredientRankingAdminVO ingreRankingvo) {
		return rankIngreRanking.selectList("adrankSellIngredientRankingDAO.getIngredientRankList", ingreRankingvo);
	}
	
	public List<RankSellIngredientRankingAdminVO> getSellIngredientChart (RankSellIngredientRankingAdminVO ingreRankingvo) {
		return rankIngreRanking.selectList("adrankSellIngredientRankingDAO.getSellIngredientChart", ingreRankingvo);
	}
	
	public List<RankSellIngredientRankingAdminVO> getMonthTopIngredientChart (RankSellIngredientRankingAdminVO ingreRankingvo) {
		return rankIngreRanking.selectList("adrankSellIngredientRankingDAO.getMonthTopIngredientChart", ingreRankingvo);
	}
	
	public List<RankSellIngredientRankingAdminVO> getWeekTopIngredientChart (RankSellIngredientRankingAdminVO ingreRankingvo) {
		return rankIngreRanking.selectList("adrankSellIngredientRankingDAO.getWeekTopIngredientChart", ingreRankingvo);
	}
	
	public List<RankSellIngredientRankingAdminVO> getDayTopIngredientChart (RankSellIngredientRankingAdminVO ingreRankingvo) {
		return rankIngreRanking.selectList("adrankSellIngredientRankingDAO.getDayTopIngredientChart", ingreRankingvo);
	}
	
	public List<RankSellIngredientRankingAdminVO> getRecipeChart (RankSellIngredientRankingAdminVO ingreRankingvo) {
		return rankIngreRanking.selectList("adrankSellIngredientRankingDAO.getRecipeChart", ingreRankingvo);
	}
}
