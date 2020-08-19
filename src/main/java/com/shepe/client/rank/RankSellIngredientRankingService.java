package com.shepe.client.rank;

import java.util.List;

public interface RankSellIngredientRankingService {

	void insertRankSellIngredientRanking (RankSellIngredientRankingVO ingreRankingvo);
	
	void updateRankSellIngredientRanking (RankSellIngredientRankingVO ingreRankingvo);
	
	int getRankSellIngredientRankingCnt (RankSellIngredientRankingVO ingreRankingvo);
	
	/* 1~100까지의 순위를 저장하기 위해 조회하는 리스트 */
	List<RankSellIngredientRankingVO> getIngredientRankList (RankSellIngredientRankingVO ingreRankingvo);
	
	/* 누적 식재료 판매량 리스트 */
	List<RankSellIngredientRankingVO> getRankSellIngredientRankingList (RankSellIngredientRankingVO ingreRankingvo);
}
