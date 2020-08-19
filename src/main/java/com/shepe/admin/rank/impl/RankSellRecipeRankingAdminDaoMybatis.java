package com.shepe.admin.rank.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shepe.admin.rank.RankSellRecipeRankingAdminVO;

@Repository
public class RankSellRecipeRankingAdminDaoMybatis {

	@Autowired
	private SqlSessionTemplate rankRecipeRanking;
	
	
	public void insertRankSellRecipeRanking (RankSellRecipeRankingAdminVO recipeRankingvo) {
		rankRecipeRanking.insert("adrankSellRecipeRankingDAO.insertRankSellRecipeRanking", recipeRankingvo);
	}
	
	public void updateRankSellRecipeRanking (RankSellRecipeRankingAdminVO recipeRankingvo) {
		rankRecipeRanking.update("adrankSellRecipeRankingDAO.updateRankSellRecipeRanking", recipeRankingvo);
	}
	
	public int getRankSellRecipeRankingCnt (RankSellRecipeRankingAdminVO recipeRankingvo) {
		return rankRecipeRanking.selectOne("adrankSellRecipeRankingDAO.getRankSellRecipeRankingCnt", recipeRankingvo);
	}
	
	public List<RankSellRecipeRankingAdminVO> getRecipeRankList (RankSellRecipeRankingAdminVO recipeRankingvo) {
		return rankRecipeRanking.selectList("adrankSellRecipeRankingDAO.getRecipeRankList", recipeRankingvo);
	}
	
	public List<RankSellRecipeRankingAdminVO> getSellRecipeChart (RankSellRecipeRankingAdminVO recipeRankingvo) {
		return rankRecipeRanking.selectList("adrankSellRecipeRankingDAO.getSellRecipeChart", recipeRankingvo);
	}
	
	public List<RankSellRecipeRankingAdminVO> getMonthTopSellRecipeChart (RankSellRecipeRankingAdminVO recipeRankingvo) {
		return rankRecipeRanking.selectList("adrankSellRecipeRankingDAO.getMonthTopSellRecipeChart", recipeRankingvo);
	}
	
	public List<RankSellRecipeRankingAdminVO> getWeekTopSellRecipeChart (RankSellRecipeRankingAdminVO recipeRankingvo) {
		return rankRecipeRanking.selectList("adrankSellRecipeRankingDAO.getWeekTopSellRecipeChart", recipeRankingvo);
	}
	
	public List<RankSellRecipeRankingAdminVO> getDayTopSellRecipeChart (RankSellRecipeRankingAdminVO recipeRankingvo) {
		return rankRecipeRanking.selectList("adrankSellRecipeRankingDAO.getDayTopSellRecipeChart", recipeRankingvo);
	}
	
	public List<RankSellRecipeRankingAdminVO> getSellRecipeAgesChart (RankSellRecipeRankingAdminVO recipeRankingvo) {
		return rankRecipeRanking.selectList("adrankSellRecipeRankingDAO.getSellRecipeAgesChart", recipeRankingvo);
	}
}
