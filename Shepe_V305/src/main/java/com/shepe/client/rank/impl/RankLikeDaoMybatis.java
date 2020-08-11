package com.shepe.client.rank.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shepe.client.rank.RankLikeVO;

@Repository
public class RankLikeDaoMybatis {

	@Autowired
	private SqlSessionTemplate rankLike;
	
	public void insertRankLike(RankLikeVO rankLikevo) {
		rankLike.insert("rankLikeDAO.insertRankLike", rankLikevo);
	}

	public void deleteRankLike(RankLikeVO rankLikevo) {
		rankLike.delete("rankLikeDAO.deleteRankLike", rankLikevo);
	}
	
	public RankLikeVO getRankLike(RankLikeVO rankLikevo) {
		return rankLike.selectOne("rankLikeDAO.getRankLike", rankLikevo);
	}
	
	public List<RankLikeVO> getRankLikeList(RankLikeVO rankLikevo) {
		return rankLike.selectList("rankLikeDAO.getRankLikeList", rankLikevo);
	}
}
