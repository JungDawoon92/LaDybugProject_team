package com.shepe.client.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.shepe.client.rank.RankLikeRankingService;
import com.shepe.client.rank.RankLikeRankingVO;
import com.shepe.client.rank.RankSubscribeRankingService;
import com.shepe.client.rank.RankSubscribeRankingVO;

@Service
public class RankScheduler {

	@Autowired
	private RankLikeRankingService rankLikeRankingService;
	@Autowired
	private RankSubscribeRankingService rankSubscribeRankingService;
	
	@Scheduled(cron="00 00 00 * * *")
	public void insertRankLikeRanking () {
		System.out.println("좋아요 insert 시작합니다.");
		
		RankLikeRankingVO likeRankingvo = new RankLikeRankingVO();
		
		rankLikeRankingService.insertRankLikeRanking(likeRankingvo);
		
		List<RankLikeRankingVO> likeList = rankLikeRankingService.getLikeRankList(likeRankingvo);
		
		for(int i=0; i<likeList.size(); i++) {
			likeRankingvo.setRank_no(i + 1);
			likeRankingvo.setRecipe_no(likeList.get(i).getRecipe_no());
			likeList.set(i, likeRankingvo);
			rankLikeRankingService.updateRankLikeRanking(likeRankingvo);
		}
	}
	
	
	@Scheduled(cron="00 00 00 * * *")
	public void insertRankSubscribeRanking () {
		System.out.println("구독 insert 시작합니다.");
		
		RankSubscribeRankingVO subRankingvo = new RankSubscribeRankingVO();
		
		rankSubscribeRankingService.insertRankSubscribeRanking(subRankingvo);

		List<RankSubscribeRankingVO> subList = rankSubscribeRankingService.getSubscribeRankList(subRankingvo);
		
		for(int i=0; i<subList.size(); i++) {
			subRankingvo.setRank_no(i +1);
			subRankingvo.setMember_id(subList.get(i).getMember_id());
			subList.set(i, subRankingvo);
			rankSubscribeRankingService.updateRankSubscribeRanking(subRankingvo);
		}
	}
}
