package com.shepe.client.rank.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shepe.client.rank.RankSellRecipeRankingVO;

@Repository
public class RankSellRecipeRankingDaoMybatis {

	@Autowired
	private SqlSessionTemplate rankRecipeRanking;
	
	public void insertRankSellRecipeRanking (RankSellRecipeRankingVO recipeRankingvo) {
		rankRecipeRanking.insert("rankSellRecipeRankingDAO.insertRankSellRecipeRanking", recipeRankingvo);
	}
	
	public void updateRankSellRecipeRanking (RankSellRecipeRankingVO recipeRankingvo) {
		rankRecipeRanking.update("rankSellRecipeRankingDAO.updateRankSellRecipeRanking", recipeRankingvo);
	}
	
	public int getRankSellRecipeRankingCnt (RankSellRecipeRankingVO recipeRankingvo) {
		return rankRecipeRanking.selectOne("rankSellRecipeRankingDAO.getRankSellRecipeRankingCnt", recipeRankingvo);
	}
	
	public List<RankSellRecipeRankingVO> getRecipeRankList (RankSellRecipeRankingVO recipeRankingvo) {
		return rankRecipeRanking.selectList("rankSellRecipeRankingDAO.getRecipeRankList", recipeRankingvo);
	}
	
	public List<RankSellRecipeRankingVO> getRankSellRecipeRankingList (RankSellRecipeRankingVO recipeRankingvo) {
		return rankRecipeRanking.selectList("rankSellRecipeRankingDAO.getRankSellRecipeRankingList", recipeRankingvo);
	}
}
