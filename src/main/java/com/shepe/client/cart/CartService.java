package com.shepe.client.cart;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;


public interface CartService {
	
	void insertCart(CartVO vo, HttpSession session);

	void updateCartCnt(CartVO vo);
	
	void deleteCart(Map<String, List<String>> map);

	List<CartVO> getCartList(CartVO vo);
}
