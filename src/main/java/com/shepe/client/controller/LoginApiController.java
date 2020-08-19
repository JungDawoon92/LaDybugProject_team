package com.shepe.client.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.shepe.client.member.KakaoAccessToken;
import com.shepe.client.member.MemberVO;
import com.shepe.client.member.NaverLoginBO;

@Controller
public class LoginApiController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginApiController.class);
	
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView callback(@RequestParam String code, @RequestParam String state, HttpSession session, Model model, MemberVO vo) throws Exception {
		ModelAndView mav = new ModelAndView();
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);

		// 로그인한 사용자의 모든 정보가 JSON타입으로 저장되어 있음
		apiResult = naverLoginBO.getUserProfile(oauthToken);

		// 내가 원하는 정보 (이름)만 JSON타입에서 String타입으로 바꿔 가져오기 위한 작업
		JSONParser parser = new JSONParser();
		Object obj = null;
		try {
			obj = parser.parse(apiResult);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		JSONObject jsonobj = (JSONObject) obj;
		JSONObject response = (JSONObject) jsonobj.get("response");
		String nname = (String) response.get("name");
		String nemail = (String) response.get("email");
		String ngender = (String) response.get("gender");
		String nbirthday = (String) response.get("birthday");
		String nage = (String) response.get("age");
		String nimage = (String) response.get("profile_image");

		// 로그인&아웃 하기위한 세션값 주기
		session.setAttribute("member_id", nname);
		session.setAttribute("nemail", nemail);
		session.setAttribute("ngender", ngender);
		session.setAttribute("nbirthday", nbirthday);
		session.setAttribute("nage", nage);
		session.setAttribute("nimage", nimage);
		session.setAttribute("apiLogin", "true");
		
		// 네이버 로그인 성공 페이지 View 호출
		String prev_url = (String)session.getAttribute("prev_url");
		if(prev_url != null) {
			mav.setViewName("forward:/" + prev_url);
		} else {
			mav.setViewName("/client/member/loginNaver");			
		}
		logger.info("네이버 간편로그인 성공");
		return mav;

	}
		
	// 카카오 로그인
	@RequestMapping(value = "/kakaoLogin", produces = "application/json", method = { RequestMethod.GET,
			RequestMethod.POST })
	public ModelAndView kakaoLogin(@RequestParam("code") String code, MemberVO vo, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		// 결과값을 node에 담아줌
		JsonNode node = KakaoAccessToken.getAccessToken(code);
		// accessToken에 사용자의 로그인한 모든 정보가 들어있음
		JsonNode accessToken = node.get("access_token");
		// 사용자의 정보
		JsonNode userInfo = KakaoAccessToken.getKakaoUserInfo(accessToken);
		String kemail = null;
		String kname = null;
		String kgender = null;
		String kbirthday = null;
		String kage = null;
		String kimage = null;
		// 유저정보 카카오에서 가져오기 Get properties
		JsonNode properties = userInfo.path("properties");
		JsonNode kakao_account = userInfo.path("kakao_account");
		kemail = kakao_account.path("email").asText();
		kname = properties.path("nickname").asText();
		kimage = properties.path("profile_image").asText();
		kgender = kakao_account.path("gender").asText();
		kbirthday = kakao_account.path("birthday").asText();
		kage = kakao_account.path("age_range").asText();
		session.setAttribute("kemail", kemail);
		session.setAttribute("member_id", kname);
		session.setAttribute("kimage", kimage);
		session.setAttribute("kgender", kgender);
		session.setAttribute("kbirthday", kbirthday);
		session.setAttribute("kage", kage);
		session.setAttribute("apiLogin", "true");

		String prev_url = (String) session.getAttribute("prev_url");
		if (prev_url != null) {
			mav.setViewName("forward:/" + prev_url);
		} else {
			mav.setViewName("redirect:/");
		}
		logger.info("카카오 간편로그인 성공");
		return mav;
	}// end kakaoLogin()
}
