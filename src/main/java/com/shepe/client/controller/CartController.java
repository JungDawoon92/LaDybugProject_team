package com.shepe.client.controller;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shepe.client.cart.CartService;
import com.shepe.client.cart.CartVO;


@Controller
public class CartController {
	private Logger logger = LoggerFactory.getLogger(CartController.class);

	@Autowired
	private CartService cartService;
	
	@RequestMapping(value="/cartList")
	public String getCartList(HttpSession session, CartVO cartVO, Model model) {
		logger.info("cart 리스트 처리");
		cartVO.setMember_id((String) session.getAttribute("member_id"));
		model.addAttribute("cartList", cartService.getCartList(cartVO));
		return "client/cart/Cart";
	}
	
	@RequestMapping(value="/insertCart", method=RequestMethod.POST)
	public String insertCart(CartVO cartVO, HttpSession session) {
		logger.info("cart 등록 처리");
		System.out.println(cartVO);
		cartService.insertCart(cartVO, session);
		return "redirect:/cartList";
	}
	
	@RequestMapping(value= "/updateCartCnt")
	public String updateCartCnt(@RequestBody CartVO cartVO) {
		System.out.println(cartVO);
		logger.info("cart 수량 업데이트 처리");
		cartService.updateCartCnt(cartVO);		
		return "redirect:/jsonDataTransform";
	}
	
	@RequestMapping(value= "/deleteCart")
	public String deleteCart(@RequestBody Map<String, List<String>> chMap) {
		logger.info("cart 삭제 처리");
		cartService.deleteCart(chMap);
		return "redirect:/jsonDataTransform";
	}
	
	@RequestMapping("/jsonDataTransform")
	@ResponseBody
	public List<CartVO> jsonDataTransform(HttpSession session){
		logger.info("jsonData");
		CartVO cartVO = new CartVO();
		cartVO.setMember_id((String) session.getAttribute("member_id"));
		List<CartVO> cartList = cartService.getCartList(cartVO);
		return cartList;
	}
}
