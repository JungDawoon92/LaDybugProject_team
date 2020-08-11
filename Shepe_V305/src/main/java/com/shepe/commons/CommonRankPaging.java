package com.shepe.commons;

import org.springframework.stereotype.Service;

@Service
public class CommonRankPaging {
	private int PAGE_PER_PAGE = 10; // 화면당 페이지 출력 갯수
	private int ROW_PER_PAGE = 10; // 페이지당 레코드 출력 갯수
	
	public void setROW_PER_PAGE(int rOW_PER_PAGE) {
		ROW_PER_PAGE = rOW_PER_PAGE;
	}
	public int getROW_PER_PAGE() {
		return ROW_PER_PAGE;
	}


	public PagingVO paging(int expage, int exlistcount, PagingVO po) {
		
		int page = expage; //현재 페이지
		int listCount = exlistcount;
		
		int maxPage = (int) Math.ceil((double) listCount / ROW_PER_PAGE); // 전체 페이지 갯수
		int totalRanges = (int) Math.ceil((double) maxPage / PAGE_PER_PAGE); // 전체 Range 갯수
		int currentRange = (int) Math.ceil((double) page / PAGE_PER_PAGE); // 요청된 pageNo의 현재 range
		int beginPage = (currentRange - 1) * PAGE_PER_PAGE + 1; // 시작 페이지 번호
		int endPage = currentRange * PAGE_PER_PAGE; // 마지막 페이지 번호
		if (currentRange == totalRanges)
			endPage = maxPage; // currentRange가 맨 마지막 range인 경우
		int prevPage = 0;
		if (currentRange != 1)
			prevPage = (currentRange - 2) * PAGE_PER_PAGE + 1;
		int nextPage = 0;
		if (currentRange != totalRanges)
			nextPage = currentRange * PAGE_PER_PAGE + 1;
		
		
		po.setPage(page);
		po.setListcount(listCount);
		po.setMaxpage(maxPage);
		po.setStartpage(beginPage);
		po.setEndpage(endPage);
		po.setPrevpage(prevPage);
		po.setNextpage(nextPage);
			
		return po;
	}
}
