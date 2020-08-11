package com.shepe.admin.qna.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shepe.admin.qna.QnaVO;

@Repository
public class QnaDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertQna(QnaVO vo) {
		System.out.println("QnaDAO insert");
		mybatis.insert("QnaDAO.insertQna", vo);
	}
	
	public void updateQna(QnaVO vo) {
		System.out.println("QnaDAO update");
		mybatis.update("QnaDAO.updateQna", vo);
	}
	
	public void deleteQna(QnaVO vo) {
		System.out.println("QnaDAO delete");
		mybatis.delete("QnaDAO.deleteQna", vo);
	}
	
	public QnaVO detailQna(QnaVO vo) {
		System.out.println("QnaDAO detail");
		return (QnaVO) mybatis.selectOne("QnaDAO.detailQna", vo);
	}
	
	// Paging	
	public List<QnaVO> getQnaList(int page) {
		System.out.println("QnaDAO List " + page);
		int startpage = (page-1) * 10;
		return mybatis.selectList("QnaDAO.getQnaList", startpage);
	}
	
	// Paging
	public int getListCount() {
		return mybatis.selectOne("QnaDAO.getListCount");
	}
}