package com.shepe.admin.notice;

import java.util.List;

public interface NoticeService {

	// CRUD
	void insertNotice(NoticeVO vo);
	
	void updateNotice(NoticeVO vo);
	
	// 조회수
	void updateNoticeRC(int notice_sq);
	
	void deleteNotice(NoticeVO vo);
	
	// 글 상세
	NoticeVO detailNotice(int notice_sq);
	
	// 글 List 조회
	List<NoticeVO> getNoticeList(int pager);
	
	// 글 List 스크롤조회
	List<NoticeVO> getNoticeListScroll(int pager);
	
	// Paging
	int getListCount();
}
