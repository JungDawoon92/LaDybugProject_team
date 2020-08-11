package com.shepe.admin.rank.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shepe.admin.rank.RankLikeAdminVO;

@Repository
public class RankLikeAdminDaoMybatis {

	@Autowired
	private SqlSessionTemplate rankLike;
	
	public void insertRankLike(RankLikeAdminVO rankLikevo) {
		rankLike.insert("adrankLikeDAO.insertRankLike", rankLikevo);
	}
	
	public RankLikeAdminVO getRankLike(RankLikeAdminVO rankLikevo) {
		return rankLike.selectOne("adrankLikeDAO.getRankLike", rankLikevo);
	}
	
	public List<RankLikeAdminVO> getRankLikeList(RankLikeAdminVO rankLikevo) {
		return rankLike.selectList("adrankLikeDAO.getRankLikeList", rankLikevo);
	}

	public List<RankLikeAdminVO> getAgesChart(RankLikeAdminVO rankLikevo) {
		return rankLike.selectList("adrankLikeDAO.getAgesChart", rankLikevo);
	}
}
