package com.shepe.client.rank;

import java.util.List;

public interface RankSubscribeRankingService {
	
	void insertRankSubscribeRanking (RankSubscribeRankingVO subRankingvo);
	
	void updateRankSubscribeRanking (RankSubscribeRankingVO subRankingvo);

	int getRankSubscribeRankingCnt (RankSubscribeRankingVO subRankingvo);
	
	/* 1~100까지의 순위를 저장하기 위해 조회하는 리스트 */
	List<RankSubscribeRankingVO> getSubscribeRankList(RankSubscribeRankingVO subRankingvo);

	/* 누적 구독자 조회 리스트 */
	List<RankSubscribeRankingVO> getRankSubscribeRankingList(RankSubscribeRankingVO subRankingvo);

	/* 월간 구독자 조회 리스트 */
	List<RankSubscribeRankingVO> getRankSubscribeRankingListMonth(RankSubscribeRankingVO subRankingvo);
	
	/* 주간 구독자 조회 리스트 */
	List<RankSubscribeRankingVO> getRankSubscribeRankingListWeek(RankSubscribeRankingVO subRankingvo);
	
	/* 일간 구독자 조회 리스트 */
	List<RankSubscribeRankingVO> getRankSubscribeRankingListToday(RankSubscribeRankingVO subRankingvo);
	
	/* 내가 소식받는 쉐프 조회 리스트 */
	List<RankSubscribeRankingVO> getMyChefList(RankSubscribeRankingVO subRankingvo);
}
