package com.shepe.client.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shepe.client.comment.CommentService;
import com.shepe.client.comment.CommentVO;
import com.shepe.client.rank.RankLikeService;
import com.shepe.client.rank.RankLikeVO;
import com.shepe.client.rank.RankSubscribeService;
import com.shepe.client.rank.RankSubscribeVO;
import com.shepe.client.recipe.RecipeService;
import com.shepe.client.recipe.RecipeVO;

@Controller
public class RecipeClientController {
	
	@Autowired
	private RecipeService recipeService;
	
	/* rank쪽 추가부분 */
	@Autowired
	private CommentService commentService;
	@Autowired
	private RankLikeService rankLikeService;
	@Autowired
	private RankSubscribeService rankSubService;
	
	// 임시 로그인 폼
	@RequestMapping(value="/login.re", method=RequestMethod.GET)
	public String loginForm() {
		
		return "loginForm";
	}
	
	// 임시 로그인 세션
	@RequestMapping(value="/login.re", method=RequestMethod.POST)
	public String login(RecipeVO vo, HttpSession session) {
	
		session.setAttribute("member_id", vo.getMember_id());
		session.setAttribute("nickname", vo.getMember_nickname());
		return "index";
	}
		
	// 레시피 리스트
	@RequestMapping("/recipeList.re")
	public String getRecipeList(RecipeVO vo, Model model) {
		model.addAttribute("recipeList", recipeService.getRecipeList(vo));
		return "client/recipe/recipeList";
	}
	
	// 레시피 등록 폼
	@RequestMapping(value="/recipeInsert.re", method=RequestMethod.GET)
	public String getInsertRecipe(RecipeVO vo, RankSubscribeVO rankSubscribevo) throws IOException {
		
		rankSubscribevo.setMember_id(vo.getMember_id());
		rankSubService.updatePushCheckPlus(rankSubscribevo);
		
		return "client/recipe/insertRecipe";
	}
		
	// 레시피 상세 조회
	@RequestMapping(value="/getRecipe.re")
	public String getRecipe(RecipeVO vo, RankSubscribeVO subvo, RankLikeVO likevo, CommentVO commentvo, Model model, HttpServletRequest request) throws IllegalStateException, IOException {
		
		// 카운트 증가
		recipeService.recipeCntUpdate(vo);
		
		// 기본 정보
		RecipeVO recipeDetail = recipeService.getRecipe(vo);
		model.addAttribute("recipe", recipeDetail);	
		
//		model.addAttribute("member_id", recipeDetail.getMember_id());
		
		// 식재료 리스트
		List<RecipeVO> ingredient = recipeService.getRecipeIngreList(vo);
		model.addAttribute("recipeIngreList", ingredient); 
		
		// 과정 리스트
		model.addAttribute("recipeProcessList", recipeService.getRecipeProcessList(vo));
		
		// 식재료 리스트를 쇼핑리스트에서 셀렉트
		List<RecipeVO> ingredientList =  new ArrayList<RecipeVO>(); // 데이터 담을 list 객체 생성
		for (int i = 0; i < ingredient.size(); i++) {
			RecipeVO ingredientPut =  ingredient.get(i); // select 할 대상 추출(식재료 이름)
			RecipeVO ingredientSelect = recipeService.getShopingIngreList(ingredientPut); // 식재료 이름넣고 정보 가져오기 
			if(ingredientSelect != null) {
				ingredientList.add(ingredientSelect);
			}
		}
		// 쇼핑 리스트
		model.addAttribute("shopingIngreList", ingredientList);
		
		/* rank쪽 추가부분 */
		commentvo.setRecipe_no(vo.getRecipe_no());
		int getListCnt = commentService.getCommentCnt(commentvo);
		HttpSession session = request.getSession();
		String member =(String)session.getAttribute("member_id");
	
		subvo.setMember_sub_id(member);
		subvo.setMember_id(recipeDetail.getMember_id());
		model.addAttribute("subCheck", rankSubService.getRankSubscribe(subvo));
		
		likevo.setMember_like_id(member);
		likevo.setRecipe_no(vo.getRecipe_no());
		model.addAttribute("likeCheck", rankLikeService.getRankLike(likevo));
		model.addAttribute("listCnt", getListCnt);
		model.addAttribute("chef_id", recipeDetail.getMember_id());
		
		return "client/recipe/recipeDetail";
	}
	
	/* rank 쪽 추가부분 */
	@RequestMapping(value="getChefRecipeList.re")
	public String getChefRecipeList (String member_id, RankSubscribeVO subvo, RecipeVO recipevo, Model model, HttpServletRequest request) {
		System.out.println("클라꺼 타는지 테스트중 쉐프리스트");
		System.out.println(member_id + "는 뭘까");
		
		recipevo.setMember_id(member_id);
		
		HttpSession session = request.getSession();
		String member =(String)session.getAttribute("member_id");
		subvo.setMember_sub_id(member);
		subvo.setMember_id(member_id);
		
		rankSubService.updatePushCheckZero(subvo);
	
		model.addAttribute("subCheck", rankSubService.getRankSubscribe(subvo));
		model.addAttribute("chef_id", member_id);
		
		
		model.addAttribute("chefRecipeList", recipeService.getChefRecipeList(recipevo));
		return "client/rank/chefsRecipe";
	}
	
	/* rank 쪽 추가부분 */
	@ResponseBody
	@RequestMapping(value="getChefRecipeListScrollAjax.re")
	public List<RecipeVO> getChefRecipeListScrollAjax (@RequestParam(value="pager") int page, String member_id, RankSubscribeVO subvo, RecipeVO recipevo, Model model, HttpServletRequest request) {
		System.out.println("클라꺼 타는지 테스트중 쉐프스크롤리스트");
		
		int offset = (page - 1) * 9;
		recipevo.setOffset(offset);
		recipevo.setMember_id(member_id);
		
		HttpSession session = request.getSession();
		String member =(String)session.getAttribute("member_id");
		subvo.setMember_sub_id(member);
		subvo.setMember_id(member_id);
		model.addAttribute("subCheck", rankSubService.getRankSubscribe(subvo));
		model.addAttribute("chef_id", member_id);
		
		return recipeService.getChefRecipeList(recipevo);
	}
}
