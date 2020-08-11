package com.shepe.client.rank;

import java.util.List;

public interface RankLikeService {

	void insertRankLike(RankLikeVO rankLikevo);
	
	void deleteRankLike(RankLikeVO rankLikevo);
	
	RankLikeVO getRankLike(RankLikeVO rankLikevo);
	
	List<RankLikeVO> getRankLikeList(RankLikeVO rankLikevo);
}
