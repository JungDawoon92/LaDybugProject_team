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
	
	public NoticeVO detailNotice(NoticeVO vo) {
		System.out.println("NoticeDAO detail" + vo);
		return (NoticeVO) mybatis.selectOne("NoticeDAO.detailNotice", vo);
	}
	
	// Paging	
	public List<NoticeVO> getNoticeList(int page) {
		System.out.println("NoticeDAO List " + page);
		int startpage = (page-1) * 10;
		return mybatis.selectList("NoticeDAO.getNoticeList", startpage);
	}
	
	// Paging
	public int getListCount() {
		return mybatis.selectOne("NoticeDAO.getListCount");
	}
}