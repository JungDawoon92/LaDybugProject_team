package com.shepe.admin.rank;

import java.util.List;

public interface RankLikeRankingAdminService {
	
	void insertRankLikeRanking (RankLikeRankingAdminVO likeRankingvo);
	
	void updateRankLikeRanking (RankLikeRankingAdminVO likeRankingvo);

	int getRankLikeRankingCnt (RankLikeRankingAdminVO likeRankingvo);
	
	/* 1~100까지의 순위를 저장하기 위해 조회하는 리스트 */
	List<RankLikeRankingAdminVO> getLikeRankList(RankLikeRankingAdminVO likeRankingvo);

	/* 누적 좋아요 조회 리스트 */
	List<RankLikeRankingAdminVO> getRankLikeRankingList(RankLikeRankingAdminVO likeRankingvo);

	/* 월간 좋아요 조회 리스트 */
	List<RankLikeRankingAdminVO> getRankLikeRankingListMonth(RankLikeRankingAdminVO likeRankingvo);

	/* 주간 좋아요 조회 리스트 */
	List<RankLikeRankingAdminVO> getRankLikeRankingListWeek(RankLikeRankingAdminVO likeRankingvo);
	
	/* 일간 좋아요 조회 리스트 */
	List<RankLikeRankingAdminVO> getRankLikeRankingListToday(RankLikeRankingAdminVO likeRankingvo);
	
	/* 레시피 좋아요 차트 */
	List<RankLikeRankingAdminVO> getLikeChart(RankLikeRankingAdminVO likeRankingvo);
	
	/* 해당 월의 레시피 차트 */
	List<RankLikeRankingAdminVO> getMonthTopRecipeChart(RankLikeRankingAdminVO likeRankingvo);
	
	/* 해당 주의 레시피 차트 */
	List<RankLikeRankingAdminVO> getWeekTopRecipeChart(RankLikeRankingAdminVO likeRankingvo);
	
	/* 해당 일의 레시피 차트 */
	List<RankLikeRankingAdminVO> getDayTopRecipeChart(RankLikeRankingAdminVO likeRankingvo);
	
}
