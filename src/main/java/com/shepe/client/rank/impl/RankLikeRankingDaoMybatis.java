package com.shepe.client.rank.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shepe.client.rank.RankLikeRankingVO;

@Repository
public class RankLikeRankingDaoMybatis {

	@Autowired
	private SqlSessionTemplate rankLikeRanking;
	
	public void insertRankLikeRanking (RankLikeRankingVO likeRankingvo) {
		rankLikeRanking.insert("rankLikeRankingDAO.insertRankLikeRanking", likeRankingvo);
	}

	public void updateRankLikeRanking (RankLikeRankingVO likeRankingvo) {
		rankLikeRanking.insert("rankLikeRankingDAO.updateRankLikeRanking", likeRankingvo);
	}
	
	public int getRankLikeRankingCnt (RankLikeRankingVO likeRankingvo) {
		return rankLikeRanking.selectOne("rankLikeRankingDAO.getRankLikeRankingCnt", likeRankingvo);
	}
	
	public List<RankLikeRankingVO> getLikeRankList (RankLikeRankingVO likeRankingvo) {
		return rankLikeRanking.selectList("rankLikeRankingDAO.getLikeRankList", likeRankingvo);
	}

	public List<RankLikeRankingVO> getRankLikeRankingList (RankLikeRankingVO likeRankingvo) {
		return rankLikeRanking.selectList("rankLikeRankingDAO.getRankLikeRankingList", likeRankingvo);
	}
	
	public List<RankLikeRankingVO> getRankLikeRankingListMonth (RankLikeRankingVO likeRankingvo) {
		return rankLikeRanking.selectList("rankLikeRankingDAO.getRankLikeRankingListMonth", likeRankingvo);
	}

	public List<RankLikeRankingVO> getRankLikeRankingListWeek (RankLikeRankingVO likeRankingvo) {
		return rankLikeRanking.selectList("rankLikeRankingDAO.getRankLikeRankingListWeek", likeRankingvo);
	}

	public List<RankLikeRankingVO> getRankLikeRankingListToday (RankLikeRankingVO likeRankingvo) {
		return rankLikeRanking.selectList("rankLikeRankingDAO.getRankLikeRankingListToday", likeRankingvo);
	}

	public List<RankLikeRankingVO> getMyLikeList(RankLikeRankingVO likeRankingvo) {
		return rankLikeRanking.selectList("rankLikeRankingDAO.getMyLikeList", likeRankingvo);
	}
	
}
