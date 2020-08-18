package com.shepe.client.controller;

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
@SessionAttributes("faqClientDetail")
public class FaqClientController {

	@Autowired
	private FaqService faqService;
	
	@Autowired
	private ListPaging boardPaging;
	
	// 글 등록
		@RequestMapping(value="insertClientFaq.do")
		public String insertClientBoard(FaqVO vo, FileUpload fileUpload) throws IOException {
//			MultipartFile uploadFile = vo.getUploadFile();
//			if(!uploadFile.isEmpty()) {
//				fileUpload.uploadFile(vo);
//			}
			System.out.println("Cl Controller insertFaq");
			faqService.insertFaq(vo);
			return "redirect:getClientFaqList.do";
		}
		
		// 글 수정
		@RequestMapping(value="updateClientFaq.do")
		public String updateBoard(@ModelAttribute("faq") FaqVO vo, Model model) {
			System.out.println("Cl Controller updateFaq "+vo.getFaq_contents() + " " + vo.getFaq_sq());
			faqService.updateFaq(vo);
			return "redirect:getClientFaqList.do";
		}
		
		// 글 삭제
		@RequestMapping(value="deleteClientFaq.do")
		public String deleteFaq(FaqVO vo) {
			System.out.println("Cl Controller deleteFaq");
			faqService.deleteFaq(vo);
			return "redirect:getClientFaqList.do";
		}
		
		// 글 상세 조회
		@RequestMapping(value="detailClientFaq.do")
		public String detailFaq(FaqVO vo, Model model) {
			System.out.println(vo.getFaq_sq());
			
			model.addAttribute("faqClientDetail", faqService.detailFaq(vo));
			System.out.println("Cl detail controller"+faqService.detailFaq(vo));
			return "redirect:/getClientFaqList.do";
		}

		// 채팅 글 상세 조회 
		@ResponseBody
		@RequestMapping(value="detailChatClientFaq.do")
		public FaqVO detailChatFaq(FaqVO vo, @RequestParam(value="faq_sq") int faq_sq) {
			faqService.updateFaqRC(faq_sq);
			//System.out.println(vo.getFaq_sq());
			//model.addAttribute("faqClientDetail", faqService.detailFaq(vo));
			//System.out.println("Cl detail controller"+faqService.detailFaq(vo));
			
			return faqService.detailFaq(vo);
		}
		
		@RequestMapping(value="getClientFaqList.do")
		public String getFaqList(@RequestParam(value="page", required=false) String page,
									PagingVO po, FaqVO vo, Model model) {
			int pager;
			if(page == null) {
				pager = 1;
			} else {
				pager = Integer.parseInt(page);
			}
		    int listcount = faqService.getListCount();
		    
			System.out.println("Cl Controller FaqList");
			model.addAttribute("paging", boardPaging.paging(pager, listcount, po));
			model.addAttribute("faqList", faqService.getFaqList(pager)); //model 정보저장
			model.addAttribute("faqRC", faqService.getFaqRC());
			System.out.println(model.addAttribute("faqRC", faqService.getFaqRC()));
			return "/client/faq/getClientFaqList";
		}
		
		@ResponseBody
		@RequestMapping(value="getClientAjaxFaqList.do")
		public List<FaqVO> getAjaxFaqList(@RequestParam(value="choice", required=false) String choice, FaqVO vo, Model model) {
			
			System.out.println("여기타나?");
			System.out.println(choice);
			
			System.out.println("Cl Controller getAjaxFaqList \n chice" + choice + "\n vo"+vo);
			return faqService.getAjaxFaqList(choice);
		}
		
		@RequestMapping(value="insertClientFaqView.do")
		public String insertFaqView() {
			System.out.println("Cl Controller insertFaqView");
			return "/client/faq/insertClientFaq";
		}
		
		@RequestMapping(value="updateClientFaqView.do")
		public String updateFaqView(@ModelAttribute("faqClientDetail") FaqVO vo, Model model) {
			System.out.println("Cl ListView sq"+ vo.getFaq_sq());
			return "/client/faq/updateClientFaq";
		}
		
}