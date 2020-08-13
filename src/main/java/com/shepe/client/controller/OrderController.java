package com.shepe.client.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.shepe.client.member.MemberAddressVO;
import com.shepe.client.member.MemberService;
import com.shepe.client.member.MemberVO;
import com.shepe.client.order.OrderService;

@Controller
public class OrderController {
	private Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Autowired
	private OrderService orderService;
	@Autowired
	private MemberService memberService;

	@RequestMapping(value= "/orderForm", method=RequestMethod.POST)
	public String orderForm(@RequestParam Map<String, String> param, HttpSession session, Model model) throws IOException {
		logger.info("orderForm");

		if(session.getAttribute("member_id") == null)
			return "redirect:/login.do";
		MemberAddressVO addrVO = new MemberAddressVO();
		addrVO.setMember_id((String) session.getAttribute("member_id"));
		
		model.addAttribute("orderPriceSum", param.get("orderPriceSum"));
		model.addAttribute("orderList", orderService.viewOrder(param));
		model.addAttribute("addressList", memberService.getAddress(addrVO));
		return "client/order/OrderForm";
	}
	
	@RequestMapping(value="/insertOrder")
	public String insertOrder(@RequestParam Map<String, String> param, HttpSession session, Model model) throws Exception {
		logger.info("insertOrder");
		String uri = null;
		MemberVO memberVO = new MemberVO();
		memberVO.setMember_id((String) session.getAttribute("member_id"));
		memberVO = memberService.getMember(memberVO);
		
		model.addAttribute("map", orderService.insertOrder(param, memberVO));
		if(param.get("payType").equals("KAKAO_PAY")) {
			uri = "kakaoPay";
		}
		System.out.println(uri);
		return "forward:/" + uri;
	}
	
//	@RequestMapping(value="/paymentCancel")
//	public String deleteOrderFail(OrderBindVO vo) {
//		logger.info("deleteOrderFail");
//		orderService.deleteOrderFail(vo);
//		return null;
//	}
	
	@RequestMapping(value="/myPage/orderHistory")
	public String orderHistory(HttpSession session, Model model) {
		model.addAttribute("orderHistory", orderService.orderHistory(session));
		return "client/order/OrderHistory";
	}
}
