package com.shepe.commons;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shepe.client.rank.RankLikeRankingService;
import com.shepe.client.rank.RankLikeRankingVO;
import com.shepe.client.rank.RankSubscribeRankingService;
import com.shepe.client.rank.RankSubscribeRankingVO;

@Controller
public class IndexAction {

	@Autowired
	private RankLikeRankingService rankLikeRankingService;
	@Autowired
	private RankSubscribeRankingService rankSubscribeRankingService;
	
	@RequestMapping(value="/")
	public String indexRankList (RankLikeRankingVO likeRankingvo, RankSubscribeRankingVO subRankingvo, Model model) {
		System.out.println("클라 인덱스 잘 타는지 확인중 리스트");
		
		model.addAttribute("likeRankingList", rankLikeRankingService.getRankLikeRankingList(likeRankingvo));
		model.addAttribute("subRankingList", rankSubscribeRankingService.getRankSubscribeRankingList(subRankingvo));
		return "client/index";
	}
	
	
}
