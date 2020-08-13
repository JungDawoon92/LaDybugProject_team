package com.shepe.commons;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class Interceptor extends HandlerInterceptorAdapter {
	
	// 지정된 컨트롤러의 동작 이전에 가로채는 역할로 사용
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		String path = request.getServletPath();
//		String queryStr = request.getQueryString(); // 파라미터가 있는지 없는지
//		System.out.println(queryStr);		
		
		HttpSession session = request.getSession();
		String IsLogin = (String) session.getAttribute("member_id");

		if (IsLogin == null) {
//			session.setAttribute("prev_url", path+"?"+queryStr);
			session.setAttribute("prev_url", path);
			response.sendRedirect("/shepe/login.do");
			System.out.println("prev_url: " + " " + path);
//			System.out.println("prev_url의 path: " + path);
			return false;
		} else {
			session.setAttribute("prev_url", path);
		}
		return true;
	}
	
	// 지정된 컨트롤러의 동작 이후에 처리, Spring MVC의 FrontController인 DispatcherServlet이 화면을 처리하기 전에 동작
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}
	
	// DispatcherServletdml 화면처리가 완료된 상태에서 처리
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		super.afterCompletion(request, response, handler, ex);
	}
	
	
}
