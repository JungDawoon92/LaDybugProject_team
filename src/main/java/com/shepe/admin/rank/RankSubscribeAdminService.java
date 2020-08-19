package com.shepe.admin.rank;

import java.util.List;

public interface RankSubscribeAdminService {

	void insertRankSubscribe(RankSubscribeAdminVO rankSubscribevo);
	
	RankSubscribeAdminVO getRankSubscribe(RankSubscribeAdminVO rankSubscribevo);
	
	List<RankSubscribeAdminVO> getRankSubscribeList(RankSubscribeAdminVO rankSubscribevo);
	
	/* 해당회원의 선호 카테고리 차트 */
	List<RankSubscribeAdminVO> getCategoryChart(RankSubscribeAdminVO rankSubscribevo);
}
