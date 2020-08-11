package com.shepe.admin.rank.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shepe.admin.rank.RankLikeRankingAdminVO;

@Repository
public class RankLikeRankingAdminDaoMybatis {

	@Autowired
	private SqlSessionTemplate rankLikeRanking;
	
	public void insertRankLikeRanking (RankLikeRankingAdminVO likeRankingvo) {
		rankLikeRanking.insert("adrankLikeRankingDAO.insertRankLikeRanking", likeRankingvo);
	}

	public void updateRankLikeRanking (RankLikeRankingAdminVO likeRankingvo) {
		rankLikeRanking.insert("adrankLikeRankingDAO.updateRankLikeRanking", likeRankingvo);
	}
	
	public int getRankLikeRankingCnt (RankLikeRankingAdminVO likeRankingvo) {
		return rankLikeRanking.selectOne("adrankLikeRankingDAO.getRankLikeRankingCnt", likeRankingvo);
	}
	
	public List<RankLikeRankingAdminVO> getLikeRankList (RankLikeRankingAdminVO likeRankingvo) {
		return rankLikeRanking.selectList("adrankLikeRankingDAO.getLikeRankList", likeRankingvo);
	}

	public List<RankLikeRankingAdminVO> getRankLikeRankingList (RankLikeRankingAdminVO likeRankingvo) {
		return rankLikeRanking.selectList("adrankLikeRankingDAO.getRankLikeRankingList", likeRankingvo);
	}

	public List<RankLikeRankingAdminVO> getRankLikeRankingListMonth (RankLikeRankingAdminVO likeRankingvo) {
		return rankLikeRanking.selectList("adrankLikeRankingDAO.getRankLikeRankingListMonth", likeRankingvo);
	}

	public List<RankLikeRankingAdminVO> getRankLikeRankingListWeek (RankLikeRankingAdminVO likeRankingvo) {
		return rankLikeRanking.selectList("adrankLikeRankingDAO.getRankLikeRankingListWeek", likeRankingvo);
	}
	
	public List<RankLikeRankingAdminVO> getRankLikeRankingListToday (RankLikeRankingAdminVO likeRankingvo) {
		return rankLikeRanking.selectList("adrankLikeRankingDAO.getRankLikeRankingListToday", likeRankingvo);
	}
	
	public List<RankLikeRankingAdminVO> getLikeChart (RankLikeRankingAdminVO likeRankingvo) {
		return rankLikeRanking.selectList("adrankLikeRankingDAO.getLikeChart", likeRankingvo);
	}
	
	public List<RankLikeRankingAdminVO> getMonthTopRecipeChart (RankLikeRankingAdminVO likeRankingvo) {
		return rankLikeRanking.selectList("adrankLikeRankingDAO.getMonthTopRecipeChart", likeRankingvo);
	}
	
	public List<RankLikeRankingAdminVO> getWeekTopRecipeChart (RankLikeRankingAdminVO likeRankingvo) {
		return rankLikeRanking.selectList("adrankLikeRankingDAO.getWeekTopRecipeChart", likeRankingvo);
	}
	
	public List<RankLikeRankingAdminVO> getDayTopRecipeChart (RankLikeRankingAdminVO likeRankingvo) {
		return rankLikeRanking.selectList("adrankLikeRankingDAO.getDayTopRecipeChart", likeRankingvo);
	}
}
