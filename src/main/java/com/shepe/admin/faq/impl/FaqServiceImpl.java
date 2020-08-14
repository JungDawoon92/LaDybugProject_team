package com.shepe.admin.faq.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shepe.admin.faq.FaqService;
import com.shepe.admin.faq.FaqVO;

// 구현부
@Service
public class FaqServiceImpl implements FaqService {
	
	@Autowired
	private FaqDAO faqDAO;
	
	@Override
	public void insertFaq(FaqVO vo) {
		faqDAO.insertFaq(vo);
	}
	
	@Override
	public void updateFaq(FaqVO vo) {
		faqDAO.updateFaq(vo);
	}
	
	@Override
	public void updateFaqRC(int faq_sq) {
		faqDAO.plusRC(faq_sq);
	}
	
	@Override
	public void deleteFaq(FaqVO vo) {
		faqDAO.deleteFaq(vo);
	}
	
	@Override
	public FaqVO detailFaq(FaqVO vo) {
		return faqDAO.detailFaq(vo);
	}
	
	@Override
	public List<FaqVO> getFaqList(int pager) {
		return faqDAO.getFaqList(pager);
	}
	
	public List<FaqVO> getFaqRC(){
		return faqDAO.getFaqRC();
		
	// Paging
	}
	public int getListCount() {
		return faqDAO.getListCount(); 
	}
	
	public List<FaqVO> getAjaxFaqList(String choice) {
		return faqDAO.getAjaxFaqList(choice);
	}
	
	public List<FaqVO> boot_totalchart() {
		return faqDAO.boot_totalchart();
	}
}
