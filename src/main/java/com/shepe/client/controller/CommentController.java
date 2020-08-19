package com.shepe.client.controller;

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

import com.shepe.client.comment.CommentService;
import com.shepe.client.comment.CommentVO;

@Controller
public class CommentController {

	@Autowired
	private CommentService commentService;
	

	@RequestMapping(value="/insertComment.co")
	public String insertComment(CommentVO commentvo, Model model) throws IOException {
		System.out.println("클라꺼 타는지 테스트중 댓글인서트");
		MultipartFile coUploadFile = commentvo.getCoUploadFile();
		
		if(!coUploadFile.isEmpty()) {
			String fileName = coUploadFile.getOriginalFilename();
			coUploadFile.transferTo(new File("D:\\commentProfile\\" + fileName));
			commentvo.setMember_img(fileName);
			commentService.updateMemberImg(commentvo);
		}
		commentService.insertComment(commentvo);
		model.addAttribute("recipe_no", commentvo.getRecipe_no());
		return "redirect:getRecipe.re";
	}

	@RequestMapping(value="/updateComment.co")
	public String updateComment(CommentVO commentvo, Model model) {
		System.out.println("클라꺼 타는지 테스트중 댓글 업데이트");
		commentService.updateComment(commentvo);
		model.addAttribute("recipe_no", commentvo.getRecipe_no());
		return "redirect:getRecipe.re";
	}
	
	@RequestMapping(value="/deleteComment.co")
	public String deleteComment(@RequestParam(value="arr") List<Integer> arr, CommentVO commentvo, Model model) {
		System.out.println("클라꺼 타는지 테스트중 댓글 삭제");
		for(int i : arr) {
			commentvo.setComment_sq(i);
			commentService.deleteComment(commentvo);
		}
		model.addAttribute("recipe_no", commentvo.getRecipe_no());
		return "redirect:getRecipe.re";
	}

	@ResponseBody
	@RequestMapping(value="/getCommentListAjax.co")
	public List<CommentVO> getCommentListAjax(@RequestParam(value="pager") int page, CommentVO commentvo, Model model) {
		System.out.println("클라꺼 타는지 테스트중 댓글 리스트");
		int offset = (page - 1) * 5;
		commentvo.setOffset(offset);
		return commentService.getCommentList(commentvo);
	}
}
