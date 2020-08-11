package com.shepe.client.biz.division;

import java.util.List;

public interface SearchService {
	
	int getsearch_reCount(String searchValue);
	int getsearch_inCount(String searchValue);
	List<DivisionVO> getsearch_reListList(int page, String searchValue);
	List<DivisionInVO> getsearch_inListList(int page, String searchValue);
	void search_add(String searchValue);
	List<SearchVO> searchInputAction(String search_value);
}
