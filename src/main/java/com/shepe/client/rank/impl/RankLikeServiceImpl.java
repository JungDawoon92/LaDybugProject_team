package com.shepe.client.rank.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shepe.client.rank.RankLikeService;
import com.shepe.client.rank.RankLikeVO;

@Service
public class RankLikeServiceImpl implements RankLikeService {

	@Autowired
	private RankLikeDaoMybatis rankLikeDAO;
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void insertRankLike(RankLikeVO rankLikevo) {
		rankLikeDAO.insertRankLike(rankLikevo);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public void deleteRankLike(RankLikeVO rankLikevo) {
		rankLikeDAO.deleteRankLike(rankLikevo);
	}

	@Override
	public RankLikeVO getRankLike(RankLikeVO rankLikevo) {
		return rankLikeDAO.getRankLike(rankLikevo);
	}

	@Override
	public List<RankLikeVO> getRankLikeList(RankLikeVO rankLikevo) {
		return rankLikeDAO.getRankLikeList(rankLikevo);
	}


}
