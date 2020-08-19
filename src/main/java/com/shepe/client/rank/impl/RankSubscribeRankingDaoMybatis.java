package com.shepe.client.rank.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shepe.client.rank.RankSubscribeRankingVO;

@Repository
public class RankSubscribeRankingDaoMybatis {

	@Autowired
	private SqlSessionTemplate rankSubRanking;
	
	public void insertRankSubscribeRanking (RankSubscribeRankingVO subRankingvo) {
		rankSubRanking.insert("rankSubscribeRankingDAO.insertRankSubscribeRanking", subRankingvo);
	}

	public void updateRankSubscribeRanking (RankSubscribeRankingVO subRankingvo) {
		rankSubRanking.insert("rankSubscribeRankingDAO.updateRankSubscribeRanking", subRankingvo);
	}
	
	public int getRankSubscribeRankingCnt(RankSubscribeRankingVO subRankingvo) {
		return rankSubRanking.selectOne("rankSubscribeRankingDAO.getRankSubscribeRankingCnt", subRankingvo);
	}
	
	public List<RankSubscribeRankingVO> getSubscribeRankList(RankSubscribeRankingVO subRankingvo) {
		return rankSubRanking.selectList("rankSubscribeRankingDAO.getSubscribeRankList", subRankingvo);
	}

	public List<RankSubscribeRankingVO> getRankSubscribeRankingList(RankSubscribeRankingVO subRankingvo) {
		return rankSubRanking.selectList("rankSubscribeRankingDAO.getRankSubscribeRankingList", subRankingvo);
	}
	
	public List<RankSubscribeRankingVO> getRankSubscribeRankingListMonth(RankSubscribeRankingVO subRankingvo) {
		return rankSubRanking.selectList("rankSubscribeRankingDAO.getRankSubscribeRankingListMonth", subRankingvo);
	}

	public List<RankSubscribeRankingVO> getRankSubscribeRankingListWeek(RankSubscribeRankingVO subRankingvo) {
		return rankSubRanking.selectList("rankSubscribeRankingDAO.getRankSubscribeRankingListWeek", subRankingvo);
	}

	public List<RankSubscribeRankingVO> getRankSubscribeRankingListToday(RankSubscribeRankingVO subRankingvo) {
		return rankSubRanking.selectList("rankSubscribeRankingDAO.getRankSubscribeRankingListToday", subRankingvo);
	}
	
	public List<RankSubscribeRankingVO> getMyChefList(RankSubscribeRankingVO subRankingvo) {
		return rankSubRanking.selectList("rankSubscribeRankingDAO.getMyChefList", subRankingvo);
	}
}
