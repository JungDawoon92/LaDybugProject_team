package com.shepe.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.shepe.admin.comment.CommentAdminService;
import com.shepe.admin.comment.CommentAdminVO;
import com.shepe.commons.CommonRankPaging;
import com.shepe.commons.PagingVO;

@Controller
public class CommentAdminController {

	@Autowired
	private CommentAdminService commentService;
	@Autowired
	private CommonRankPaging commonpaging;
	

	@RequestMapping(value="/admin/updateComment.co.ad")
	public String updateComment(CommentAdminVO commentvo, Model model) {
		System.out.println("어드민 타는지 테스트중 댓글수정");
		commentService.updateComment(commentvo);
		model.addAttribute("recipe_no", commentvo.getRecipe_no());
		return "redirect:getRecipe.adre";
	}
	
	@RequestMapping(value="/admin/deleteComment.co.ad")
	public String deleteComment(@RequestParam(value="arr") List<Integer> arr, CommentAdminVO commentvo, Model model) {
		System.out.println("어드민 타는지 테스트중 댓글삭제");
		for(int i : arr) {
			commentvo.setComment_sq(i);
			commentService.deleteComment(commentvo);
		}
		model.addAttribute("recipe_no", commentvo.getRecipe_no());
		return "redirect:getRecipe.adre";
	}

//	@RequestMapping(value="/getComment.co")
//	public String getComment(CommentVO commentvo, Model model) {
//		model.addAttribute("getComment", commentService.getComment(commentvo));
//		return "admin/comment/commentList";
//	}

	
//	 @RequestMapping(value="/getCommentList.co") 
//	 public String getCommentList(CommentVO commentvo, Model model) { 
//		 String recipe_no = commentvo.getRecipe_no();
//		 model.addAttribute("recipeDetail", recipeService.getRecipe(recipe_no));
//		 model.addAttribute("getCoList", commentService.getCommentList(commentvo));
//		 return "admin/comment/commentList"; }

	@ResponseBody
	@RequestMapping(value="/admin/getCommentListAjax.co.ad")
	public List<CommentAdminVO> getCommentListAjax(CommentAdminVO commentvo, PagingVO po, Model model) {
		System.out.println("어드민 타는지 테스트중 댓글리스트");
		int pager = 1;
		if(po.getPage() < 1) {pager = 1;} 
		else {pager = po.getPage();}
		
		int listCnt = commentService.getCommentCnt(commentvo);
		commonpaging.setROW_PER_PAGE(10);
		int offset = (pager - 1) * commonpaging.getROW_PER_PAGE();
		
		commentvo.setOffset(offset);
		model.addAttribute("paging", commonpaging.paging(pager, listCnt, po));
		return commentService.getCommentList(commentvo);
	}
}
