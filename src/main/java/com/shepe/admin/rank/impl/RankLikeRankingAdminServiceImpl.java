package com.shepe.admin.rank.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shepe.admin.rank.RankLikeRankingAdminService;
import com.shepe.admin.rank.RankLikeRankingAdminVO;

@Service
public class RankLikeRankingAdminServiceImpl implements RankLikeRankingAdminService{

	@Autowired
	private RankLikeRankingAdminDaoMybatis rankLikeRankingDAO;

	@Override
	public void insertRankLikeRanking(RankLikeRankingAdminVO likeRankingvo) {
		rankLikeRankingDAO.insertRankLikeRanking(likeRankingvo);
	}

	@Override
	public void updateRankLikeRanking(RankLikeRankingAdminVO likeRankingvo) {
		rankLikeRankingDAO.updateRankLikeRanking(likeRankingvo);
	}
	
	@Override
	public int getRankLikeRankingCnt(RankLikeRankingAdminVO likeRankingvo) {
		return rankLikeRankingDAO.getRankLikeRankingCnt(likeRankingvo);
	}

	@Override
	public List<RankLikeRankingAdminVO> getLikeRankList(RankLikeRankingAdminVO likeRankingvo) {
		return rankLikeRankingDAO.getLikeRankList(likeRankingvo);
	}

	@Override
	public List<RankLikeRankingAdminVO> getRankLikeRankingList(RankLikeRankingAdminVO likeRankingvo) {
		return rankLikeRankingDAO.getRankLikeRankingList(likeRankingvo);
	}

	@Override
	public List<RankLikeRankingAdminVO> getRankLikeRankingListMonth(RankLikeRankingAdminVO likeRankingvo) {
		return rankLikeRankingDAO.getRankLikeRankingListMonth(likeRankingvo);
	}

	@Override
	public List<RankLikeRankingAdminVO> getRankLikeRankingListWeek(RankLikeRankingAdminVO likeRankingvo) {
		return rankLikeRankingDAO.getRankLikeRankingListWeek(likeRankingvo);
	}

	@Override
	public List<RankLikeRankingAdminVO> getRankLikeRankingListToday(RankLikeRankingAdminVO likeRankingvo) {
		return rankLikeRankingDAO.getRankLikeRankingListToday(likeRankingvo);
	}

	
	
	@Override
	public List<RankLikeRankingAdminVO> getLikeChart(RankLikeRankingAdminVO likeRankingvo) {
		return rankLikeRankingDAO.getLikeChart(likeRankingvo);
	}

	@Override
	public List<RankLikeRankingAdminVO> getMonthTopRecipeChart(RankLikeRankingAdminVO likeRankingvo) {
		return rankLikeRankingDAO.getMonthTopRecipeChart(likeRankingvo);
	}

	@Override
	public List<RankLikeRankingAdminVO> getWeekTopRecipeChart(RankLikeRankingAdminVO likeRankingvo) {
		return rankLikeRankingDAO.getWeekTopRecipeChart(likeRankingvo);
	}

	@Override
	public List<RankLikeRankingAdminVO> getDayTopRecipeChart(RankLikeRankingAdminVO likeRankingvo) {
		return rankLikeRankingDAO.getDayTopRecipeChart(likeRankingvo);
	}

}
