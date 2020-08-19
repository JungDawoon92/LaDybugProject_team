package com.shepe.client.cart.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.shepe.client.cart.CartVO;



@Repository
public class CartDAOMybatis{
	@Autowired
	private SqlSessionTemplate mybatis;

	@Transactional
	public void insertCart(CartVO vo) {
		System.out.println("--> Mybatis로 insertCart() 기능 처리");
		mybatis.insert("CartDAO.insertCart", vo);
	}
	
	@Transactional
	public void updateCartCnt(CartVO vo) {
		System.out.println("--> Mybatis로 cartCntUpdate() 기능 처리");
		mybatis.update("CartDAO.cartCntUpdate", vo);
	}
	@Transactional
	public void deleteCart(List<String> arr) {
		System.out.println("--> Mybatis로 deleteCart() 기능 처리");
		mybatis.delete("CartDAO.deleteCart", arr);
	}
	
	public List<CartVO> getCartList(CartVO vo) {
		System.out.println("--> Mybatis로 getCartList() 기능 처리");
		return mybatis.selectList("CartDAO.getCartList", vo);
	}
}
