package com.shepe.admin.faq;

import java.util.List;

public interface FaqService {

	// CRUD
	void insertFaq(FaqVO vo);
	
	void updateFaq(FaqVO vo);
	
	void deleteFaq(FaqVO vo);
	
	// 글 상세
	FaqVO detailFaq(FaqVO vo);
	
	// 글 List 조회
	List<FaqVO> getFaqList(int pager);
	
	// Paging 네이밍되나
	int getListCount();
	
	List<FaqVO> getAjaxFaqList(String choice);
	
}
