package com.shepe.admin.qna.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shepe.admin.qna.QnaService;
import com.shepe.admin.qna.QnaVO;

// 구현부
@Service
public class QnaServiceImpl implements QnaService {
	
	@Autowired
	private QnaDAO qnaDAO;
	
	@Override
	public void insertQna(QnaVO vo) {
		qnaDAO.insertQna(vo);
	}
	
	@Override
	public void updateQna(QnaVO vo) {
		qnaDAO.updateQna(vo);
	}
	
	@Override
	public void deleteQna(QnaVO vo) {
		qnaDAO.deleteQna(vo);
	}
	
	@Override
	public QnaVO detailQna(QnaVO vo) {
		return qnaDAO.detailQna(vo);
	}
	
	@Override
	public List<QnaVO> getQnaList(int pager) {
		return qnaDAO.getQnaList(pager);
	}
	
	// Paging
	public int getListCount() {
		return qnaDAO.getListCount(); 
	}
}
