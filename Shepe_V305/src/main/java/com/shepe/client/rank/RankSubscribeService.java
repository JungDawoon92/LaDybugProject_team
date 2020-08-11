package com.shepe.client.rank;

import java.util.List;

public interface RankSubscribeService {

	void insertRankSubscribe(RankSubscribeVO rankSubscribevo);
	
	void deleteRankSubscribe(RankSubscribeVO rankSubscribevo);
	
	RankSubscribeVO getRankSubscribe(RankSubscribeVO rankSubscribevo);
	
	List<RankSubscribeVO> getRankSubscribeList(RankSubscribeVO rankSubscribevo);
}
