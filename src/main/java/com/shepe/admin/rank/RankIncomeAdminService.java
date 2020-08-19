package com.shepe.admin.rank;

import java.util.List;

public interface RankIncomeAdminService {

	/* 월별 총 매출액 */
	List<RankIncomeAdminVO> getIncomeSumChart (RankIncomeAdminVO incomevo);
	
	/* 월별 레시피 매출액 */
	List<RankIncomeAdminVO> getMonthTopRecipeIncomeChart (RankIncomeAdminVO incomevo);
	
	/* 월별 식재료 매출액 */
	List<RankIncomeAdminVO> getMonthTopIngredientIncomeChart (RankIncomeAdminVO incomevo);
	
	/* 월별 매출액 TOP 회원*/
	List<RankIncomeAdminVO> getMonthTopMemberChart (RankIncomeAdminVO incomevo);
	
	/* 상세 페이지 리스트 */
	List<RankIncomeAdminVO> getIncomeDetailList (RankIncomeAdminVO incomevo);
}
