package com.shepe.admin.rank;

import java.util.List;

public interface RankSubscribeRankingAdminService {
	
	void insertRankSubscribeRanking (RankSubscribeRankingAdminVO subRankingvo);
	
	void updateRankSubscribeRanking (RankSubscribeRankingAdminVO subRankingvo);

	int getRankSubscribeRankingCnt (RankSubscribeRankingAdminVO subRankingvo);
	
	/* 1~100까지의 순위를 저장하기 위해 조회하는 리스트 */
	List<RankSubscribeRankingAdminVO> getSubscribeRankList(RankSubscribeRankingAdminVO subRankingvo);

	/* 누적 구독자 조회 리스트 */
	List<RankSubscribeRankingAdminVO> getRankSubscribeRankingList(RankSubscribeRankingAdminVO subRankingvo);
	
	/* 월간 구독자 조회 리스트 */
	List<RankSubscribeRankingAdminVO> getRankSubscribeRankingListMonth(RankSubscribeRankingAdminVO subRankingvo);

	/* 주간 구독자 조회 리스트 */
	List<RankSubscribeRankingAdminVO> getRankSubscribeRankingListWeek(RankSubscribeRankingAdminVO subRankingvo);
	
	/* 일간 구독자 조회 리스트 */
	List<RankSubscribeRankingAdminVO> getRankSubscribeRankingListToday(RankSubscribeRankingAdminVO subRankingvo);
	
	/* 구독자 차트 */
	List<RankSubscribeRankingAdminVO> getSubscribeChart(RankSubscribeRankingAdminVO subRankingvo);
	
	/* 해당 월의 TOP쉐프 차트 */
	List<RankSubscribeRankingAdminVO> getMonthTopChefChart(RankSubscribeRankingAdminVO subRankingvo);
	
	/* 해당 주의 TOP쉐프 차트 */
	List<RankSubscribeRankingAdminVO> getWeekTopChefChart(RankSubscribeRankingAdminVO subRankingvo);

	/* 해당 일의 TOP쉐프 차트 */
	List<RankSubscribeRankingAdminVO> getDayTopChefChart(RankSubscribeRankingAdminVO subRankingvo);
}
