package com.shepe.client.rank.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shepe.client.rank.RankSubscribeVO;

@Repository
public class RankSubscribeDaoMybatis {

	@Autowired
	private SqlSessionTemplate rankSubscribe;
	
	public void insertRankSubscribe (RankSubscribeVO rankSubscribevo) {
		rankSubscribe.insert("rankSubscribeDAO.insertRankSubscribe", rankSubscribevo);
	}

	public void deleteRankSubscribe (RankSubscribeVO rankSubscribevo) {
		rankSubscribe.delete("rankSubscribeDAO.deleteRankSubscribe", rankSubscribevo);
	}
	
	public int updatePushCheckZero (RankSubscribeVO rankSubscribevo) {
		return rankSubscribe.update("rankSubscribeDAO.updatePushCheckZero", rankSubscribevo);
	}
	
	public int updatePushCheckPlus (RankSubscribeVO rankSubscribevo) {
		return rankSubscribe.update("rankSubscribeDAO.updatePushCheckPlus", rankSubscribevo);
	}
	
	public RankSubscribeVO getRankSubscribe (RankSubscribeVO rankSubscribevo) {
		return rankSubscribe.selectOne("rankSubscribeDAO.getRankSubscribe", rankSubscribevo);
	}
	
	public List<RankSubscribeVO> getRankSubscribeList (RankSubscribeVO rankSubscribevo) {
		return rankSubscribe.selectList("rankSubscribeDAO.getRankSubscribeList", rankSubscribevo);
	}
}
