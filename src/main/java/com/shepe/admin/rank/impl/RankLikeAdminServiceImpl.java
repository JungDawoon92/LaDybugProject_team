package com.shepe.admin.rank.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shepe.admin.rank.RankLikeAdminService;
import com.shepe.admin.rank.RankLikeAdminVO;

@Service
public class RankLikeAdminServiceImpl implements RankLikeAdminService {

	@Autowired
	private RankLikeAdminDaoMybatis rankLikeDAO;
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void insertRankLike(RankLikeAdminVO rankLikevo) {
		rankLikeDAO.insertRankLike(rankLikevo);
	}

	@Override
	public RankLikeAdminVO getRankLike(RankLikeAdminVO rankLikevo) {
		return rankLikeDAO.getRankLike(rankLikevo);
	}

	@Override
	public List<RankLikeAdminVO> getRankLikeList(RankLikeAdminVO rankLikevo) {
		return rankLikeDAO.getRankLikeList(rankLikevo);
	}

	@Override
	public List<RankLikeAdminVO> getAgesChart(RankLikeAdminVO rankLikevo) {
		return rankLikeDAO.getAgesChart(rankLikevo);
	}


}
