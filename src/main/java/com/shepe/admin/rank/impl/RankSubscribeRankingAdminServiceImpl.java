package com.shepe.admin.rank.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shepe.admin.rank.RankSubscribeRankingAdminService;
import com.shepe.admin.rank.RankSubscribeRankingAdminVO;

@Service
public class RankSubscribeRankingAdminServiceImpl implements RankSubscribeRankingAdminService {

	@Autowired
	private RankSubscribeRankingAdminDaoMybatis rankSubscribeRankingDAO;
	
	@Override
	public void insertRankSubscribeRanking(RankSubscribeRankingAdminVO subRankingvo) {
		rankSubscribeRankingDAO.insertRankSubscribeRanking(subRankingvo);

	}

	@Override
	public void updateRankSubscribeRanking(RankSubscribeRankingAdminVO subRankingvo) {
		rankSubscribeRankingDAO.updateRankSubscribeRanking(subRankingvo);
	}
	
	@Override
	public int getRankSubscribeRankingCnt(RankSubscribeRankingAdminVO subRankingvo) {
		return rankSubscribeRankingDAO.getRankSubscribeRankingCnt(subRankingvo);
	}

	@Override
	public List<RankSubscribeRankingAdminVO> getSubscribeRankList(RankSubscribeRankingAdminVO subRankingvo) {
		return rankSubscribeRankingDAO.getSubscribeRankList(subRankingvo);
	}

	@Override
	public List<RankSubscribeRankingAdminVO> getRankSubscribeRankingList(RankSubscribeRankingAdminVO subRankingvo) {
		return rankSubscribeRankingDAO.getRankSubscribeRankingList(subRankingvo);
	}

	@Override
	public List<RankSubscribeRankingAdminVO> getRankSubscribeRankingListMonth(RankSubscribeRankingAdminVO subRankingvo) {
		return rankSubscribeRankingDAO.getRankSubscribeRankingListMonth(subRankingvo);
	}

	@Override
	public List<RankSubscribeRankingAdminVO> getRankSubscribeRankingListWeek(RankSubscribeRankingAdminVO subRankingvo) {
		return rankSubscribeRankingDAO.getRankSubscribeRankingListWeek(subRankingvo);
	}

	@Override
	public List<RankSubscribeRankingAdminVO> getRankSubscribeRankingListToday(RankSubscribeRankingAdminVO subRankingvo) {
		return rankSubscribeRankingDAO.getRankSubscribeRankingListToday(subRankingvo);
	}

	@Override
	public List<RankSubscribeRankingAdminVO> getSubscribeChart(RankSubscribeRankingAdminVO subRankingvo) {
		return rankSubscribeRankingDAO.getSubscribeChart(subRankingvo);
	}

	@Override
	public List<RankSubscribeRankingAdminVO> getMonthTopChefChart(RankSubscribeRankingAdminVO subRankingvo) {
		return rankSubscribeRankingDAO.getMonthTopChefChart(subRankingvo);
	}

	@Override
	public List<RankSubscribeRankingAdminVO> getWeekTopChefChart(RankSubscribeRankingAdminVO subRankingvo) {
		return rankSubscribeRankingDAO.getWeekTopChefChart(subRankingvo);
	}

	@Override
	public List<RankSubscribeRankingAdminVO> getDayTopChefChart(RankSubscribeRankingAdminVO subRankingvo) {
		return rankSubscribeRankingDAO.getDayTopChefChart(subRankingvo);
	}

}
