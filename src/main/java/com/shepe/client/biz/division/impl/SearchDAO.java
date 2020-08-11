package com.shepe.client.biz.division.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shepe.client.biz.division.DivisionInVO;
import com.shepe.client.biz.division.DivisionVO;
import com.shepe.client.biz.division.SearchVO;

@Repository
public class SearchDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int getsearch_reCount(String searchValue) {
		System.out.println(searchValue);
		return mybatis.selectOne("SearchDAO.getsearch_reCount", searchValue);
	}
	
	public int getsearch_inCount(String searchValue) {
		System.out.println(searchValue);
		return mybatis.selectOne("SearchDAO.getsearch_inCount", searchValue);
	}
	
	public List<DivisionVO> getsearch_reListList(int page, String searchValue) {
		int startpage = (page - 1) * 2;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startpage", startpage);
		map.put("searchValue", searchValue);
		return mybatis.selectList("SearchDAO.getsearch_reListList", map);
	}
	
	public List<DivisionInVO> getsearch_inListList(int page, String searchValue) {
		int startpage = (page - 1) * 5;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startpage", startpage);
		map.put("searchValue", searchValue);
		return mybatis.selectList("SearchDAO.getsearch_inListList", map);
	}
	
	public void search_add(String searchValue) {
		
		int cnt = mybatis.selectOne("SearchDAO.search_select", searchValue);
		
		if(cnt != -1) {
			//업데이트 
			mybatis.update("SearchDAO.search_cnt_update", searchValue);
		} else {
			mybatis.insert("SearchDAO.search_add", searchValue);
		}
	}
	
	public List<SearchVO> searchInputAction(String search_value) {
		return mybatis.selectList("SearchDAO.searchInputAction", search_value);
	}
}
