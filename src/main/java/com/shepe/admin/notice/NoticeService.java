package com.shepe.admin.notice;

import java.util.List;

public interface NoticeService {

	// CRUD
	void insertNotice(NoticeVO vo);
	
	void updateNotice(NoticeVO vo);
	
	void deleteNotice(NoticeVO vo);
	
	// 글 상세
	NoticeVO detailNotice(NoticeVO vo);
	
	// 글 List 조회
	List<NoticeVO> getNoticeList(int pager);
	
	// Paging
	int getListCount();
}
