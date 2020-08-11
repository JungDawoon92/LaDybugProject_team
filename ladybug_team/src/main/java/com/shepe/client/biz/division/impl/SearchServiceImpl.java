package com.shepe.client.biz.division.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shepe.client.biz.division.DivisionInVO;
import com.shepe.client.biz.division.DivisionVO;
import com.shepe.client.biz.division.SearchService;
import com.shepe.client.biz.division.SearchVO;

@Service("searchService")
public class SearchServiceImpl implements SearchService {
	
	@Autowired
	private SearchDAO searchDAO;
	
	public int getsearch_reCount(String searchValue) {
		return searchDAO.getsearch_reCount(searchValue);
	}
	
	public int getsearch_inCount(String searchValue) {
		return searchDAO.getsearch_inCount(searchValue);
	}
	
	public List<DivisionVO> getsearch_reListList(int page, String searchValue) {
		return searchDAO.getsearch_reListList(page, searchValue);
	}
	
	public List<DivisionInVO> getsearch_inListList(int page, String searchValue) {
		return searchDAO.getsearch_inListList(page, searchValue);
	}
	
	public void search_add(String searchValue) {
		searchDAO.search_add(searchValue);
	}
	
	public List<SearchVO> searchInputAction(String search_value) {
		return searchDAO.searchInputAction(search_value);
	}

}
