package com.shepe.admin.controller;

import java.io.IOException;
import java.util.List;

import org.apache.commons.fileupload.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.shepe.admin.board.common.ListPaging;
import com.shepe.admin.board.common.PagingVO;
import com.shepe.admin.faq.FaqService;
import com.shepe.admin.faq.FaqVO;

@Controller
@SessionAttributes("faqDetail")
public class FaqController {

	@Autowired
	private FaqService faqService;
	
	@Autowired
	private ListPaging boardPaging;
	
	// 글 등록
		@RequestMapping(value="/admin/insertFaq.do")
		public String insertBoard(FaqVO vo, FileUpload fileUpload) throws IOException {
//			MultipartFile uploadFile = vo.getUploadFile();
//			if(!uploadFile.isEmpty()) {
//				fileUpload.uploadFile(vo);
//			}
			System.out.println("Controller insertFaq");
			faqService.insertFaq(vo);
			return "redirect:/admin/getFaqList.do";
		}
		
		// 글 수정
		@RequestMapping(value="/admin/updateFaq.do")
		public String updateBoard(@ModelAttribute("faq") FaqVO vo, Model model) {
			System.out.println("Controller updateFaq");
			System.out.println("updateFaq "+vo.getFaq_contents() + " " + vo.getFaq_sq());
			faqService.updateFaq(vo);
			return "redirect:getFaqList.do";
		}
		
		// 글 삭제
		@RequestMapping(value="/admin/deleteFaq.do")
		public String deleteFaq(FaqVO vo) {
			System.out.println("Controller deleteFaq");
			faqService.deleteFaq(vo);
			return "redirect:getFaqList.do";
		}
		
		// 글 상세 조회
		@RequestMapping(value="/admin/detailFaq.do")
		public String detailFaq(FaqVO vo, Model model) {
			System.out.println("Controller detailFaq sq : "+ vo.getFaq_sq());
			model.addAttribute("faqDetail", faqService.detailFaq(vo));
			System.out.println("detail controller"+faqService.detailFaq(vo));
			return "redirect:/admin/getFaqList.do";
		}
		
		@RequestMapping(value="/admin/getFaqList.do")
		public String getFaqList(@RequestParam(value="page", required=false) String page,
									PagingVO po, FaqVO vo, Model model) {
			int pager;
			if(page == null) {
				pager = 1;
			} else {
				pager = Integer.parseInt(page);
			}
		    int listcount = faqService.getListCount();
		    
			System.out.println("Controller FaqList");
			model.addAttribute("paging", boardPaging.paging(pager, listcount, po));
			model.addAttribute("faqList", faqService.getFaqList(pager)); //model 정보저장
			return "/admin/faq/getFaqList";
		}
		
		@ResponseBody
		@RequestMapping(value="/admin/getAjaxFaqList.do")
		public List<FaqVO> getAjaxFaqList(@RequestParam(value="choice", required=false) String choice, FaqVO vo, Model model) {
			System.out.println("Controller getAjaxFaqList");
			return faqService.getAjaxFaqList(choice);
		}
		
		@RequestMapping(value="/admin/insertFaqView.do")
		public String insertFaqView() {
			System.out.println("Controller insertFaqView");
			return "admin/faq/insertFaq";
		}
		
		@RequestMapping(value="/admin/updateFaqView.do")
		public String updateFaqView(@ModelAttribute("faqDetail") FaqVO vo, Model model) {
			System.out.println("Controller updateFaqView");
			System.out.println("ListView sq"+ vo.getFaq_sq());
			return "faq/updateFaq";
		}
		
		
}