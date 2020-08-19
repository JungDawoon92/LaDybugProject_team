package com.shepe.admin.rank;

import java.util.List;

public interface RankSellRecipeRankingAdminService {

	void insertRankSellRecipeRanking (RankSellRecipeRankingAdminVO recipeRankingvo);
	
	void updateRankSellRecipeRanking (RankSellRecipeRankingAdminVO recipeRankingvo);
	
	int getRankSellRecipeRankingCnt (RankSellRecipeRankingAdminVO recipeRankingvo);
	
	/* 1~100까지의 순위를 저장하기 위해 조회하는 리스트 */
	List<RankSellRecipeRankingAdminVO> getRecipeRankList (RankSellRecipeRankingAdminVO recipeRankingvo);
	
	/* 레시피 판매량 리스트 */
	List<RankSellRecipeRankingAdminVO> getSellRecipeChart (RankSellRecipeRankingAdminVO recipeRankingvo);
	
	/* 식재료 월간 판매량 리스트 */
	List<RankSellRecipeRankingAdminVO> getMonthTopSellRecipeChart (RankSellRecipeRankingAdminVO recipeRankingvo);
	
	/* 식재료 주간 판매량 리스트 */
	List<RankSellRecipeRankingAdminVO> getWeekTopSellRecipeChart (RankSellRecipeRankingAdminVO recipeRankingvo);
	
	/* 식재료 일간 판매량 리스트 */
	List<RankSellRecipeRankingAdminVO> getDayTopSellRecipeChart (RankSellRecipeRankingAdminVO recipeRankingvo);


	/* 레시피 판매량 의 레시피 좋아요 연령대 */
	List<RankSellRecipeRankingAdminVO> getSellRecipeAgesChart (RankSellRecipeRankingAdminVO recipeRankingvo);
}
