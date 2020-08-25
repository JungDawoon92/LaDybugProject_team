package com.shepe.pay.kakao.impl;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shepe.pay.kakao.KakaoPayApprovalVO;

@Repository
public class KakaoPayDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertKakaoPay(KakaoPayApprovalVO vo) throws Exception {
		mybatis.insert("insertKakaoPay", vo);
//		throw new RuntimeException();
	}
	
	public Map<String, ?> cancelKakaoPay(String order_no) {
		return mybatis.selectOne("getKakaoPayInfo", order_no);
	}
}
