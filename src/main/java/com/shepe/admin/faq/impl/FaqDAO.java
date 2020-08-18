package com.shepe.admin.faq.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shepe.admin.faq.FaqVO;

@Repository
public class FaqDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertFaq(FaqVO vo) {
		System.out.println("FaqDAO insert");
		mybatis.insert("FaqDAO.insertFaq", vo);
	}
	
	public void updateFaq(FaqVO vo) {
		System.out.println("FaqDAO update");
		mybatis.update("FaqDAO.updateFaq", vo);
	}
	
	public void plusRC(int faq_sq) {
		mybatis.update("FaqDAO.plusRC", faq_sq);
	}
	
	public void deleteFaq(FaqVO vo) {
		System.out.println("FaqDAO delete");
		mybatis.delete("FaqDAO.deleteFaq", vo);
	}
	
	public FaqVO detailFaq(FaqVO vo) {
		System.out.println("FaqDAO detail");
		return (FaqVO) mybatis.selectOne("FaqDAO.detailFaq", vo);
	}
	
	// Paging	
	public List<FaqVO> getFaqList(int page) {
		System.out.println("FaqDAO List " + page);
		int startpage = (page-1) * 10;
		return mybatis.selectList("FaqDAO.getFaqList", startpage);
	}
	
	public List<FaqVO> getFaqRC() {
		System.out.println("FaqDAO RC");
		return mybatis.selectList("FaqDAO.getFaqTopRC");
	}
	
	// Paging
	public int getListCount() {
		return mybatis.selectOne("FaqDAO.getListCount");
	}
	
	public List<FaqVO> getAjaxFaqList(String choice) {
		
		choice = choice.substring(0,1);
		if(choice.equals("1")) {
			return mybatis.selectList("FaqDAO.getFaqList", 0);
		}
		if(choice.equals("2")) {
			choice  ="회원/로그인";
		} else if(choice.equals("3")) {
			choice  ="상품";
		} else if(choice.equals("4")) {
			choice  ="주문/결제";
		} else if(choice.equals("5")) {
			choice  ="배송/조회";
		} else if(choice.equals("6")) {
			choice  ="취소/환불";
		} else if(choice.equals("7")) {
			choice  ="교환/반품";
		} 
		System.out.println("FaqDAO clientAjaxList " + choice);
		return mybatis.selectList("FaqDAO.getAjaxFaqList", choice);
	}
	
	public List<FaqVO> boot_totalchart() {
		return mybatis.selectList("FaqDAO.boot_totalchart");
	}
	
}