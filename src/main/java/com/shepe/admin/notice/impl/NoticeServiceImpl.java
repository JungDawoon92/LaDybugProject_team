package com.shepe.admin.notice.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shepe.admin.notice.NoticeService;
import com.shepe.admin.notice.NoticeVO;

// 구현부
@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDAO noticeDAO;
	
	@Override
	public void insertNotice(NoticeVO vo) {
		noticeDAO.insertNotice(vo);
	}
	
	@Override
	public void updateNotice(NoticeVO vo) {
		noticeDAO.updateNotice(vo);
	}
	
	@Override
	public void deleteNotice(NoticeVO vo) {
		noticeDAO.deleteNotice(vo);
	}
	
	@Override
	public NoticeVO detailNotice(NoticeVO vo) {
		return noticeDAO.detailNotice(vo);
	}
	
	@Override
	public List<NoticeVO> getNoticeList(int pager) {
		return noticeDAO.getNoticeList(pager);
	}
	
	// Paging
	public int getListCount() {
		return noticeDAO.getListCount(); 
	}
}
