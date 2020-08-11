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

import com.shepe.client.comment.CommentService;
import com.shepe.client.comment.CommentVO;
import com.shepe.client.comment.RecipeService;
import com.shepe.client.comment.RecipeVO;
import com.shepe.client.member.MemberVO;
import com.shepe.client.rank.RankLikeService;
import com.shepe.client.rank.RankLikeVO;
import com.shepe.client.rank.RankSubscribeService;
import com.shepe.client.rank.RankSubscribeVO;

@Controller
public class RecipeTestController {

	@Autowired
	private RecipeService recipeService;
	
	@Autowired
	private CommentService commentService;
	@Autowired
	private RankLikeService rankLikeService;
	@Autowired
	private RankSubscribeService rankSubService;
	
	
	@RequestMapping(value="/getTestRecipe.re")
	public String getRecipe(RecipeVO recipevo, RankSubscribeVO subvo, RankLikeVO likevo, CommentVO commentvo, Model model, HttpServletRequest request) {
		System.out.println("클라꺼 타는지 테스트중 레시피 상세보기");
		commentvo.setRecipe_no(recipevo.getRecipe_no());
		int getListCnt = commentService.getCommentCnt(commentvo);
		
		RecipeVO getDetail = recipeService.getRecipe(recipevo);
		
		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO)session.getAttribute("memberInfo");
		
		subvo.setMember_sub_id(memberInfo.getMember_id());
		subvo.setMember_id(getDetail.getMember_id());
		model.addAttribute("subCheck", rankSubService.getRankSubscribe(subvo));
		
		likevo.setMember_like_id(memberInfo.getMember_id());
		likevo.setRecipe_no(recipevo.getRecipe_no());
		model.addAttribute("likeCheck", rankLikeService.getRankLike(likevo));
		
		
		model.addAttribute("recipeDetail", getDetail);
		model.addAttribute("listCnt", getListCnt);
		return "client/comment/recipe_detail";
	}
	
	
	
	
	
	
	@RequestMapping(value="/getChefRecipeList.re")
	public String getChefRecipeList (String member_id, RankSubscribeVO subvo, RecipeVO recipevo, Model model, HttpServletRequest request) {
		System.out.println("클라꺼 타는지 테스트중 쉐프리스트");
		
		recipevo.setMember_id(member_id);
		
		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO)session.getAttribute("memberInfo");
		subvo.setMember_sub_id(memberInfo.getMember_id());
		subvo.setMember_id(member_id);
		model.addAttribute("subCheck", rankSubService.getRankSubscribe(subvo));
		model.addAttribute("chef_id", member_id);
		
		model.addAttribute("chefRecipeList", recipeService.getChefRecipeList(recipevo));
		return "client/rank/chefsRecipe";
	}

	
	@ResponseBody
	@RequestMapping(value="/getChefRecipeListScrollAjax.re")
	public List<RecipeVO> getChefRecipeListScrollAjax (@RequestParam(value="pager") int page, String member_id, RankSubscribeVO subvo, RecipeVO recipevo, Model model, HttpServletRequest request) {
		System.out.println("클라꺼 타는지 테스트중 쉐프스크롤리스트");
		
		int offset = (page - 1) * 9;
		recipevo.setOffset(offset);
		recipevo.setMember_id(member_id);
		
		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO)session.getAttribute("memberInfo");
		subvo.setMember_sub_id(memberInfo.getMember_id());
		subvo.setMember_id(member_id);
		model.addAttribute("subCheck", rankSubService.getRankSubscribe(subvo));
		model.addAttribute("chef_id", member_id);
		
		return recipeService.getChefRecipeList(recipevo);
	}
}
