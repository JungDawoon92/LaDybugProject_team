package com.shepe.client.order;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.shepe.client.cart.CartVO;
import com.shepe.client.member.MemberVO;


public interface OrderService {
	
	List<CartVO> viewOrder(Map<String, String> param);
	
	Map<String, Object> insertOrder(Map<String, String> param, MemberVO memberVO, HttpSession session) throws Exception;

	public List<OrderVO> orderHistory(HttpSession session);
	
	public boolean updatePaymentCompleted(String order_no);
	
	public boolean deletePaymentFail(String order_no);
}
