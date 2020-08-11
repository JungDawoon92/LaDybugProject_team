package com.shepe.admin.biz.search.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shepe.admin.biz.search.SearchAdminService;
import com.shepe.admin.biz.search.SearchAdminVO;

@Service
public class SearchAdminServiceImpl implements SearchAdminService {
	
	@Autowired
	private SearchAdminDAO searchAdminDAO;
	
	public List<SearchAdminVO> searchChart_total() {
		
		return searchAdminDAO.searchChart_total();
	}
	
	public List<SearchAdminVO> searchChart_month() {
			
			return searchAdminDAO.searchChart_month();
		}
	
	public List<SearchAdminVO> searchChart_day() {
		
		return searchAdminDAO.searchChart_day();
	}
	
	public List<SearchAdminVO> search_week_searchAmount() {
		
		return searchAdminDAO.search_week_searchAmount();
	}

}
