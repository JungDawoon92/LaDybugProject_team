package com.shepe.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.shepe.admin.comment.CommentAdminService;
import com.shepe.admin.comment.CommentAdminVO;
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
public class RankChartAdminController {

	@Autowired
	private CommonRankPaging commonpaging;
	@Autowired
	private RankLikeRankingAdminService rankLikeRankingService;
	@Autowired
	private RankSubscribeRankingAdminService rankSubscribeRankingService;
	
	
	@Autowired
	private RankLikeAdminService rankLikeService;
	@Autowired
	private CommentAdminService commentService;
	@Autowired
	private RankSubscribeAdminService rankSubscribeService;
	
	
	
	/* 그래프 관련 페이지 이동*/
	
	@RequestMapping(value="/jsonTest.rk.ad")
	public String jsonTest () {
		return "admin/rank/rankChart/chartTest";
	}
	
	@RequestMapping(value="/moveLikeChart.rk.ad")
	public String moveLikeChart (RankLikeRankingAdminVO likeRankingvo, PagingVO po, Model model) {
		System.out.println("페이징 테스트중 : " + po.getPage());
		int pager = 1;
		if(po.getPage() < 1) {pager = 1;} 
		else {pager = po.getPage();}
		
		int listCnt = rankLikeRankingService.getRankLikeRankingCnt(likeRankingvo);
		commonpaging.setROW_PER_PAGE(10);
		int offset = (pager - 1) * commonpaging.getROW_PER_PAGE();
		
		model.addAttribute("paging", commonpaging.paging(pager, listCnt, po));
		model.addAttribute("offset", offset);
		return "admin/rank/rankChart/likeChart";
	}
	
	@RequestMapping(value="/moveSubChart.rk.ad")
	public String moveSubChart (RankSubscribeRankingAdminVO subRankingvo, RankSubscribeAdminVO subvo, PagingVO po, Model model) {
		System.out.println("페이징 테스트중 : " + po.getPage());
		int pager = 1;
		if(po.getPage() < 1) {pager = 1;} 
		else {pager = po.getPage();}
		
		int listCnt = rankSubscribeRankingService.getRankSubscribeRankingCnt(subRankingvo);
		commonpaging.setROW_PER_PAGE(10);
		int offset = (pager - 1) * commonpaging.getROW_PER_PAGE();
		
		model.addAttribute("paging", commonpaging.paging(pager, listCnt, po));
		model.addAttribute("offset", offset);
		return "admin/rank/rankChart/subscribeChart";
	}

	@RequestMapping(value="/moveMonthTopRecipeChart.rk.ad")
	public String moveMonthTopRecipeChart () {
		return "admin/rank/rankChart/mTopRecipeChart";
	}
	
	@RequestMapping(value="/moveWeekTopRecipeChart.rk.ad")
	public String moveWeekTopRecipeChart () {
		return "admin/rank/rankChart/wTopRecipeChart";
	}
	
	@RequestMapping(value="/moveDayTopRecipeChart.rk.ad")
	public String moveDayTopRecipeChart () {
		return "admin/rank/rankChart/dTopRecipeChart";
	}

	@RequestMapping(value="/moveMonthTopChefChart.rk.ad")
	public String moveMonthTopChefChart () {
		return "admin/rank/rankChart/mTopChefChart";
	}
	
	@RequestMapping(value="/moveWeekTopChefChart.rk.ad")
	public String moveWeekTopChefChart () {
		return "admin/rank/rankChart/wTopChefChart";
	}
	
	@RequestMapping(value="/moveDayTopChefChart.rk.ad")
	public String moveDayTopChefChart () {
		return "admin/rank/rankChart/dTopChefChart";
	}
	
	
	@RequestMapping(value="/moveCommentTopChart.rk.ad")
	public String moveCommentTopChart () {
		return "admin/rank/rankChart/coTopChart";
	}
	
	
	
	@RequestMapping(value="moveShowCategory.rk.ad")
	public String moveShowCate (@RequestParam(value="member_id") String member_id, Model model) {
		model.addAttribute("member_id", member_id);
		return "admin/rank/rankChart/showCategory";
	}
	
	@RequestMapping(value="moveShowAges.rk.ad")
	public String moveShowAges (@RequestParam(value="recipe_no") String recipe_no, Model model) {
		model.addAttribute("recipe_no", recipe_no);
		return "admin/rank/rankChart/showAges";
	}
	
	
	
	/* 레시피 누적 좋아요 그래프 */
	@ResponseBody
	@RequestMapping(value="/getLikeChart.rk.ad")
	public String getLikeChart (RankLikeRankingAdminVO likeRankingvo) {
		System.out.println("좋아요 그래프");
		Gson likeGson = new Gson();
		List<RankLikeRankingAdminVO> likeChart = rankLikeRankingService.getLikeChart(likeRankingvo);
		return likeGson.toJson(likeChart);
	}

	/* 해당 월의 TOP레시피 */
	@ResponseBody
	@RequestMapping(value="/getMonthTopRecipeChart.rk.ad")
	public String getMonthTopRecipeChart (RankLikeRankingAdminVO likeRankingvo) {
		System.out.println("월별 탑 레시피");
		
		Gson topGson = new Gson();
		List<RankLikeRankingAdminVO> monthTopRecipe = rankLikeRankingService.getMonthTopRecipeChart(likeRankingvo);
		return topGson.toJson(monthTopRecipe);
	}

	/* 해당 주의 TOP레시피 */
	@ResponseBody
	@RequestMapping(value="/getWeekTopRecipeChart.rk.ad")
	public String getWeekTopRecipeChart (RankLikeRankingAdminVO likeRankingvo) {
		System.out.println("주별 탑 레시피");
		
		Gson topGson = new Gson();
		List<RankLikeRankingAdminVO> weekTopRecipe = rankLikeRankingService.getWeekTopRecipeChart(likeRankingvo);
		return topGson.toJson(weekTopRecipe);
	}
	
	/* 해당 일의 TOP레시피 */
	@ResponseBody
	@RequestMapping(value="/getDayTopRecipeChart.rk.ad")
	public String getDayTopRecipeChart (RankLikeRankingAdminVO likeRankingvo) {
		System.out.println("일별 탑 레시피");
		
		Gson topGson = new Gson();
		List<RankLikeRankingAdminVO> dayTopRecipe = rankLikeRankingService.getDayTopRecipeChart(likeRankingvo);
		return topGson.toJson(dayTopRecipe);
	}
	
	/* 해당 일의 TOP레시피 */
	@ResponseBody
	@RequestMapping(value="/getCommentTopChart.rk.ad")
	public String getCommentTopChart (CommentAdminVO commentvo) {
		System.out.println("코멘트 탑 레시피");
		
		Gson topGson = new Gson();
		List<CommentAdminVO> commentTop = commentService.getCommentTopChart(commentvo);
		return topGson.toJson(commentTop);
	}
	
	
	/* 쉐프 누적 구독자 그래프 */
	@ResponseBody
	@RequestMapping(value="/getSubscribeChart.rk.ad")
	public String getSubscribeChart (RankSubscribeRankingAdminVO subRankingvo) {
		System.out.println("구독자 그래프");
		Gson subGson = new Gson();
		List<RankSubscribeRankingAdminVO> subChart = rankSubscribeRankingService.getSubscribeChart(subRankingvo);
		return subGson.toJson(subChart);
	}
	
	
	/* 해당 월의 TOP쉐프 */
	@ResponseBody
	@RequestMapping(value="/getMonthTopChefChart.rk.ad")
	public String getMonthTopChefChart (RankSubscribeRankingAdminVO subRankingvo) {
		System.out.println("월별 탑 쉐프");
		
		Gson topGson = new Gson();
		List<RankSubscribeRankingAdminVO> monthTopChef = rankSubscribeRankingService.getMonthTopChefChart(subRankingvo);
		return topGson.toJson(monthTopChef);
	}

	/* 해당 주의 TOP쉐프 */
	@ResponseBody
	@RequestMapping(value="/getWeekTopChefChart.rk.ad")
	public String getWeekTopChefChart (RankSubscribeRankingAdminVO subRankingvo) {
		System.out.println("주별 탑 쉐프");
		
		Gson topGson = new Gson();
		List<RankSubscribeRankingAdminVO> weekTopChef = rankSubscribeRankingService.getWeekTopChefChart(subRankingvo);
		return topGson.toJson(weekTopChef);
	}
	
	/* 해당 일의 TOP쉐프 */
	@ResponseBody
	@RequestMapping(value="/getDayTopChefChart.rk.ad")
	public String getDayTopChefChart (RankSubscribeRankingAdminVO subRankingvo) {
		System.out.println("일별 탑 쉐프");
		
		Gson topGson = new Gson();
		List<RankSubscribeRankingAdminVO> dayTopChef = rankSubscribeRankingService.getDayTopChefChart(subRankingvo);
		return topGson.toJson(dayTopChef);
	}
	
	
	
	/* 해당회원의 선호 category */
	@ResponseBody
	@RequestMapping(value="/getCategoryChart.rk.ad")
	public String getCategoryChart (RankSubscribeAdminVO subvo) {
		System.out.println("회원의 선호 카테고리");
		Gson cateGson = new Gson();
		List<RankSubscribeAdminVO> cateChart = rankSubscribeService.getCategoryChart(subvo);
		return cateGson.toJson(cateChart);
	}
	
	
	/* 해당레시피의 선호 연령대 */
	@ResponseBody
	@RequestMapping(value="/getAgesChart.rk.ad")
	public String getAgesChart (RankLikeAdminVO likevo) {
		System.out.println("레시피의 선호 연령대");
		System.out.println("번호 잘 가져오나??????"+likevo.getRecipe_no());
		Gson cateGson = new Gson();
		List<RankLikeAdminVO> ageChart = rankLikeService.getAgesChart(likevo);
		return cateGson.toJson(ageChart);
	}
}
