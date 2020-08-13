package com.shepe.client.order.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shepe.client.order.OrderVO;

@Repository
public class OrderDAOMybatis{
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertOrder(Map<String, Object> map) throws Exception {
		mybatis.insert("OrderDAO.insertOrderInfo", map.get("orderInfo"));
		mybatis.insert("OrderDAO.insertOrderIngredient", (List<?>) map.get("orderItemList"));	
		mybatis.insert("OrderDAO.insertOrderMember", map.get("orderMember"));
	}
	
	public int updatePaymentCompleted(String order_no) {
		return mybatis.update("OrderDAO.updatePaymentCompleted", order_no);
	}
	
	public int deletePaymentFail(String order_no) {
		return mybatis.delete("OrderDAO.deletePaymentFail", order_no);
	}
	
	public List<OrderVO> orderHistory(String member_id) {
		List<OrderVO> orderList = mybatis.selectList("getOrderHistory", member_id);
		for(OrderVO vo : orderList) {
			System.out.println(vo);
		}
		return orderList;
	}
}
