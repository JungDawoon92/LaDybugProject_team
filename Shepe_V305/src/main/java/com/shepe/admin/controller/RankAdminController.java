package com.shepe.admin.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shepe.admin.rank.RankLikeAdminService;
import com.shepe.admin.rank.RankLikeAdminVO;
import com.shepe.admin.rank.RankLikeRankingAdminService;
import com.shepe.admin.rank.RankLikeRankingAdminVO;
import com.shepe.admin.rank.RankSubscribeAdminService;
import com.shepe.admin.rank.RankSubscribeAdminVO;
import com.shepe.admin.rank.RankSubscribeRankingAdminService;
import com.shepe.admin.rank.RankSubscribeRankingAdminVO;
import com.shepe.commons.CommonRankPaging;
import com.shepe.commons.PagingVO;

@Controller
public class RankAdminController {

	@Autowired
	private CommonRankPaging commonpaging;
	@Autowired
	private RankLikeRankingAdminService rankLikeRankingService;
	@Autowired
	private RankSubscribeRankingAdminService rankSubscribeRankingService;
	
	
	@Autowired
	private RankLikeAdminService rankLikeService;
	@Autowired
	private RankSubscribeAdminService rankSubscribeService;
	
	
	
	/* 좋아요 랭킹 누적 리스트 */
	@RequestMapping(value="/getRankLikeRankingList.rk.ad") 
	public String getRankLikeRankingList(RankLikeRankingAdminVO likeRankingvo, PagingVO po, Model model) {
		System.out.println("어드민 타는지 테스트중 좋아요 리스트");
		int pager = 1;
		if(po.getPage() < 1) {pager = 1;} 
		else {pager = po.getPage();}
		
		int listCnt = rankLikeRankingService.getRankLikeRankingCnt(likeRankingvo);
		commonpaging.setROW_PER_PAGE(9);
		int offset = (pager - 1) * commonpaging.getROW_PER_PAGE();
		
		likeRankingvo.setOffset(offset);
		model.addAttribute("paging", commonpaging.paging(pager, listCnt, po));
		model.addAttribute("likeRankingList", rankLikeRankingService.getRankLikeRankingList(likeRankingvo));
		return "admin/rank/adrankLikeRanking";
	}
	
	/* 좋아요 랭킹 월간 Top12 리스트 */
	@RequestMapping(value="/getRankLikeRankingListMonth.rk.ad")
	public String getRankLikeRankingListMonth (RankLikeRankingAdminVO likeRankingvo, Model model) {
		System.out.println("어드민 타는지 테스트중 좋아요 월간 리스트");
		
		model.addAttribute("monthLikeList", rankLikeRankingService.getRankLikeRankingListMonth(likeRankingvo));
		return "admin/rank/adrankLikeRankingMonth";
	}

	/* 좋아요 랭킹 주간 Top12 리스트 */
	@RequestMapping(value="/getRankLikeRankingListWeek.rk.ad")
	public String getRankLikeRankingListWeek (RankLikeRankingAdminVO likeRankingvo, Model model) {
		System.out.println("어드민 타는지 테스트중 좋아요 주간 리스트");
		
		model.addAttribute("weekLikeList", rankLikeRankingService.getRankLikeRankingListWeek(likeRankingvo));
		return "admin/rank/adrankLikeRankingWeek";
	}

	
	/* 좋아요 랭킹 일간 Top12 리스트 */
	@RequestMapping(value="/getRankLikeRankingListToday.rk.ad")
	public String getRankLikeRankingListToday (RankLikeRankingAdminVO likeRankingvo, Model model) {
		System.out.println("어드민 타는지 테스트중 좋아요 일간 리스트");
		
		model.addAttribute("todayLikeList", rankLikeRankingService.getRankLikeRankingListToday(likeRankingvo));
		return "admin/rank/adrankLikeRankingToday";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/* 구독자 순위 누적 리스트 */
	@RequestMapping(value="/getRankSubscribeRankingList.rk.ad")
	public String getRankSubscribeRankingList(RankSubscribeRankingAdminVO subRankingvo, RankSubscribeAdminVO subvo, PagingVO po, Model model) {
		System.out.println("어드민 타는지 테스트중 구독 리스트");
		int pager = 1;
		if(po.getPage() < 1) {pager = 1;} 
		else {pager = po.getPage();}
		
		int listCnt = rankSubscribeRankingService.getRankSubscribeRankingCnt(subRankingvo);
		commonpaging.setROW_PER_PAGE(15);
		int offset = (pager - 1) * commonpaging.getROW_PER_PAGE();
		
		subRankingvo.setOffset(offset);
		model.addAttribute("paging", commonpaging.paging(pager, listCnt, po));
		model.addAttribute("subRankingList", rankSubscribeRankingService.getRankSubscribeRankingList(subRankingvo));
		return "admin/rank/adrankSubscribeRanking";
	}
	
	/* 구독자 순위 월간 리스트 */
	@RequestMapping(value="/getRankSubscribeRankingListMonth.rk.ad")
	public String getRankSubscribeRankingListMonth (RankSubscribeRankingAdminVO subRankingvo, Model model) {
		System.out.println("어드민 타는지 테스트중 월간구독 리스트");
		model.addAttribute("monthSubList", rankSubscribeRankingService.getRankSubscribeRankingListMonth(subRankingvo));
		return "admin/rank/adrankSubscribeRankingMonth";
	}

	/* 구독자 순위 주간 리스트 */
	@RequestMapping(value="/getRankSubscribeRankingListWeek.rk.ad")
	public String getRankSubscribeRankingListWeek (RankSubscribeRankingAdminVO subRankingvo, Model model) {
		System.out.println("어드민 타는지 테스트중 주간구독 리스트");
		model.addAttribute("weekSubList", rankSubscribeRankingService.getRankSubscribeRankingListWeek(subRankingvo));
		return "admin/rank/adrankSubscribeRankingWeek";
	}

	/* 구독자 순위 일간 리스트 */
	@RequestMapping(value="/getRankSubscribeRankingListToday.rk.ad")
	public String getRankSubscribeRankingListToday (RankSubscribeRankingAdminVO subRankingvo, Model model) {
		System.out.println("어드민 타는지 테스트중 일간구독 리스트");
		model.addAttribute("todaySubList", rankSubscribeRankingService.getRankSubscribeRankingListToday(subRankingvo));
		return "admin/rank/adrankSubscribeRankingToday";
	}
	
	
	
	/* 레시피 추천인 관련 */
	@ResponseBody
	@RequestMapping(value="/insertRankLikeAjax.rk.ad")
	public void insertRankLike (RankLikeAdminVO likevo, Model model) {
		System.out.println("어드민 타는지 테스트중 좋아요 인서트");
		rankLikeService.insertRankLike(likevo);
	}
	
	
	
	
	/* 쉐프 구독자 관련 */
	@ResponseBody
	@RequestMapping(value="/insertRankSubscribeAjax.rk.ad")
	public void insertRankSubscribe (RankSubscribeAdminVO subvo, Model model) {
		System.out.println("어드민 타는지 테스트중 구독 인서트");
		rankSubscribeService.insertRankSubscribe(subvo);
	}
	
}
