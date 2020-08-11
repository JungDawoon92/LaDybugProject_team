package com.shepe.client.controller;

import java.io.UnsupportedEncodingException;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shepe.admin.biz.chat.BootService;
import com.shepe.admin.biz.chat.BootVO;
import com.shepe.client.member.KakaoAccessToken;
import com.shepe.client.member.MemberService;
import com.shepe.client.member.MemberVO;
import com.shepe.client.member.NaverLoginBO;

@Controller
public class MemberController {
   
   private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
   
   @Autowired
   private MemberService memberService;   
   @Autowired
   private BootService bootservice;

   @Inject
   BCryptPasswordEncoder pwdEncoder;
   
//   /* NaverLoginBO */
   private NaverLoginBO naverLoginBO;
   
   @Autowired
   private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
      this.naverLoginBO = naverLoginBO;
   }
   // test
   @RequestMapping(value = "/test", method = RequestMethod.GET)
   public String test() {
      return "/client/member/test";
   }   
   
   // 회원 가입 1단계
   @RequestMapping(value = "/joinOption.do", method = RequestMethod.GET)
   public String joinView() {
      return "/client/member/joinOption";
   }

   // 회원 가입 2단계 (약관 동의 여부 체크)
   @RequestMapping(value = "/terms.do", method = RequestMethod.GET)
   public String joinTerms() {
      return "/client/member/terms";
   }
   
   // 회원 가입 3단계 (회원 정보 입력)
   @RequestMapping(value = "/joinForm.do", method = RequestMethod.GET)
   public String joinFormGET(@RequestParam(value = "agree", defaultValue = "false") Boolean agree) {
      if (!agree) {
         return "redirect:/terms.do";
      } else {
         return "/client/member/joinForm";
      }
   }
   
   // 회원 가입 3단계 (회원 정보 입력)
   @RequestMapping(value = "/joinForm.do", method = RequestMethod.POST)
   public String joinForm(@RequestParam(value = "agree", defaultValue = "false") Boolean agree) {
      if(!agree) {
         return "redirect:/terms.do";
      } else {
         return "/client/member/joinForm";
      }
   }
   
   // 로그인 페이지 이동
   @RequestMapping(value = "/login.do", method = RequestMethod.GET)
   public String loginGet(Model model, HttpSession session) {
      /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
      String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
      String kakaoUrl = KakaoAccessToken.getAuthorizationUrl(session);
            
      //네이버 
      model.addAttribute("naver_url", naverAuthUrl);
      model.addAttribute("kakao_url", kakaoUrl);      

      /* 생성한 인증 URL을 View로 전달 */
      return "/client/member/login_resist_form";
   }   
   
   // 회원가입 + 인증 메일 발송
   @RequestMapping(value = "/registerMember.do", method = RequestMethod.POST)
   public String formSuccess(MemberVO vo, HttpServletRequest request) throws MessagingException, UnsupportedEncodingException {
      logger.info("---> mybatis로 insertMember() 기능 처리 및 해당 이메일로 이메일 발송");
      memberService.insertMember(vo);
      return "/client/member/signConfirm";
   }
   
   // 메일 인증 처리
   @RequestMapping(value = "/verify.do", method = RequestMethod.GET)
   public String signSuccess(MemberVO vo) {
      logger.info("이메일 인증기능 처리");
      memberService.verifyMember(vo);
      return "/client/member/signSuccess";
   }   
   
   // 로그인
   @RequestMapping(value="/login.do", method=RequestMethod.POST)
   public ModelAndView loginview(MemberVO vo, HttpServletRequest request, Model model, RedirectAttributes rttr, HttpServletResponse response) {      
      ModelAndView mav = new ModelAndView();
      HttpSession session = request.getSession();
      MemberVO member = memberService.getMember(vo);   
      int ischangePWD = memberService.check90overPW(vo);      
//      boolean pwdMatch = pwdEncoder.matches(vo.getMember_password(), member.getMember_password());
      
      // 인터셉터 적용 시 사용자가 요청한 url 저장
//      String prev_url = (String)session.getAttribute("prev_url");
      if (member == null) {
         rttr.addFlashAttribute("member_null", false);
         mav.setViewName("redirect:/login.do");
         return mav;
      } else {         
         boolean pwdMatch = pwdEncoder.matches(vo.getMember_password(), member.getMember_password());
         if (member != null && pwdMatch == true) {
            // 인터셉터 적용 시 사용자가 요청한 url 저장
            String prev_url = (String)session.getAttribute("prev_url");
               // 이메일 인증, 탈퇴하지 않은, 계정 LOCK이 아닌 사용자만 로그인 가능
            if (member.getMember_verify() == 'y' && member.getDel_update() == 'n' && member.getAccountLock() == 'n') {
               memberService.countFailureInitialize(member.getMember_id());
               memberService.insertMemberLoginDay(vo);
               BootVO bo = bootservice.BootContent();               
               session.setAttribute("BootContent", bo);
               session.setAttribute("member_id", member.getMember_id());
               session.setAttribute("member_nick", member.getMember_nickname());
               
               if(prev_url != null) {
                  mav.setViewName("forward:/" + prev_url);
                  memberService.insertMemberLoginDay(vo);
               } else {
                  if ( ischangePWD != 0 ) {
//                     session.setAttribute("ischangePWD", member.getChangePWD_date());
                     model.addAttribute("ischangePWD", ischangePWD);
                     memberService.insertMemberLoginDay(vo);
                     mav.setViewName("forward:/");
                     return mav;                   
                  }
                  mav.setViewName("redirect:/");
               }
               return mav;
              // 탈퇴한 회원이면 로그인 x
            } else if (member.getDel_update() == 'y') {
               rttr.addFlashAttribute("drop_member", false);
               mav.setViewName("redirect:/login.do");
               return mav;
            } else if ( member.getAccountLock() == 'y' ) {
                rttr.addFlashAttribute("account_lock", false);
               mav.setViewName("redirect:/login.do");
                 return mav;
                
            } else if ( member.getMember_verify() == 'n' ) {
                rttr.addFlashAttribute("authorize_msg", false);
               mav.setViewName("redirect:/login.do");
                 return mav;
                
            }
               
         } else {                
                // LOGIN_FAIL_COUNT를 1 증가시킨다.                
                memberService.countFailure(vo.getMember_id());                
                // LOGIN_FAIL_COUNT가 5이상이라면 IS_ACCOUNT_LOCK를 'Y'로 수정한다.                 
                int failCheck = memberService.checkFailureCount(vo.getMember_id());               
                switch (failCheck) {
               case 1: rttr.addFlashAttribute("fail_first", false);                  
                     break;
               case 2: rttr.addFlashAttribute("fail_second", false);         
                     break;
               case 3: rttr.addFlashAttribute("fail_third", false);               
                     break;
               case 4: rttr.addFlashAttribute("fail_fourth", false);                  
                     break;
               case 5: rttr.addFlashAttribute("account_lock", false);
                     memberService.isAccountLock(vo.getMember_id());                     
                     break;      
               default:
                     break;
               }               
               System.out.println("실패 횟수: " + failCheck);                
            }
            rttr.addFlashAttribute("account_lock", false);
            mav.setViewName("redirect:/login.do");
            return mav;
         }            
      }
      

   // 로그아웃
   @RequestMapping(value="/logout.do", method = RequestMethod.GET)
   public String logout(HttpServletRequest requset, MemberVO vo) {
      HttpSession session = requset.getSession();
      session.invalidate();
      System.out.println("로그아웃 처리");
      return "redirect:/";
   }
   
   // 아이디 중복 체크 컨트롤러
   @RequestMapping(value = "/idCheck", method = RequestMethod.GET)
   @ResponseBody
   public int idCheck(@RequestParam("memberId") String member_id) {
      return memberService.memberIdCheck(member_id);
   }
   
   // 닉네임 중복 체크 컨트롤러
   @RequestMapping(value = "/nickCheck", method = RequestMethod.GET)
   @ResponseBody
   public int nickCheck(@RequestParam("member_nickname") String member_nickname) {
      return memberService.NickCheck(member_nickname);
   }
   
   // 패스워드 체크
   @ResponseBody
   @RequestMapping(value = "/passChk", method = RequestMethod.POST)
   public boolean passChk(MemberVO vo, HttpSession session) throws Exception {
      MemberVO login = memberService.getMember(vo);
      boolean pwdChk = pwdEncoder.matches(vo.getMember_password(), login.getMember_password());
      
      return pwdChk;
   }
      
   // 회원 정보 수정
   @RequestMapping(value="/memberUpdate.do", method = RequestMethod.POST)
   public String memberInfoUpdate(MemberVO vo, HttpSession session, Model model) {
      memberService.memberUpdate(vo);
      model.addAttribute("member", memberService.getMember(vo));
      return "redirect:/interceptor/memberDetail.do";
   }   
      
   // 회원 탈퇴 수행
   @RequestMapping(value = "/memberDelete.do", method = RequestMethod.POST)
   public String memberDelete(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {
         memberService.delUpdate(vo); // 회원 삭제 여부 컬럼 업데이트
         memberService.delDate(vo);   // 회원 삭제 날짜 insert
         session.invalidate();
         logger.info("회원 탈퇴");
         return "redirect:/";      
   }   
   
   // 아이디, 패스워드 찾기 페이지
   @RequestMapping(value = "/forgetInfo.do", method = RequestMethod.GET)
   public String forgetMemberInfo() {
      return "/client/member/forgetMemberInfo";
   }
   
   // 아이디 찾기   
   @ResponseBody
   @RequestMapping(value = "/searchID.do", method = RequestMethod.POST)
   public String searchID(MemberVO vo) {
      MemberVO searchID = memberService.searchID(vo);
      if (searchID != null) {
         return searchID.getMember_id();
      } else {
         return "x";
      }
   }
   
   // 비밀번호 찾기
   @ResponseBody
   @RequestMapping(value = "/searchPW.do", method = RequestMethod.POST)
   public void searchPW(MemberVO vo) throws MessagingException, UnsupportedEncodingException {
      memberService.searchPW(vo);                              // 임시 비밀번호 생성
      memberService.accountLockInitialize(vo.getMember_id());         // 계정 잠금 초기화   
      
   }   
   
   // 비밀번호 변경
   @RequestMapping(value = "updatePWD.do", method = RequestMethod.POST)
   public ModelAndView getupdatePWD(MemberVO vo, HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException, MessagingException {      
      ModelAndView mav = new ModelAndView();
      memberService.updatePW(vo, request);
      memberService.changePWDateInitialize(vo); // 비밀번호 변경 날짜 현재날짜로 최신화
      mav.setViewName("forward:/");
      mav.addObject(vo);
      session.invalidate();
      return mav;
   }

}