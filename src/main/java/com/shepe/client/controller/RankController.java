package com.shepe.client.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shepe.client.rank.RankLikeRankingService;
import com.shepe.client.rank.RankLikeRankingVO;
import com.shepe.client.rank.RankLikeService;
import com.shepe.client.rank.RankLikeVO;
import com.shepe.client.rank.RankSellIngredientRankingService;
import com.shepe.client.rank.RankSellIngredientRankingVO;
import com.shepe.client.rank.RankSellRecipeRankingService;
import com.shepe.client.rank.RankSellRecipeRankingVO;
import com.shepe.client.rank.RankSubscribeRankingService;
import com.shepe.client.rank.RankSubscribeRankingVO;
import com.shepe.client.rank.RankSubscribeService;
import com.shepe.client.rank.RankSubscribeVO;

@Controller
public class RankController {

	@Autowired
	private RankLikeRankingService rankLikeRankingService;
	@Autowired
	private RankSubscribeRankingService rankSubscribeRankingService;
	
	
	@Autowired
	private RankLikeService rankLikeService;
	@Autowired
	private RankSubscribeService rankSubscribeService;
	@Autowired
	private RankSellRecipeRankingService rankSellRecipeRankingService;
	@Autowired
	private RankSellIngredientRankingService rankSellIngredientRankingService;
	
	
	
	/* 좋아요 랭킹 누적 리스트 */
	@RequestMapping(value="/getRankLikeRankingList.rk") 
	public String getRankLikeRankingList(RankLikeRankingVO likeRankingvo, Model model) {
		System.out.println("클라꺼 타는지 테스트중 좋아요 누적리스트");
		
		model.addAttribute("likeRankingList", rankLikeRankingService.getRankLikeRankingList(likeRankingvo));
		return "client/rank/rankLikeRanking";
	}

	
	/* 좋아요 랭킹 누적 스크롤리스트 */
	@ResponseBody
	@RequestMapping(value="/getRankLikeRankingListScrollAjax.rk") 
	public List<RankLikeRankingVO> getRankLikeRankingListScrollAjax(@RequestParam(value="pager") int page, RankLikeRankingVO likeRankingvo) {
		System.out.println("클라꺼 타는지 테스트중 좋아요 누적스크롤리스트");
		
		int offset = (page - 1) * 9;
		likeRankingvo.setOffset(offset);
		return rankLikeRankingService.getRankLikeRankingList(likeRankingvo);
	}
	
	
	/* 좋아요 랭킹 월간 Top12 리스트 */
	@RequestMapping(value="/getRankLikeRankingListMonth.rk")
	public String getRankLikeRankingListMonth (RankLikeRankingVO likeRankingvo, Model model) {
		System.out.println("클라꺼 타는지 테스트중 좋아요 월간 리스트");
		
		model.addAttribute("monthLikeList", rankLikeRankingService.getRankLikeRankingListMonth(likeRankingvo));
		return "client/rank/rankLikeRankingMonth";
	}

	/* 좋아요 랭킹 주간 Top12 리스트 */
	@RequestMapping(value="/getRankLikeRankingListWeek.rk")
	public String getRankLikeRankingListWeek (RankLikeRankingVO likeRankingvo, Model model) {
		System.out.println("클라꺼 타는지 테스트중 좋아요 주간 리스트");
		
		model.addAttribute("weekLikeList", rankLikeRankingService.getRankLikeRankingListWeek(likeRankingvo));
		return "client/rank/rankLikeRankingWeek";
	}

	
	/* 좋아요 랭킹 일간 Top12 리스트 */
	@RequestMapping(value="/getRankLikeRankingListToday.rk")
	public String getRankLikeRankingListToday (RankLikeRankingVO likeRankingvo, Model model) {
		System.out.println("클라꺼 타는지 테스트중 좋아요 일간 리스트");
		
		model.addAttribute("todayLikeList", rankLikeRankingService.getRankLikeRankingListToday(likeRankingvo));
		return "client/rank/rankLikeRankingToday";
	}
	
	/* 내가누른 좋아요 랭킹 리스트 */
	@RequestMapping(value="/getMyLikeList.rk") 
	public String getMyLikeList(RankLikeRankingVO likeRankingvo, Model model, HttpServletRequest request) {
		System.out.println("클라꺼 타는지 테스트중 내가누른 좋아요 리스트");
		
		HttpSession session = request.getSession();
		String member =(String)session.getAttribute("member_id");
		likeRankingvo.setMember_id(member);
		
		model.addAttribute("myLikeList", rankLikeRankingService.getMyLikeList(likeRankingvo));
		return "client/rank/myLikeList";
	}
	
	/* 내가누른 좋아요 랭킹 스크롤리스트 */
	@ResponseBody
	@RequestMapping(value="/getMyLikeListScrollAjax.rk") 
	public List<RankLikeRankingVO> getMyLikeListScrollAjax(@RequestParam(value="pager") int page, RankLikeRankingVO likeRankingvo, HttpServletRequest request) {
		System.out.println("클라꺼 타는지 테스트중 내가누른 좋아요 스크롤리스트");
		
		HttpSession session = request.getSession();
		String member =(String)session.getAttribute("member_id");
		likeRankingvo.setMember_id(member);
		
		int offset = (page - 1) * 9;
		likeRankingvo.setOffset(offset);
		return rankLikeRankingService.getMyLikeList(likeRankingvo);
	}
	
	
	
	/* 구독자 순위 누적 리스트 */
	@RequestMapping(value="/getRankSubscribeRankingList.rk")
	public String getRankSubscribeRankingList(RankSubscribeRankingVO subRankingvo, Model model) {
		System.out.println("클라꺼 타는지 테스트중 누적구독 리스트");
		
		model.addAttribute("subRankingList", rankSubscribeRankingService.getRankSubscribeRankingList(subRankingvo));
		return "client/rank/rankSubscribeRanking";
	}

	
	/* 구독자 순위 누적 스크롤리스트 */
	@ResponseBody
	@RequestMapping(value="/getRankSubscribeRankingListScrollAjax.rk")
	public List<RankSubscribeRankingVO> getRankSubscribeRankingListScrollAjax(@RequestParam(value="pager") int page, RankSubscribeRankingVO subRankingvo) {
		System.out.println("클라꺼 타는지 테스트중 누적구독 스크롤리스트");
		
		int offset = (page - 1) * 21;
		subRankingvo.setOffset(offset);
		return rankSubscribeRankingService.getRankSubscribeRankingList(subRankingvo);
	}
	
	
	/* 구독자 순위 월간 리스트 */
	@RequestMapping(value="/getRankSubscribeRankingListMonth.rk")
	public String getRankSubscribeRankingListMonth (RankSubscribeRankingVO subRankingvo, Model model) {
		System.out.println("클라꺼 타는지 테스트중 월간구독 리스트");
		model.addAttribute("monthSubList", rankSubscribeRankingService.getRankSubscribeRankingListMonth(subRankingvo));
		return "client/rank/rankSubscribeRankingMonth";
	}

	
	/* 구독자 순위 주간 리스트 */
	@RequestMapping(value="/getRankSubscribeRankingListWeek.rk")
	public String getRankSubscribeRankingListWeek (RankSubscribeRankingVO subRankingvo, Model model) {
		System.out.println("클라꺼 타는지 테스트중 주간구독 리스트");
		model.addAttribute("weekSubList", rankSubscribeRankingService.getRankSubscribeRankingListWeek(subRankingvo));
		return "client/rank/rankSubscribeRankingWeek";
	}
	
	
	/* 구독자 순위 일간 리스트 */
	@RequestMapping(value="/getRankSubscribeRankingListToday.rk")
	public String getRankSubscribeRankingListToday (RankSubscribeRankingVO subRankingvo, Model model) {
		System.out.println("클라꺼 타는지 테스트중 일간구독 리스트");
		model.addAttribute("todaySubList", rankSubscribeRankingService.getRankSubscribeRankingListToday(subRankingvo));
		return "client/rank/rankSubscribeRankingToday";
	}
	
	
	/* 내가 소식받는 쉐프 리스트 */
	@RequestMapping(value="/getMyChefList.rk")
	public String getMyChefList(RankSubscribeRankingVO subRankingvo, Model model, HttpServletRequest request) {
		System.out.println("클라꺼 타는지 테스트중 내가 소식받는 쉐프 리스트");
		
		HttpSession session = request.getSession();
		String member =(String)session.getAttribute("member_id");
		subRankingvo.setMember_id(member);
		
		model.addAttribute("myChefList", rankSubscribeRankingService.getMyChefList(subRankingvo));
		return "client/rank/myChefList";
	}

	
	/* 내가 소식받는 쉐프 스크롤리스트 */
	@ResponseBody
	@RequestMapping(value="/getMyChefListScrollAjax.rk")
	public List<RankSubscribeRankingVO> getMyChefListScrollAjax(@RequestParam(value="pager") int page, RankSubscribeRankingVO subRankingvo, HttpServletRequest request) {
		System.out.println("클라꺼 타는지 테스트중 내가 소식받는 쉐프 스크롤리스트");
		
		HttpSession session = request.getSession();
		String member =(String)session.getAttribute("member_id");
		subRankingvo.setMember_id(member);
		
		int offset = (page - 1) * 21;
		subRankingvo.setOffset(offset);
		return rankSubscribeRankingService.getRankSubscribeRankingList(subRankingvo);
	}
	
	/* 레피시 판매량 리스트 */
	@RequestMapping(value="/getRankSellRecipeRankingList.rk")
	public String getRankSellRecipeRankingList(RankSellRecipeRankingVO recipeRankingvo, Model model) {
		System.out.println("클라꺼 타는지 테스트중 레시피 판매 리스트");
		
		model.addAttribute("recipeRankingList", rankSellRecipeRankingService.getRankSellRecipeRankingList(recipeRankingvo));
		return "client/rank/rankSellRecipeRanking";
	}
	
	
	/* 레시피 판매량 스크롤리스트 */
	@ResponseBody
	@RequestMapping(value="/getRankSellRecipeRankingListScrollAjax.rk")
	public List<RankSellRecipeRankingVO> getRankSellRecipeRankingListScrollAjax(@RequestParam(value="pager") int page, RankSellRecipeRankingVO recipeRankingvo) {
		System.out.println("클라꺼 타는지 테스트중 레시피 판매량 누적스크롤리스트");
		
		int offset = (page - 1) * 9;
		recipeRankingvo.setOffset(offset);
		return rankSellRecipeRankingService.getRankSellRecipeRankingList(recipeRankingvo);
	}
	
	
	

	/* 식재료 판매량 리스트 */
	@RequestMapping(value="/getRankSellIngredientRankingList.rk")
	public String getRankSellIngredientRankingList(RankSellIngredientRankingVO ingreRankingvo, Model model) {
		System.out.println("클라꺼 타는지 테스트중 식재료 판매량 리스트");
		
		model.addAttribute("ingreRankingList", rankSellIngredientRankingService.getRankSellIngredientRankingList(ingreRankingvo));
		return "client/rank/rankSellIngredientRanking";
	}
	
	
	/* 식재료 판매량 스크롤리스트 */
	@ResponseBody
	@RequestMapping(value="/getRankSellIngredientRankingListScrollAjax.rk")
	public List<RankSellIngredientRankingVO> getRankSellIngredientRankingListScrollAjax(@RequestParam(value="pager") int page, RankSellIngredientRankingVO ingreRankingvo) {
		System.out.println("클라꺼 타는지 테스트중 식재료 판매량 스크롤리스트");
		
		int offset = (page - 1) * 21;
		ingreRankingvo.setOffset(offset);
		return rankSellIngredientRankingService.getRankSellIngredientRankingList(ingreRankingvo);
	}
	
	
	
	/* 레시피 추천인 관련 */
	@ResponseBody
	@RequestMapping(value="/insertRankLikeAjax.rk")
	public void insertRankLike (RankLikeVO likevo) {
		System.out.println("클라꺼 타는지 테스트중 좋아요 인서트");
		rankLikeService.insertRankLike(likevo);
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteRankLikeAjax.rk")
	public void deleteRankLike (RankLikeVO likevo) {
		System.out.println("클라꺼 타는지 테스트중 좋아요 삭제");
		rankLikeService.deleteRankLike(likevo);
	}
	
	
	
	/* 쉐프 구독자 관련 */
	@ResponseBody
	@RequestMapping(value="/insertRankSubscribeAjax.rk")
	public void insertRankSubscribe (RankSubscribeVO subvo) {
		System.out.println("클라꺼 타는지 테스트중 구독 인서트");
		rankSubscribeService.insertRankSubscribe(subvo);
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteRankSubscribeAjax.rk")
	public void deleteRankSubscribe (RankSubscribeVO subvo) {
		System.out.println("클라꺼 타는지 테스트중 구독 삭제");
		rankSubscribeService.deleteRankSubscribe(subvo);
	}
}
