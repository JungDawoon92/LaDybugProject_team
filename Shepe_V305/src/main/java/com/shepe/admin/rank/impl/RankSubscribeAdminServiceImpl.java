package com.shepe.admin.rank.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shepe.admin.rank.RankSubscribeAdminService;
import com.shepe.admin.rank.RankSubscribeAdminVO;

@Service
public class RankSubscribeAdminServiceImpl implements RankSubscribeAdminService {

	@Autowired
	private RankSubscribeAdminDaoMybatis rankSubscribeDAO;
	
	@Override
	public void insertRankSubscribe(RankSubscribeAdminVO rankSubscribevo) {
		rankSubscribeDAO.insertRankSubscribe(rankSubscribevo);
	}

	@Override
	public RankSubscribeAdminVO getRankSubscribe(RankSubscribeAdminVO rankSubscribevo) {
		return rankSubscribeDAO.getRankSubscribe(rankSubscribevo);
	}

	@Override
	public List<RankSubscribeAdminVO> getRankSubscribeList(RankSubscribeAdminVO rankSubscribevo) {
		return rankSubscribeDAO.getRankSubscribeList(rankSubscribevo);
	}

	@Override
	public List<RankSubscribeAdminVO> getCategoryChart(RankSubscribeAdminVO rankSubscribevo) {
		return rankSubscribeDAO.getCategoryChart(rankSubscribevo);
	}

}
