package com.shepe.admin.notice.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shepe.admin.notice.NoticeVO;

@Repository
public class NoticeDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertNotice(NoticeVO vo) {
		System.out.println("NoticeDAO insert");
		mybatis.insert("NoticeDAO.insertNotice", vo);
	}
	
	public void updateNotice(NoticeVO vo) {
		System.out.println("NoticeDAO update");
		mybatis.update("NoticeDAO.updateNotice", vo);
	}
	
	public void deleteNotice(NoticeVO vo) {
		System.out.println("NoticeDAO delete");
		mybatis.delete("NoticeDAO.deleteNotice", vo);
	}
	
	public NoticeVO detailNotice(int notice_sq) {
		System.out.println("NoticeDAO detail");
		return mybatis.selectOne("NoticeDAO.detailNotice", notice_sq);
	}
	
	public void plusRC(int notice_sq) {
		mybatis.update("NoticeDAO.plusRC", notice_sq);
	}
	
	// Paging	
	public List<NoticeVO> getNoticeList(int page) {
		System.out.println("NoticeDAO List " + page);
		int startpage = (page-1) * 10;
		return mybatis.selectList("NoticeDAO.getNoticeList", startpage);
	}
	
	// Paging	
	public List<NoticeVO> getNoticeListScroll(int page) {
		System.out.println("NoticeDAO List " + page);
		return mybatis.selectList("NoticeDAO.getNoticeListScroll", page);
	}
	
	// Paging
	public int getListCount() {
		return mybatis.selectOne("NoticeDAO.getListCount");
	}

	
}