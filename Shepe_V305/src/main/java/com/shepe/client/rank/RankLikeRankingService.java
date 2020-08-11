package com.shepe.client.rank;

import java.util.List;

public interface RankLikeRankingService {
	
	void insertRankLikeRanking (RankLikeRankingVO likeRankingvo);
	
	void updateRankLikeRanking (RankLikeRankingVO likeRankingvo);

	int getRankLikeRankingCnt (RankLikeRankingVO likeRankingvo);
	
	/* 1~100까지의 순위를 저장하기 위해 조회하는 리스트 */
	List<RankLikeRankingVO> getLikeRankList(RankLikeRankingVO likeRankingvo);

	/* 누적 좋아요 조회 리스트 */
	List<RankLikeRankingVO> getRankLikeRankingList(RankLikeRankingVO likeRankingvo);
	
	/* 월간 좋아요 조회 리스트 */
	List<RankLikeRankingVO> getRankLikeRankingListMonth(RankLikeRankingVO likeRankingvo);

	/* 주간 좋아요 조회 리스트 */
	List<RankLikeRankingVO> getRankLikeRankingListWeek(RankLikeRankingVO likeRankingvo);
	
	/* 일간 좋아요 조회 리스트 */
	List<RankLikeRankingVO> getRankLikeRankingListToday(RankLikeRankingVO likeRankingvo);
	
	/* 내가누른 좋아요 조회 리스트 */
	List<RankLikeRankingVO> getMyLikeList(RankLikeRankingVO likeRankingvo);
	
}
