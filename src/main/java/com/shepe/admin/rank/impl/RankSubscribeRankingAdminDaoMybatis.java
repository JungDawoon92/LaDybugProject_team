package com.shepe.admin.rank.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shepe.admin.rank.RankSubscribeRankingAdminVO;

@Repository
public class RankSubscribeRankingAdminDaoMybatis {

	@Autowired
	private SqlSessionTemplate rankSubRanking;
	
	public void insertRankSubscribeRanking (RankSubscribeRankingAdminVO subRankingvo) {
		rankSubRanking.insert("adrankSubscribeRankingDAO.insertRankSubscribeRanking", subRankingvo);
	}

	public void updateRankSubscribeRanking (RankSubscribeRankingAdminVO subRankingvo) {
		rankSubRanking.insert("adrankSubscribeRankingDAO.updateRankSubscribeRanking", subRankingvo);
	}
	
	public int getRankSubscribeRankingCnt(RankSubscribeRankingAdminVO subRankingvo) {
		return rankSubRanking.selectOne("adrankSubscribeRankingDAO.getRankSubscribeRankingCnt", subRankingvo);
	}
	
	public List<RankSubscribeRankingAdminVO> getSubscribeRankList(RankSubscribeRankingAdminVO subRankingvo) {
		return rankSubRanking.selectList("adrankSubscribeRankingDAO.getSubscribeRankList", subRankingvo);
	}

	public List<RankSubscribeRankingAdminVO> getRankSubscribeRankingList(RankSubscribeRankingAdminVO subRankingvo) {
		return rankSubRanking.selectList("adrankSubscribeRankingDAO.getRankSubscribeRankingList", subRankingvo);
	}

	public List<RankSubscribeRankingAdminVO> getRankSubscribeRankingListMonth(RankSubscribeRankingAdminVO subRankingvo) {
		return rankSubRanking.selectList("adrankSubscribeRankingDAO.getRankSubscribeRankingListMonth", subRankingvo);
	}

	public List<RankSubscribeRankingAdminVO> getRankSubscribeRankingListWeek(RankSubscribeRankingAdminVO subRankingvo) {
		return rankSubRanking.selectList("adrankSubscribeRankingDAO.getRankSubscribeRankingListWeek", subRankingvo);
	}
	
	public List<RankSubscribeRankingAdminVO> getRankSubscribeRankingListToday(RankSubscribeRankingAdminVO subRankingvo) {
		return rankSubRanking.selectList("adrankSubscribeRankingDAO.getRankSubscribeRankingListToday", subRankingvo);
	}

	public List<RankSubscribeRankingAdminVO> getSubscribeChart(RankSubscribeRankingAdminVO subRankingvo) {
		return rankSubRanking.selectList("adrankSubscribeRankingDAO.getSubscribeChart", subRankingvo);
	}
	
	public List<RankSubscribeRankingAdminVO> getMonthTopChefChart(RankSubscribeRankingAdminVO subRankingvo) {
		return rankSubRanking.selectList("adrankSubscribeRankingDAO.getMonthTopChefChart", subRankingvo);
	}
	
	public List<RankSubscribeRankingAdminVO> getWeekTopChefChart(RankSubscribeRankingAdminVO subRankingvo) {
		return rankSubRanking.selectList("adrankSubscribeRankingDAO.getWeekTopChefChart", subRankingvo);
	}
	
	public List<RankSubscribeRankingAdminVO> getDayTopChefChart(RankSubscribeRankingAdminVO subRankingvo) {
		return rankSubRanking.selectList("adrankSubscribeRankingDAO.getDayTopChefChart", subRankingvo);
	}
}
