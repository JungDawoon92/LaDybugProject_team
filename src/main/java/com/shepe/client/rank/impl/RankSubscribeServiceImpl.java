package com.shepe.client.rank.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shepe.client.rank.RankSubscribeService;
import com.shepe.client.rank.RankSubscribeVO;

@Service
public class RankSubscribeServiceImpl implements RankSubscribeService {

	@Autowired
	private RankSubscribeDaoMybatis rankSubscribeDAO;
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void insertRankSubscribe(RankSubscribeVO rankSubscribevo) {
		rankSubscribeDAO.insertRankSubscribe(rankSubscribevo);
	}
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void deleteRankSubscribe(RankSubscribeVO rankSubscribevo) {
		rankSubscribeDAO.deleteRankSubscribe(rankSubscribevo);
	}
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updatePushCheckZero(RankSubscribeVO rankSubscribevo) {
		return rankSubscribeDAO.updatePushCheckZero(rankSubscribevo);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updatePushCheckPlus(RankSubscribeVO rankSubscribevo) {
		return rankSubscribeDAO.updatePushCheckPlus(rankSubscribevo);
	}

	@Override
	public RankSubscribeVO getRankSubscribe(RankSubscribeVO rankSubscribevo) {
		return rankSubscribeDAO.getRankSubscribe(rankSubscribevo);
	}

	@Override
	public List<RankSubscribeVO> getRankSubscribeList(RankSubscribeVO rankSubscribevo) {
		return rankSubscribeDAO.getRankSubscribeList(rankSubscribevo);
	}


}
