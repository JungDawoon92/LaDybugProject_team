package com.shepe.client.rank.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shepe.client.rank.RankSubscribeRankingService;
import com.shepe.client.rank.RankSubscribeRankingVO;

@Service
public class RankSubscribeRankingServiceImpl implements RankSubscribeRankingService {

	@Autowired
	private RankSubscribeRankingDaoMybatis rankSubscribeRankingDAO;
	
	@Override
	public void insertRankSubscribeRanking(RankSubscribeRankingVO subRankingvo) {
		rankSubscribeRankingDAO.insertRankSubscribeRanking(subRankingvo);
	}

	@Override
	public void updateRankSubscribeRanking(RankSubscribeRankingVO subRankingvo) {
		rankSubscribeRankingDAO.updateRankSubscribeRanking(subRankingvo);
	}
	
	@Override
	public int getRankSubscribeRankingCnt(RankSubscribeRankingVO subRankingvo) {
		return rankSubscribeRankingDAO.getRankSubscribeRankingCnt(subRankingvo);
	}

	@Override
	public List<RankSubscribeRankingVO> getSubscribeRankList(RankSubscribeRankingVO subRankingvo) {
		return rankSubscribeRankingDAO.getSubscribeRankList(subRankingvo);
	}

	@Override
	public List<RankSubscribeRankingVO> getRankSubscribeRankingList(RankSubscribeRankingVO subRankingvo) {
		return rankSubscribeRankingDAO.getRankSubscribeRankingList(subRankingvo);
	}

	@Override
	public List<RankSubscribeRankingVO> getRankSubscribeRankingListMonth(RankSubscribeRankingVO subRankingvo) {
		return rankSubscribeRankingDAO.getRankSubscribeRankingListMonth(subRankingvo);
	}

	@Override
	public List<RankSubscribeRankingVO> getRankSubscribeRankingListWeek(RankSubscribeRankingVO subRankingvo) {
		return rankSubscribeRankingDAO.getRankSubscribeRankingListWeek(subRankingvo);
	}

	@Override
	public List<RankSubscribeRankingVO> getRankSubscribeRankingListToday(RankSubscribeRankingVO subRankingvo) {
		return rankSubscribeRankingDAO.getRankSubscribeRankingListToday(subRankingvo);
	}

	@Override
	public List<RankSubscribeRankingVO> getMyChefList(RankSubscribeRankingVO subRankingvo) {
		return rankSubscribeRankingDAO.getMyChefList(subRankingvo);
	}


}
