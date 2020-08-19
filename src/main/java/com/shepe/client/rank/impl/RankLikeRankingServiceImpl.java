package com.shepe.client.rank.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shepe.client.rank.RankLikeRankingService;
import com.shepe.client.rank.RankLikeRankingVO;

@Service
public class RankLikeRankingServiceImpl implements RankLikeRankingService{

	@Autowired
	private RankLikeRankingDaoMybatis rankLikeRankingDAO;

	@Override
	public void insertRankLikeRanking(RankLikeRankingVO likeRankingvo) {
		rankLikeRankingDAO.insertRankLikeRanking(likeRankingvo);
	}

	@Override
	public void updateRankLikeRanking(RankLikeRankingVO likeRankingvo) {
		rankLikeRankingDAO.updateRankLikeRanking(likeRankingvo);
	}
	
	@Override
	public int getRankLikeRankingCnt(RankLikeRankingVO likeRankingvo) {
		return rankLikeRankingDAO.getRankLikeRankingCnt(likeRankingvo);
	}

	@Override
	public List<RankLikeRankingVO> getLikeRankList(RankLikeRankingVO likeRankingvo) {
		return rankLikeRankingDAO.getLikeRankList(likeRankingvo);
	}

	@Override
	public List<RankLikeRankingVO> getRankLikeRankingList(RankLikeRankingVO likeRankingvo) {
		return rankLikeRankingDAO.getRankLikeRankingList(likeRankingvo);
	}
	
	@Override
	public List<RankLikeRankingVO> getRankLikeRankingListMonth(RankLikeRankingVO likeRankingvo) {
		return rankLikeRankingDAO.getRankLikeRankingListMonth(likeRankingvo);
	}
	
	@Override
	public List<RankLikeRankingVO> getRankLikeRankingListWeek(RankLikeRankingVO likeRankingvo) {
		return rankLikeRankingDAO.getRankLikeRankingListWeek(likeRankingvo);
	}

	@Override
	public List<RankLikeRankingVO> getRankLikeRankingListToday(RankLikeRankingVO likeRankingvo) {
		return rankLikeRankingDAO.getRankLikeRankingListToday(likeRankingvo);
	}

	@Override
	public List<RankLikeRankingVO> getMyLikeList(RankLikeRankingVO likeRankingvo) {
		return rankLikeRankingDAO.getMyLikeList(likeRankingvo);
	}


}
