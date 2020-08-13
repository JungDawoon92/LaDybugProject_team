package com.shepe.client.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shepe.client.rank.RankLikeRankingService;
import com.shepe.client.rank.RankLikeRankingVO;
import com.shepe.client.rank.RankSellIngredientRankingService;
import com.shepe.client.rank.RankSellIngredientRankingVO;
import com.shepe.client.rank.RankSubscribeRankingService;
import com.shepe.client.rank.RankSubscribeRankingVO;

@Controller
public class IndexController {

	@Autowired
	private RankLikeRankingService rankLikeRankingService;
	@Autowired
	private RankSubscribeRankingService rankSubscribeRankingService;
	@Autowired
	private RankSellIngredientRankingService rankSellIngreRankingService;
	
	@RequestMapping(value="/")
	public String indexRankList (RankLikeRankingVO likeRankingvo, RankSubscribeRankingVO subRankingvo, RankSellIngredientRankingVO ingreRankingvo, Model model) {
		System.out.println("클라 인덱스 잘 타는지 확인중 리스트");
		
		model.addAttribute("likeRankingList", rankLikeRankingService.getRankLikeRankingList(likeRankingvo));
		model.addAttribute("subRankingList", rankSubscribeRankingService.getRankSubscribeRankingList(subRankingvo));
		model.addAttribute("ingreRankingList", rankSellIngreRankingService.getRankSellIngredientRankingList(ingreRankingvo));
		return "client/index";
	}
}
