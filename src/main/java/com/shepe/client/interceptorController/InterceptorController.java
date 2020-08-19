package com.shepe.client.interceptorController;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shepe.client.member.MemberService;
import com.shepe.client.member.MemberVO;

@Controller
public class InterceptorController {
	
	@Autowired
	private MemberService memberService;
	
	private static final Logger logger = LoggerFactory.getLogger(InterceptorController.class);
	
	// 마이페이지 이동
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public String myPageGet() {
		logger.info("myPage() called");
		
		return "redirect:/myPage/orderHistory";
	}
	
//	@RequestMapping(value = "/myPage", method = RequestMethod.POST)
//	public String myPagePost() {
//		logger.info("myPage() called");
//
//		return "redirect:/myPage.do";
//	}
	
	// 회원 상세 정보 확인 페이지
	@RequestMapping(value="/myPage/memberDetail.do", method = RequestMethod.GET)
	public String memberDetailGet(MemberVO vo, Model model, HttpSession session) throws Exception {
		logger.info("myPage Detail");
		String member_id = (String) session.getAttribute("member_id");
		model.addAttribute("member", memberService.getMember(member_id));
		return "/client/member/memberUpdateView";
	}
	
//	// 회원 상세 정보 확인 페이지
//	@RequestMapping(value="/myPage/memberDetail.do", method = RequestMethod.POST)
//	public String memberDetailPost(MemberVO vo, Model model, HttpSession session) throws Exception {
//		logger.info("myPage Detail_Update");
//		String member_id = (String) session.getAttribute("member_id");
//		model.addAttribute("member", memberService.getMember(member_id));
//		System.out.println("post"+ vo.toString());
//		return "/client/member/memberUpdateView";
//	}
	
	// 비밀번호 변경 페이지 이동
	@RequestMapping(value = "/myPage/changePWD.do", method = RequestMethod.GET)
	public String changePWD(MemberVO vo, Model model, HttpSession session) {
		logger.info("myPage changePWD");
		String member_id = (String) session.getAttribute("member_id");
		model.addAttribute("member", memberService.getMember(member_id));
		return "/client/member/changePWD";
	}

	// 회원 탈퇴 페이지 이동
	@RequestMapping(value="/myPage/memberDeleteView", method = RequestMethod.GET)
	public String memberDeleteView() throws Exception{
		logger.info("myPage memberDeleteView");
		return "/client/member/memberDeleteView";
	}
}
