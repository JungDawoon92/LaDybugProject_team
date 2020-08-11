package com.shepe.admin.biz.search.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shepe.admin.biz.search.SearchAdminVO;

@Repository
public class SearchAdminDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<SearchAdminVO> searchChart_total() {
		
		return mybatis.selectList("SearchDAO.searchChart_total");
		
	}
	
	public List<SearchAdminVO> searchChart_month() {
			
			return mybatis.selectList("SearchDAO.searchChart_month");
			
		}
	
	public List<SearchAdminVO> searchChart_day() {
		
		return mybatis.selectList("SearchDAO.searchChart_day");
		
	}
	
	public List<SearchAdminVO> search_week_searchAmount() {
		
		return mybatis.selectList("SearchDAO.search_week_searchAmount");
		
	}

}
