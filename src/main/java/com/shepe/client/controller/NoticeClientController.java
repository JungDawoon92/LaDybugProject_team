package com.shepe.client.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
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
@SessionAttributes("noticeClientDetail")
public class NoticeClientController {

	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private ListPaging boardPaging;
	
	// 글 등록
	@RequestMapping(value="insertNotice.do")
	public String insertNotice(NoticeVO vo, MultipartHttpServletRequest mtfRequest) throws IOException {
		
		List<MultipartFile> uploadFile = mtfRequest.getFiles("uploadFile");
		String uploadPath = "C:\\Users\\KOSMO_29\\Documents\\project\\Shepe\\src\\main\\webapp\\resources\\notice_img\\";
		
		for(MultipartFile mf : uploadFile) {
			String originFileName = mf.getOriginalFilename();
			long fileSize = mf.getSize();
			
			System.out.println("originFileName : " + originFileName);
			System.out.println("fileSzie : " + fileSize);
			String safeFile = uploadPath + System.currentTimeMillis() + originFileName;
			
			try {
				mf.transferTo(new File(safeFile));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			vo.setNotice_img(originFileName);
		}
		System.out.println("Controller insertNotice upload \nuploadFile : " + uploadFile);
		noticeService.insertNotice(vo);
		return "redirect:getClientNoticeList.do";
	}
		
		// 글 수정
		@RequestMapping(value="updateNotice.do")
		public String updateNotice(@ModelAttribute("notice") NoticeVO vo, Model model) {
			System.out.println("Controller updateNotice");
			System.out.println("updateNotice "+ vo.getNotice_contents() + " " + vo.getNotice_sq());
			noticeService.updateNotice(vo);
			return "redirect:getClientNoticeList.do";
		}
		
		// 글 삭제
		@RequestMapping(value="deleteClientNotice.do")
		public String deleteNotice(NoticeVO vo) {
			System.out.println("Controller deleteNotice");
			noticeService.deleteNotice(vo);
			return "redirect:getClientNoticeList.do";
		}
		
		// 글 상세 조회, 조회수
		@RequestMapping(value="detailClientNotice.do")
		public String detailNotice(@RequestParam(value="notice_sq") int notice_sq, Model model) {
			noticeService.updateNoticeRC(notice_sq);
			model.addAttribute("noticeDetail", noticeService.detailNotice(notice_sq));
			System.out.println("Cl Controller detailNotice sq : "+ noticeService.detailNotice(notice_sq));
			return "/client/notice/detailClientNotice";
		}
		
		@RequestMapping(value="getClientNoticeList.do")
		public String getNoticeList(@RequestParam(value="page", required=false) String page,
									PagingVO po, Model model) {
			int pager;
			if(page == null) {
				pager = 1;
			} else {
				pager = Integer.parseInt(page);
			}
			
		    int listcount = noticeService.getListCount();
		    
			System.out.println("Cl Controller NoticeList");
			model.addAttribute("paging", boardPaging.paging(pager, listcount, po));
			model.addAttribute("noticeList", noticeService.getNoticeList(pager)); //model 정보저장
			return "/client/notice/getClientNoticeList";
		}

		
		@ResponseBody
		@RequestMapping(value="/getClientNoticeListScroll.do")
		public List<NoticeVO> getNoticeListScroll(@RequestParam(value="pager") int page, Model model) {
			
			int offset = (page - 1) * 10;
//			model.addAttribute("noticeList", noticeService.getNoticeList(pager)); //model 정보저장
			return noticeService.getNoticeListScroll(offset);
		}
		
		
		@RequestMapping(value="/insertClientNoticeView.do")
		public String insertNoticeView() {
			System.out.println("Controller insertNoticeView");
			return "/notice/insertNotice";
		}
		
		@RequestMapping(value="/updateClientNoticeView.do")
		public String updateNoticeView(@ModelAttribute("noticeDetail") NoticeVO vo, Model model) {
			System.out.println("Controller updateNoticeView");
			System.out.println("ListView sq"+ vo.getNotice_sq());
			return "/notice/updateNotice";//해당 게시글로
		}
}
