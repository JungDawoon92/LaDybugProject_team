package com.shepe.admin.qna;

import java.util.List;

public interface QnaService {

	// CRUD
	void insertQna(QnaVO vo);
	
	void updateQna(QnaVO vo);
	
	void deleteQna(QnaVO vo);
	
	// 글 상세
	QnaVO detailQna(QnaVO vo);
	
	// 글 List 조회
	List<QnaVO> getQnaList(int pager);
	
	// Paging
	int getListCount();
}
