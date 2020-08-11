package com.shepe.client.cart;

import java.util.List;
import java.util.Map;


public interface CartService {
	
	void insertCart(CartVO vo);

	void updateCartCnt(CartVO vo);
	
	void deleteCart(Map<String, List<String>> map);

	List<CartVO> getCartList(CartVO vo);
}
