package com.shepe.client.cart.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shepe.client.cart.CartService;
import com.shepe.client.cart.CartVO;


@Service("cartService")
public class CartServiceImpl implements CartService{
	@Autowired
	private CartDAOMybatis CartDAO;
	
	public void insertCart(CartVO cartVO, HttpSession session) {
		System.out.println((String)session.getAttribute("member_id"));
		cartVO.setMember_id((String)session.getAttribute("member_id"));
		System.out.println(cartVO);
		CartDAO.insertCart(cartVO);
	}
	
	public void updateCartCnt(CartVO cartVO){
		CartDAO.updateCartCnt(cartVO);
	}

	public void deleteCart(Map<String, List<String>> map) {
		List<String> arr = map.get("checkBox");
		CartDAO.deleteCart(arr);
	}
	
	public List<CartVO> getCartList(CartVO vo){
		return CartDAO.getCartList(vo);
	}
}
