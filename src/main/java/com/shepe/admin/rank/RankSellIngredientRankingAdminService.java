package com.shepe.admin.rank;

import java.util.List;

public interface RankSellIngredientRankingAdminService {

	void insertRankSellIngredientRanking (RankSellIngredientRankingAdminVO ingreRankingvo);

	void updateRankSellIngredientRanking (RankSellIngredientRankingAdminVO ingreRankingvo);

	int getRankSellIngredientRankingCnt (RankSellIngredientRankingAdminVO ingreRankingvo);
	
	/* 1~100까지의 순위를 저장하기 위해 조회하는 리스트 */
	List<RankSellIngredientRankingAdminVO> getIngredientRankList (RankSellIngredientRankingAdminVO ingreRankingvo);
	
	/* 식재료 판매량 차트 */
	List<RankSellIngredientRankingAdminVO> getSellIngredientChart (RankSellIngredientRankingAdminVO ingreRankingvo);
	
	/* 식재료 월간 판매량 차트 */
	List<RankSellIngredientRankingAdminVO> getMonthTopIngredientChart (RankSellIngredientRankingAdminVO ingreRankingvo);
	
	/* 식재료 주간 판매량 차트 */
	List<RankSellIngredientRankingAdminVO> getWeekTopIngredientChart (RankSellIngredientRankingAdminVO ingreRankingvo);
	
	/* 식재료 주간 판매량 차트 */
	List<RankSellIngredientRankingAdminVO> getDayTopIngredientChart (RankSellIngredientRankingAdminVO ingreRankingvo);
	
	/* 해당 식재료가 속한 레시피 */
	List<RankSellIngredientRankingAdminVO> getRecipeChart (RankSellIngredientRankingAdminVO ingreRankingvo);
}
