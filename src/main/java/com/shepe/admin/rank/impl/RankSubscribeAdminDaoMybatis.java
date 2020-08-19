package com.shepe.admin.rank.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shepe.admin.rank.RankSubscribeAdminVO;

@Repository
public class RankSubscribeAdminDaoMybatis {

	@Autowired
	private SqlSessionTemplate rankSubscribe;
	
	public void insertRankSubscribe (RankSubscribeAdminVO rankSubscribevo) {
		rankSubscribe.insert("adrankSubscribeDAO.insertRankSubscribe", rankSubscribevo);
	}
	
	public RankSubscribeAdminVO getRankSubscribe (RankSubscribeAdminVO rankSubscribevo) {
		return rankSubscribe.selectOne("adrankSubscribeDAO.getRankSubscribe", rankSubscribevo);
	}
	
	public List<RankSubscribeAdminVO> getRankSubscribeList (RankSubscribeAdminVO rankSubscribevo) {
		return rankSubscribe.selectList("adrankSubscribeDAO.getRankSubscribeList", rankSubscribevo);
	}
	
	public List<RankSubscribeAdminVO> getCategoryChart (RankSubscribeAdminVO rankSubscribevo) {
		return rankSubscribe.selectList("adrankSubscribeDAO.getCategoryChart", rankSubscribevo);
	}
}
