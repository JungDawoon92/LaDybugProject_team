package com.shepe.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.shepe.admin.comment.CommentAdminService;
import com.shepe.admin.comment.CommentAdminVO;
import com.shepe.admin.rank.RankIncomeAdminService;
import com.shepe.admin.rank.RankIncomeAdminVO;
import com.shepe.admin.rank.RankLikeAdminService;
import com.shepe.admin.rank.RankLikeAdminVO;
import com.shepe.admin.rank.RankLikeRankingAdminService;
import com.shepe.admin.rank.RankLikeRankingAdminVO;
import com.shepe.admin.rank.RankSellIngredientRankingAdminService;
import com.shepe.admin.rank.RankSellIngredientRankingAdminVO;
import com.shepe.admin.rank.RankSellRecipeRankingAdminService;
import com.shepe.admin.rank.RankSellRecipeRankingAdminVO;
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
	private RankSellIngredientRankingAdminService rankSellIngredientRankingService;
	@Autowired
	private RankSellRecipeRankingAdminService rankSellRecipeRankingService;
	
	@Autowired
	private RankIncomeAdminService rankIncomeService;
	
	@Autowired
	private RankLikeAdminService rankLikeService;
	@Autowired
	private CommentAdminService commentService;
	@Autowired
	private RankSubscribeAdminService rankSubscribeService;
	
	
	
	/* 그래프 관련 페이지 이동*/
	
	/* 종합 매출액 페이지 */
	@RequestMapping(value="/admin/moveIncomeSumChart.rk.ad")
	public String moveIncomeSumChart () {
		return "admin/rank/rankChart/incomeSumChart";
	}
	

	
	/* 매출액 상세 차트 */
	@RequestMapping(value="/admin/moveIncomeDetailChart.rk.ad")
	public String moveIncomeDetailChart (RankIncomeAdminVO incomevo, Model model) {
//		if(incomevo.getSearchCondition() == null) incomevo.setSearchCondition("member_id");
//		if(incomevo.getSearchKeyWord() == null) incomevo.setSearchKeyWord("");
//		
//		model.addAttribute("incomeDetail", rankIncomeService.getIncomeDetailList(incomevo));
		
		return "admin/rank/rankChart/incomeDetailChart";
	}

	
	
	
	/* 레시피 페이지 */
	@RequestMapping(value="/admin/moveLikeChart.rk.ad")
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
	
	@RequestMapping(value="/admin/moveMonthTopRecipeChart.rk.ad")
	public String moveMonthTopRecipeChart () {
		return "admin/rank/rankChart/mTopRecipeChart";
	}
	
	@RequestMapping(value="/admin/moveWeekTopRecipeChart.rk.ad")
	public String moveWeekTopRecipeChart () {
		return "admin/rank/rankChart/wTopRecipeChart";
	}
	
	@RequestMapping(value="/admin/moveDayTopRecipeChart.rk.ad")
	public String moveDayTopRecipeChart () {
		return "admin/rank/rankChart/dTopRecipeChart";
	}
	
	@RequestMapping(value="/admin/moveCommentTopChart.rk.ad")
	public String moveCommentTopChart () {
		return "admin/rank/rankChart/coTopChart";
	}
	
	
	
	/* 구독자 페이지 */
	@RequestMapping(value="/admin/moveSubChart.rk.ad")
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
	
	@RequestMapping(value="/admin/moveMonthTopChefChart.rk.ad")
	public String moveMonthTopChefChart () {
		return "admin/rank/rankChart/mTopChefChart";
	}
	
	@RequestMapping(value="/admin/moveWeekTopChefChart.rk.ad")
	public String moveWeekTopChefChart () {
		return "admin/rank/rankChart/wTopChefChart";
	}
	
	@RequestMapping(value="/admin/moveDayTopChefChart.rk.ad")
	public String moveDayTopChefChart () {
		return "admin/rank/rankChart/dTopChefChart";
	}
	
	
	
	/* 식재료 페이지 */
	@RequestMapping(value="/admin/moveSellIngredientChart.rk.ad")
	public String moveSellIngredientChart (RankSellIngredientRankingAdminVO ingreRankingvo, PagingVO po, Model model) {
		System.out.println("페이징 테스트중 : " + po.getPage());
		int pager = 1;
		if(po.getPage() < 1) {pager = 1;}
		else {pager = po.getPage();}
		
		int listCnt = rankSellIngredientRankingService.getRankSellIngredientRankingCnt(ingreRankingvo);
		commonpaging.setROW_PER_PAGE(10);
		int offset = (pager - 1) * commonpaging.getROW_PER_PAGE();
		
		model.addAttribute("paging", commonpaging.paging(pager, listCnt, po));
		model.addAttribute("offset", offset);
		return "admin/rank/rankChart/sellIngredientChart";
	}

	@RequestMapping(value="/admin/moveMonthTopIngredientChart.rk.ad")
	public String moveMonthTopIngredientChart () {
		return "admin/rank/rankChart/mTopSellIngredientChart";
	}
	
	@RequestMapping(value="/admin/moveWeekTopIngredientChart.rk.ad")
	public String moveWeekTopIngredientChart () {
		return "admin/rank/rankChart/wTopSellIngredientChart";
	}
	
	@RequestMapping(value="/admin/moveDayTopIngredientChart.rk.ad")
	public String moveDayTopIngredientChart () {
		return "admin/rank/rankChart/dTopSellIngredientChart";
	}
	
	
	
	/* 레시피 판매량 페이지 */
	@RequestMapping(value="/admin/moveSellRecipeChart.rk.ad")
	public String moveSellRecipeChart (RankSellRecipeRankingAdminVO recipeRankingvo, PagingVO po, Model model) {
		System.out.println("페이징 테스트중 : " + po.getPage());
		int pager = 1;
		if(po.getPage() < 1) {pager = 1;}
		else {pager = po.getPage();}
		
		int listCnt = rankSellRecipeRankingService.getRankSellRecipeRankingCnt(recipeRankingvo);
		commonpaging.setROW_PER_PAGE(10);
		int offset = (pager - 1) * commonpaging.getROW_PER_PAGE();
		
		model.addAttribute("paging", commonpaging.paging(pager, listCnt, po));
		model.addAttribute("offset", offset);
		return "admin/rank/rankChart/sellRecipeChart";
	}
	
	@RequestMapping(value="/admin/moveMonthTopSellRecipeChart.rk.ad")
	public String moveMonthTopSellRecipeChart () {
		return "admin/rank/rankChart/mTopSellRecipeChart";
	}

	@RequestMapping(value="/admin/moveWeekTopSellRecipeChart.rk.ad")
	public String moveWeekTopSellRecipeChart () {
		return "admin/rank/rankChart/wTopSellRecipeChart";
	}
	
	@RequestMapping(value="/admin/moveDayTopSellRecipeChart.rk.ad")
	public String moveDayTopSellRecipeChart () {
		return "admin/rank/rankChart/dTopSellRecipeChart";
	}
	
	
	
	

	
	/* 그래프 컨트롤러 */

	/*월별 종합 매출액 그래프*/
	@ResponseBody
	@RequestMapping(value="/admin/getIncomeSumChart.rk.ad", produces = "application/text; charset=utf-8")
	public String getIncomeSumChart (RankIncomeAdminVO incomevo) {
		System.out.println("월별 종합 매출액 그래프");
		Gson incomeGson = new Gson();
		List<RankIncomeAdminVO> IncomeChart = rankIncomeService.getIncomeSumChart(incomevo);
		return incomeGson.toJson(IncomeChart);
	}
	
	/*월별 레시피 매출액 그래프*/
	@ResponseBody
	@RequestMapping(value="/admin/getMonthTopRecipeIncomeChart.rk.ad", produces = "application/text; charset=utf-8")
	public String getMonthTopRecipeIncomeChart (RankIncomeAdminVO incomevo) {
		System.out.println("레시피 매출액 그래프");
		Gson incomeGson = new Gson();
		List<RankIncomeAdminVO> recipeIncomeChart = rankIncomeService.getMonthTopRecipeIncomeChart(incomevo);
		return incomeGson.toJson(recipeIncomeChart);
	}
	
	/*월별 식재료 매출액 그래프*/
	@ResponseBody
	@RequestMapping(value="/admin/getMonthTopIngredientIncomeChart.rk.ad", produces = "application/text; charset=utf-8")
	public String getMonthTopIngredientIncomeChart (RankIncomeAdminVO incomevo) {
		System.out.println("식재료 매출액 그래프");
		Gson incomeGson = new Gson();
		List<RankIncomeAdminVO> ingreIncomeChart = rankIncomeService.getMonthTopIngredientIncomeChart(incomevo);
		return incomeGson.toJson(ingreIncomeChart);
	}
	
	/* 매출액 TOP회원 그래프*/
	@ResponseBody
	@RequestMapping(value="/admin/getMonthTopMemberChart.rk.ad", produces = "application/text; charset=utf-8")
	public String getMonthTopMemberChart (RankIncomeAdminVO incomevo) {
		System.out.println("매출액 TOP회원 그래프");
		Gson incomeGson = new Gson();
		List<RankIncomeAdminVO> IncomeChart = rankIncomeService.getMonthTopMemberChart(incomevo);
		return incomeGson.toJson(IncomeChart);
	}
	
	
	/* 특정회원의 매출액 그래프*/
	@ResponseBody
	@RequestMapping(value="/admin/getIncomeDetailList.rk.ad", produces = "application/text; charset=utf-8")
	public String getIncomeDetailList (RankIncomeAdminVO incomevo) {
		System.out.println("특정회원의 매출액 그래프");
		Gson incomeGson = new Gson();
		List<RankIncomeAdminVO> IncomeChart = rankIncomeService.getIncomeDetailList(incomevo);
		return incomeGson.toJson(IncomeChart);
	}
	
	
	
	/* 레시피 누적 좋아요 그래프 */
	@ResponseBody
	@RequestMapping(value="/admin/getLikeChart.rk.ad", produces = "application/text; charset=utf-8")
	public String getLikeChart (RankLikeRankingAdminVO likeRankingvo) {
		System.out.println("좋아요 그래프");
		Gson likeGson = new Gson();
		List<RankLikeRankingAdminVO> likeChart = rankLikeRankingService.getLikeChart(likeRankingvo);
		return likeGson.toJson(likeChart);
	}

	/* 해당 월의 TOP레시피 */
	@ResponseBody
	@RequestMapping(value="/admin/getMonthTopRecipeChart.rk.ad", produces = "application/text; charset=utf-8")
	public String getMonthTopRecipeChart (RankLikeRankingAdminVO likeRankingvo) {
		System.out.println("월별 탑 레시피");
		
		Gson topGson = new Gson();
		List<RankLikeRankingAdminVO> monthTopRecipe = rankLikeRankingService.getMonthTopRecipeChart(likeRankingvo);
		return topGson.toJson(monthTopRecipe);
	}

	/* 해당 주의 TOP레시피 */
	@ResponseBody
	@RequestMapping(value="/admin/getWeekTopRecipeChart.rk.ad", produces = "application/text; charset=utf-8")
	public String getWeekTopRecipeChart (RankLikeRankingAdminVO likeRankingvo) {
		System.out.println("주별 탑 레시피");
		
		Gson topGson = new Gson();
		List<RankLikeRankingAdminVO> weekTopRecipe = rankLikeRankingService.getWeekTopRecipeChart(likeRankingvo);
		return topGson.toJson(weekTopRecipe);
	}
	
	/* 해당 일의 TOP레시피 */
	@ResponseBody
	@RequestMapping(value="/admin/getDayTopRecipeChart.rk.ad", produces = "application/text; charset=utf-8")
	public String getDayTopRecipeChart (RankLikeRankingAdminVO likeRankingvo) {
		System.out.println("일별 탑 레시피");
		
		Gson topGson = new Gson();
		List<RankLikeRankingAdminVO> dayTopRecipe = rankLikeRankingService.getDayTopRecipeChart(likeRankingvo);
		return topGson.toJson(dayTopRecipe);
	}
	
	/* 해당 일의 TOP코멘트 레시피 */
	@ResponseBody
	@RequestMapping(value="/admin/getCommentTopChart.rk.ad", produces = "application/text; charset=utf-8")
	public String getCommentTopChart (CommentAdminVO commentvo) {
		System.out.println("코멘트 탑 레시피");
		
		Gson topGson = new Gson();
		List<CommentAdminVO> commentTop = commentService.getCommentTopChart(commentvo);
		return topGson.toJson(commentTop);
	}
	
	
	/* 쉐프 누적 구독자 그래프 */
	@ResponseBody
	@RequestMapping(value="/admin/getSubscribeChart.rk.ad", produces = "application/text; charset=utf-8")
	public String getSubscribeChart (RankSubscribeRankingAdminVO subRankingvo) {
		System.out.println("구독자 그래프");
		Gson subGson = new Gson();
		List<RankSubscribeRankingAdminVO> subChart = rankSubscribeRankingService.getSubscribeChart(subRankingvo);
		return subGson.toJson(subChart);
	}
	
	
	/* 해당 월의 TOP쉐프 */
	@ResponseBody
	@RequestMapping(value="/admin/getMonthTopChefChart.rk.ad", produces = "application/text; charset=utf-8")
	public String getMonthTopChefChart (RankSubscribeRankingAdminVO subRankingvo) {
		System.out.println("월별 탑 쉐프");
		
		Gson topGson = new Gson();
		List<RankSubscribeRankingAdminVO> monthTopChef = rankSubscribeRankingService.getMonthTopChefChart(subRankingvo);
		return topGson.toJson(monthTopChef);
	}

	/* 해당 주의 TOP쉐프 */
	@ResponseBody
	@RequestMapping(value="/admin/getWeekTopChefChart.rk.ad", produces = "application/text; charset=utf-8")
	public String getWeekTopChefChart (RankSubscribeRankingAdminVO subRankingvo) {
		System.out.println("주별 탑 쉐프");
		
		Gson topGson = new Gson();
		List<RankSubscribeRankingAdminVO> weekTopChef = rankSubscribeRankingService.getWeekTopChefChart(subRankingvo);
		return topGson.toJson(weekTopChef);
	}
	
	/* 해당 일의 TOP쉐프 */
	@ResponseBody
	@RequestMapping(value="/admin/getDayTopChefChart.rk.ad", produces = "application/text; charset=utf-8")
	public String getDayTopChefChart (RankSubscribeRankingAdminVO subRankingvo) {
		System.out.println("일별 탑 쉐프");
		
		Gson topGson = new Gson();
		List<RankSubscribeRankingAdminVO> dayTopChef = rankSubscribeRankingService.getDayTopChefChart(subRankingvo);
		return topGson.toJson(dayTopChef);
	}
	
	
	
	
	/* 식재료 누적 판매량 그래프 */
	@ResponseBody
	@RequestMapping(value="/admin/getSellIngredientChart.rk.ad", produces = "application/text; charset=utf-8")
	public String getSellIngredientChart (RankSellIngredientRankingAdminVO ingreRankingvo) {
		System.out.println("식재료 그래프");
		
		Gson ingreGson = new Gson();
		List<RankSellIngredientRankingAdminVO> ingreChart = rankSellIngredientRankingService.getSellIngredientChart(ingreRankingvo);
		return ingreGson.toJson(ingreChart);
	}
	
	/* 해당 월의 식재료 판매량 */
	@ResponseBody
	@RequestMapping(value="/admin/getMonthTopIngredientChart.rk.ad", produces = "application/text; charset=utf-8")
	public String getMonthTopIngredientChart (RankSellIngredientRankingAdminVO ingreRankingvo) {
		System.out.println("월별 탑 식재료");
		
		Gson topGson = new Gson();
		List<RankSellIngredientRankingAdminVO> monthTopIngre = rankSellIngredientRankingService.getMonthTopIngredientChart(ingreRankingvo);
		return topGson.toJson(monthTopIngre);
	}
	
	/* 해당 주의 식재료 판매량 */
	@ResponseBody
	@RequestMapping(value="/admin/getWeekTopIngredientChart.rk.ad", produces = "application/text; charset=utf-8")
	public String getWeekTopIngredientChart (RankSellIngredientRankingAdminVO ingreRankingvo) {
		System.out.println("주별 탑 식재료");
		
		Gson topGson = new Gson();
		List<RankSellIngredientRankingAdminVO> weekTopIngre = rankSellIngredientRankingService.getWeekTopIngredientChart(ingreRankingvo);
		return topGson.toJson(weekTopIngre);
	}
	
	/* 해당 일의 식재료 판매량 */
	@ResponseBody
	@RequestMapping(value="/admin/getDayTopIngredientChart.rk.ad", produces = "application/text; charset=utf-8")
	public String getDayTopIngredientChart (RankSellIngredientRankingAdminVO ingreRankingvo) {
		System.out.println("일별 탑 식재료");
		
		Gson topGson = new Gson();
		List<RankSellIngredientRankingAdminVO> dayTopIngre = rankSellIngredientRankingService.getDayTopIngredientChart(ingreRankingvo);
		return topGson.toJson(dayTopIngre);
	}
	
	
	
	
	/* 레시피 누적 판매량 그래프 */
	@ResponseBody
	@RequestMapping(value="/admin/getSellRecipeChart.rk.ad", produces = "application/text; charset=utf-8")
	public String getSellRecipeChart (RankSellRecipeRankingAdminVO recipeRankingvo) {
		System.out.println("레시피 판매량 그래프");
		
		Gson ingreGson = new Gson();
		List<RankSellRecipeRankingAdminVO> recipeChart = rankSellRecipeRankingService.getSellRecipeChart(recipeRankingvo);
		return ingreGson.toJson(recipeChart);
	}
	
	/* 해당 월의 레시피 판매량 */
	@ResponseBody
	@RequestMapping(value="/admin/getMonthTopSellRecipeChart.rk.ad", produces = "application/text; charset=utf-8")
	public String getMonthTopSellRecipeChart (RankSellRecipeRankingAdminVO recipeRankingvo) {
		System.out.println("월별 탑 판매 레시피");
		
		Gson topGson = new Gson();
		List<RankSellRecipeRankingAdminVO> monthTopRecipe = rankSellRecipeRankingService.getMonthTopSellRecipeChart(recipeRankingvo);
		return topGson.toJson(monthTopRecipe);
	}

	/* 해당 주의 레시피 판매량 */
	@ResponseBody
	@RequestMapping(value="/admin/getWeekTopSellRecipeChart.rk.ad", produces = "application/text; charset=utf-8")
	public String getWeekTopSellRecipeChart (RankSellRecipeRankingAdminVO recipeRankingvo) {
		System.out.println("주별 탑 판매 레시피");
		
		Gson topGson = new Gson();
		List<RankSellRecipeRankingAdminVO> weekTopRecipe = rankSellRecipeRankingService.getWeekTopSellRecipeChart(recipeRankingvo);
		return topGson.toJson(weekTopRecipe);
	}

	/* 해당 일의 레시피 판매량 */
	@ResponseBody
	@RequestMapping(value="/admin/getDayTopSellRecipeChart.rk.ad", produces = "application/text; charset=utf-8")
	public String getDayTopSellRecipeChart (RankSellRecipeRankingAdminVO recipeRankingvo) {
		System.out.println("일별 탑 판매 레시피");
		
		Gson topGson = new Gson();
		List<RankSellRecipeRankingAdminVO> dayTopRecipe = rankSellRecipeRankingService.getDayTopSellRecipeChart(recipeRankingvo);
		return topGson.toJson(dayTopRecipe);
	}
	
	
	
	
	
	
	/* 좋아요 페이지에서 해당회원의 선호 category */
	@ResponseBody
	@RequestMapping(value="/admin/getCategoryChart.rk.ad", produces = "application/text; charset=utf-8")
	public String getCategoryChart (RankSubscribeAdminVO subvo) {
		System.out.println("회원의 선호 카테고리");
		Gson cateGson = new Gson();
		List<RankSubscribeAdminVO> cateChart = rankSubscribeService.getCategoryChart(subvo);
		return cateGson.toJson(cateChart);
	}
	
	
	/* 구독자 페이지에서 해당레시피의 선호 연령대 */
	@ResponseBody
	@RequestMapping(value="/admin/getAgesChart.rk.ad", produces = "application/text; charset=utf-8")
	public String getAgesChart (RankLikeAdminVO likevo) {
		System.out.println("레시피의 선호 연령대");
		System.out.println("번호 잘 가져오나??????"+likevo.getRecipe_no());
		Gson cateGson = new Gson();
		List<RankLikeAdminVO> ageChart = rankLikeService.getAgesChart(likevo);
		return cateGson.toJson(ageChart);
	}
	
	
	/* 식재료 판매량 페이지에서 해당식재료가 속한 레시피 */
	@ResponseBody
	@RequestMapping(value="/admin/getRecipeChart.rk.ad", produces = "application/text; charset=utf-8")
	public String getRecipeChart (RankSellIngredientRankingAdminVO ingrevo) {
		System.out.println("식재료가 속한 레시피 ");
		Gson cateGson = new Gson();
		List<RankSellIngredientRankingAdminVO> recipeChart = rankSellIngredientRankingService.getRecipeChart(ingrevo);
		return cateGson.toJson(recipeChart);
	}
	
	
	/* 레시피 판매량 페이지에서 해당회원의 선호 연령대 */
	@ResponseBody
	@RequestMapping(value="/admin/getSellRecipeCategoryChart.rk.ad", produces = "application/text; charset=utf-8")
	public String getSellRecipeCategoryChart (RankSellRecipeRankingAdminVO recipevo) {
		System.out.println("레시피 판매 회원의 선호 연령대");
		Gson cateGson = new Gson();
		List<RankSellRecipeRankingAdminVO> cateChart = rankSellRecipeRankingService.getSellRecipeAgesChart(recipevo);
		return cateGson.toJson(cateChart);
	}
}
