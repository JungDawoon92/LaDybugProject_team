package com.shepe.admin.biz.search;

import java.util.List;

public interface SearchAdminService {
	
	List<SearchAdminVO> searchChart_total();
	
	List<SearchAdminVO> searchChart_month();
	
	List<SearchAdminVO> searchChart_day();
	
	List<SearchAdminVO> search_week_searchAmount();
	
}
