package com.shepe.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.shepe.admin.board.common.ListPaging;
import com.shepe.admin.board.common.PagingVO;
import com.shepe.admin.notice.NoticeService;
import com.shepe.admin.notice.NoticeVO;

@Controller
@SessionAttributes("noticeDetail")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private ListPaging boardPaging;
	
	// 글 등록
	@RequestMapping(value="/admin/insertNotice.do")
	public String insertNotice(NoticeVO vo, MultipartHttpServletRequest mtfRequest) throws IOException {
		
		List<MultipartFile> uploadFile = mtfRequest.getFiles("uploadFile");
		String uploadPath = "C:\\Users\\KOSMO_29\\Documents\\project\\Shepe\\src\\main\\webapp\\resources\\img\\notice_img\\";
		
		for(MultipartFile mf : uploadFile) {
			String originFileName = mf.getOriginalFilename();
			long fileSize = mf.getSize();
			String fileName = System.currentTimeMillis() + originFileName;
			System.out.println("originFileName : " + originFileName);
			System.out.println("fileSzie : " + fileSize);
			String safeFile = uploadPath + fileName;
			// 저장한이름, 불러오는 이름 일관화
			try {
				mf.transferTo(new File(safeFile));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			vo.setNotice_img(fileName);
		}
		System.out.println("Controller insertNotice upload \nuploadFile : " + uploadFile);
		noticeService.insertNotice(vo);
		return "redirect:/admin/getNoticeList.do";
	}
		
		// 글 수정
		@RequestMapping(value="/admin/updateNotice.do")
		public String updateNotice(@ModelAttribute("notice") NoticeVO vo, Model model) {
			System.out.println("Controller updateNotice");
			System.out.println("updateNotice "+ vo.getNotice_contents() + " " + vo.getNotice_sq());
			noticeService.updateNotice(vo);
			return "redirect:/admin/getNoticeList.do";
		}
		
		// 글 삭제
		@ResponseBody
		@RequestMapping(value="/admin/deleteNotice.do", method = RequestMethod.POST)
		public String deleteNotice(@RequestParam(value = "chbox[]") List<String> chArr, NoticeVO vo) throws Exception {
			System.out.println("Controller Delete");
			int notice_sq = 0;
			
			for(String i : chArr) {   
				notice_sq = Integer.parseInt(i);
				vo.setNotice_sq(notice_sq);
				noticeService.deleteNotice(vo);
			}
			return "redirect:/admin/getNoticeList.do";
		}
		
		// 글 상세 조회
		@RequestMapping(value="/admin/detailNotice.do")
		public String detailNotice(@RequestParam(value="notice_sq")int notice_sq, Model model) {
			noticeService.detailNotice(notice_sq);
			model.addAttribute("noticeDetail", noticeService.detailNotice(notice_sq));
			System.out.println("Controller detailNotice sq : "+ noticeService.detailNotice(notice_sq));
			return "/admin/notice/detailNotice";
		}
		
		@RequestMapping(value="/admin/getNoticeList.do")
		public String getNoticeList(@RequestParam(value="page", required=false) String page,
									PagingVO po, Model model) {
			int pager;
			if(page == null) {
				pager = 1;
			} else {
				pager = Integer.parseInt(page);
			}
			
		    int listcount = noticeService.getListCount();
		    
			System.out.println("Controller NoticeList");
			model.addAttribute("paging", boardPaging.paging(pager, listcount, po));
			model.addAttribute("noticeList", noticeService.getNoticeList(pager)); //model 정보저장
			return "/admin/notice/getNoticeList";
		}

		
		@ResponseBody
		@RequestMapping(value="/admin/getNoticeListScroll.do")
		public List<NoticeVO> getNoticeListScroll(@RequestParam(value="pager") int page, Model model) {
			
			int offset = (page - 1) * 10;
//			model.addAttribute("noticeList", noticeService.getNoticeList(pager)); //model 정보저장
			return noticeService.getNoticeListScroll(offset);
		}
		
		
//		@RequestMapping(value="/getNoticeListAjax.do")
//		public String getNoticeListAjax(@RequestParam(value="page", required=false) String page,
//									PagingVO po, Model model) {
//			int pager;
//			if(page == null) {
//				pager = 1;
//			} else {
//				pager = Integer.parseInt(page);
//			}
//			
//		    int listcount = noticeService.getListCount();
//		    
//			model.addAttribute("paging", boardPaging.paging(pager, listcount, po));
//			model.addAttribute("noticeList", noticeService.getNoticeList(pager)); //model 정보저장
//			return "/admin/notice/getNoticeListAjax";
//		}
		
		@RequestMapping(value="/admin/insertNoticeView.do")
		public String insertNoticeView() {
			System.out.println("Controller insertNoticeView");
			return "/admin/notice/insertNotice";
		}
		
		@RequestMapping(value="/admin/updateNoticeView.do")
		public String updateNoticeView(@ModelAttribute("noticeDetail") NoticeVO vo, Model model) {
			System.out.println("Controller updateNoticeView");
			System.out.println("ListView sq"+ vo.getNotice_sq());
			return "/admin/notice/updateNotice";//해당 게시글로
		}
}
