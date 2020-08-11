package com.shepe.admin.board.common;

import org.springframework.stereotype.Service;

@Service
public class ListPaging {
	public PagingVO paging(int repage, int relistcount, PagingVO po) {

		int limit = 5;
		int page = repage; // 현재 페이지
		int listcount = relistcount; // 리스트 총 숫자
		int maxpage = (int) Math.ceil((double) listcount / 10);
		int currentRange = (int) Math.ceil((double) page / limit);
		int totalRanges = (int) Math.ceil((double) maxpage / limit);
		int startpage = (currentRange - 1) * limit + 1;
		int endpage = currentRange * limit;
		if (currentRange == totalRanges)
			endpage = maxpage;
		int prevpage = 0;
		if (currentRange != 1)
			prevpage = (currentRange - 2) * limit + 1;
		int nextpage = 0;
		if (currentRange != (int) Math.ceil((double) maxpage / limit))
			nextpage = currentRange * limit + 1;

		po.setPage(page);
		po.setListcount(listcount);
		po.setMaxpage(maxpage);
		po.setStartpage(startpage);
		po.setEndpage(endpage);
		po.setPrevpage(prevpage);
		po.setNextpage(nextpage);

		return po;
	}
}
