package com.shepe.client.rank.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shepe.client.rank.RankSellIngredientRankingVO;

@Repository
public class RankSellIngredientRankingDaoMybatis {

	@Autowired
	private SqlSessionTemplate rankIngreRanking;
	
	public void insertRankSellIngredientRanking (RankSellIngredientRankingVO ingreRankingvo) {
		rankIngreRanking.insert("rankSellIngredientRankingDAO.insertRankSellIngredientRanking", ingreRankingvo);
	}
	
	public void updateRankSellIngredientRanking (RankSellIngredientRankingVO ingreRankingvo) {
		rankIngreRanking.update("rankSellIngredientRankingDAO.updateRankSellIngredientRanking", ingreRankingvo);
	}
	
	public int getRankSellIngredientRankingCnt (RankSellIngredientRankingVO ingreRankingvo) {
		return rankIngreRanking.selectOne("rankSellIngredientRankingDAO.getRankSellIngredientRankingCnt", ingreRankingvo);
	}
	
	public List<RankSellIngredientRankingVO> getIngredientRankList (RankSellIngredientRankingVO ingreRankingvo) {
		return rankIngreRanking.selectList("rankSellIngredientRankingDAO.getIngredientRankList", ingreRankingvo);
	}
	
	public List<RankSellIngredientRankingVO> getRankSellIngredientRankingList (RankSellIngredientRankingVO ingreRankingvo) {
		return rankIngreRanking.selectList("rankSellIngredientRankingDAO.getRankSellIngredientRankingList", ingreRankingvo);
	}
}
