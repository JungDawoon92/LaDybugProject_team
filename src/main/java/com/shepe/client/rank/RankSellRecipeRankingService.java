package com.shepe.client.rank;

import java.util.List;

public interface RankSellRecipeRankingService {

	void insertRankSellRecipeRanking (RankSellRecipeRankingVO recipeRankingvo);
	
	void updateRankSellRecipeRanking (RankSellRecipeRankingVO recipeRankingvo);
	
	int getRankSellRecipeRankingCnt (RankSellRecipeRankingVO recipeRankingvo);
	
	/* 1~100까지의 순위를 저장하기 위해 조회하는 리스트 */
	List<RankSellRecipeRankingVO> getRecipeRankList (RankSellRecipeRankingVO recipeRankingvo);
	
	/* 누적 레시피 판매량 리스트 */
	List<RankSellRecipeRankingVO> getRankSellRecipeRankingList (RankSellRecipeRankingVO recipeRankingvo); 
}
