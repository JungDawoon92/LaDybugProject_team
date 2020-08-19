package com.shepe.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.shepe.admin.biz.chat.BootService;
import com.shepe.admin.biz.chat.BootVO;
import com.shepe.admin.member.Admin_MemberService;
import com.shepe.client.member.MemberService;
import com.shepe.client.member.MemberVO;
import com.shepe.commons.Criteria;
import com.shepe.commons.PageMaker;

@Controller
public class Admin_MemberController {
	
	@Autowired
	private Admin_MemberService adminService;
	@Autowired
	private MemberService memberService;
	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
	@Autowired
    private BootService bootservice;
	
	// 검색 조건 목록 설정
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("아이디", "member_id");
		conditionMap.put("이  름", "member_nm");
		return conditionMap;
	}
	
	// 사용자가 입력한 정보로부터 POST 요청은 Spring Security를 거친 후 해당 메서드로 들어온다.
    @GetMapping("/login") 
    public String login(@RequestParam(value="error", required=false) String error, @RequestParam(value="logout", required=false) String logout, Model model,HttpServletRequest request) {
        if(error != null) {
            model.addAttribute("errorMsg", "Invalid AdminName and Password");
        }
        if(logout != null) {
            model.addAttribute("logoutMsg", "You have been logged out successfully");
        }

        HttpSession session = request.getSession();
		BootVO vo = bootservice.BootContent();
		session.setAttribute("BootContentt", vo);
        
        return "/admin/member/admin_login"; // login.jsp(Custom Login Page)
    }
	
	// 관리자 회원 리스트 페이지
	@RequestMapping(value = "/admin/list", method = RequestMethod.GET)
	public String memberList(MemberVO vo, Model model, Criteria cri) throws Exception {
		
		model.addAttribute("list", adminService.adminMemberList(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(adminService.listCount());
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "/admin/member/memberList";
	}
	
	// 회원 정보 수정 페이지
	@RequestMapping(value = "/admin/adminUpdateView.ad", method = RequestMethod.GET)
	public String memberUpdate(@RequestParam int sq, Model model) throws Exception {
		model.addAttribute("read", adminService.read(sq));
		return "/admin/member/memberUpdateView";
	}
	
	// 회원 정보 수정
	@RequestMapping(value = "/admin/update.ad", method = RequestMethod.POST)
	public String update(MemberVO vo, HttpServletRequest request) throws Exception {
		String pwd = request.getParameter("member_password");
		String secretPwd = pwdEncoder.encode(pwd);
		vo.setMember_password(secretPwd);
		memberService.updatePW(vo, request);
		adminService.update(vo);
		return "redirect:/admin/list";
	}
	
	// 회원 정보 삭제
	@RequestMapping(value = "/admin/adminDelete.ad", method = RequestMethod.GET)
	public String memberDelete(@RequestParam int sq) throws Exception {
		adminService.delete(sq);

		return "redirect:/admin/list";
	}

	// 관리자 그래프 페이지 View
	@RequestMapping(value = "/admin/memberGraph.ad", method = RequestMethod.GET)
	public String memberGraph() throws Exception {
		return "/admin/member/memberBirthGraph";
	}
	
	// 회원 생년월일별 그래프
	@ResponseBody
	@RequestMapping(value = "/admin/birthGraph", method = RequestMethod.GET, produces = "application/text; charset=utf-8")
	public String memberBirthGraph(MemberVO vo) throws Exception {
		Gson memberBirthGson = new Gson();
		List<MemberVO> birthChart = adminService.searchMemberBirthCount(vo);
		return memberBirthGson.toJson(birthChart);		
	}
	
	// 회원 연령대별 그래프
	@ResponseBody
	@RequestMapping(value = "/admin/ageGraph", method = RequestMethod.GET, produces = "application/text; charset=utf-8")
	public String memberAgeGraph(MemberVO vo) throws Exception {
		Gson memberAgeGson = new Gson();
		List<MemberVO> ageChart = adminService.searchMemberAgeCount(vo);
		return memberAgeGson.toJson(ageChart);
	}
	
	// 회원 생년월일별 그래프
	@ResponseBody
	@RequestMapping(value = "/admin/loginGraph", method = RequestMethod.GET, produces = "application/text; charset=utf-8")
	public String memberLoginGraph(MemberVO vo) throws Exception {
		Gson memberLoginCntGson = new Gson();
		List<MemberVO> LoginCntChart = adminService.getMemberByLogin(vo);
		return memberLoginCntGson.toJson(LoginCntChart);
	}
	
}
