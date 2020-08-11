package com.shepe.admin.controller;

import java.io.IOException;

import org.apache.commons.fileupload.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.shepe.admin.qna.QnaService;
import com.shepe.admin.qna.QnaVO;

@Controller
@SessionAttributes("qna")
public class QnaController {

	@Autowired
	private QnaService qnaService;
	
	// 글 등록
		@RequestMapping(value="/insertQna.do")
		public String insertBoard(QnaVO vo, FileUpload fileUpload) throws IOException {
//			MultipartFile uploadFile = vo.getUploadFile();
//			if(!uploadFile.isEmpty()) {
//				fileUpload.uploadFile(vo);
//			}
			System.out.println("Controller insertQna");
			qnaService.insertQna(vo);
			return "redirect:getQnaList.do";
		}
		
		// 글 수정
		@RequestMapping(value="/updateQna.do")
		public String updateBoard(@ModelAttribute("qna") QnaVO vo) {
			System.out.println("글 수정 처리");
			qnaService.updateQna(vo);
			return "redirect:getQnaList.do";
		}
		
		// 글 삭제
		@RequestMapping(value="/deleteQna.do")
		public String deleteQna(QnaVO vo) {
			System.out.println("글 삭제 처리");
			qnaService.deleteQna(vo);
			return "redirect:getQnaList.do";
		}
		
		// 글 상세 조회
		@RequestMapping(value="/detailQna.do")
		public String detailQna(QnaVO vo, Model model) {
			System.out.println("글 상세 조회 처리");
			model.addAttribute("qnaDetail", qnaService.detailQna(vo));
			return "detailQna";
		}
		
		@RequestMapping(value="/getQnaList.do")
		public String getQnaList(QnaVO vo, Model model) {
			// null check
//			if(vo.getSearchCondition() == null) vo.setSearchCondition("title");
//			if(vo.getSearchKeyword() == null) vo.setSearchKeyword("");
			System.out.println("Controller QnaList");
//			model.addAttribute("qnaList", qnaService.getQnaList(vo)); //model 정보저장
			return "/admin/qna/getQnaList";
		}
		
		@RequestMapping(value="/insertQnaView.do")
		public String insertQnaView() {
			System.out.println("Controller insertQnaView");
			return "/admin/qna/insertQna";
		}
}
