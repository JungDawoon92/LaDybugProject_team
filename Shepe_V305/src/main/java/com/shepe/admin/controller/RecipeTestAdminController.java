package com.shepe.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shepe.admin.comment.CommentAdminService;
import com.shepe.admin.comment.CommentAdminVO;
import com.shepe.admin.comment.RecipeAdminService;
import com.shepe.admin.comment.RecipeAdminVO;
import com.shepe.admin.rank.RankLikeAdminService;
import com.shepe.admin.rank.RankLikeAdminVO;
import com.shepe.admin.rank.RankSubscribeAdminService;
import com.shepe.admin.rank.RankSubscribeAdminVO;
import com.shepe.client.member.MemberVO;
import com.shepe.commons.CommonRankPaging;
import com.shepe.commons.PagingVO;

@Controller
public class RecipeTestAdminController {

	@Autowired
	private RecipeAdminService recipeService;
	
	@Autowired
	private CommentAdminService commentService;
	@Autowired
	private CommonRankPaging commonpaging;
	@Autowired
	private RankLikeAdminService rankLikeService;
	@Autowired
	private RankSubscribeAdminService rankSubService;
	
	
	@RequestMapping(value="/getTestRecipe.re.ad")
	public String getRecipe(RecipeAdminVO recipevo, RankSubscribeAdminVO subvo, RankLikeAdminVO likevo, CommentAdminVO commentvo, PagingVO po, Model model, HttpServletRequest request) {
		System.out.println("어드민 타는지 테스트중 레시피 상세보기");
		int pager = 1;
		commentvo.setRecipe_no(recipevo.getRecipe_no());
		
		int listCnt = commentService.getCommentCnt(commentvo);
		commonpaging.setROW_PER_PAGE(9);
		int offset = (pager - 1) * commonpaging.getROW_PER_PAGE();
		commentvo.setOffset(offset);
		
		RecipeAdminVO getDetail = recipeService.getRecipe(recipevo);
		
		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO)session.getAttribute("memberInfo");
		
		subvo.setMember_sub_id(memberInfo.getMember_id());
		subvo.setMember_id(getDetail.getMember_id());
		model.addAttribute("subCheck", rankSubService.getRankSubscribe(subvo));
		
		likevo.setMember_like_id(memberInfo.getMember_id());
		likevo.setRecipe_no(recipevo.getRecipe_no());
		model.addAttribute("likeCheck", rankLikeService.getRankLike(likevo));
		
		
		model.addAttribute("recipeDetail", getDetail);
		model.addAttribute("paging", commonpaging.paging(pager, listCnt, po));
		return "admin/comment/adrecipe_detail";
	}
	
	
	
	
	
	
	@RequestMapping(value="/getChefRecipeList.re.ad")
	public String getChefRecipeList (String member_id, RankSubscribeAdminVO subvo, RecipeAdminVO recipevo, PagingVO po, Model model, HttpServletRequest request) {
		System.out.println("어드민 타는지 테스트중 쉐프의 레시피 리스트");
		int pager = 1;
		if(po.getPage() < 1) {pager = 1;} 
		else {pager = po.getPage();}
		
		int listCnt = recipeService.getChefRecipeCnt(recipevo);
		commonpaging.setROW_PER_PAGE(9);
		int offset = (pager - 1) * commonpaging.getROW_PER_PAGE();
		recipevo.setOffset(offset);
		
		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO)session.getAttribute("memberInfo");
		subvo.setMember_sub_id(memberInfo.getMember_id());
		subvo.setMember_id(member_id);
		model.addAttribute("subCheck", rankSubService.getRankSubscribe(subvo));
		model.addAttribute("chef_id", member_id);
		
		model.addAttribute("paging", commonpaging.paging(pager, listCnt, po));
		model.addAttribute("chefRecipeList", recipeService.getChefRecipeList(recipevo));
		return "admin/rank/adchefsRecipe";
	}
}
