package com.shepe.admin.rank;

import java.util.List;

public interface RankLikeAdminService {

	void insertRankLike(RankLikeAdminVO rankLikevo);
	
	RankLikeAdminVO getRankLike(RankLikeAdminVO rankLikevo);
	
	List<RankLikeAdminVO> getRankLikeList(RankLikeAdminVO rankLikevo);
	
	/* 해당 레시피 좋아요 연령대 */
	List<RankLikeAdminVO> getAgesChart(RankLikeAdminVO rankLikevo);
}
