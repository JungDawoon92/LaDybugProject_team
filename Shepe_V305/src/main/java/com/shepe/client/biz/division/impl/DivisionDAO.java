package com.shepe.client.biz.division.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shepe.client.biz.division.DivisionInVO;
import com.shepe.client.biz.division.DivisionVO;
import com.shepe.client.biz.division.common.divInVO;
import com.shepe.client.biz.division.common.divVO;


@Repository
public class DivisionDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Autowired
	private divVO divvo;
	
	@Autowired
	private divInVO divinvo;
	
	public List<DivisionVO> getDivisionList(int page) {
		int startpage = (page - 1) * 8;
		return mybatis.selectList("DivisionDAO.getDivisionList", startpage);
	}
	
	public List<DivisionInVO> getDivisionInList(int page) {
		int startpage = (page - 1) * 8;
		return mybatis.selectList("DivisionDAO.getDivisionInList", startpage);
	}
	
	public int getDivisionCount() {
		return mybatis.selectOne("DivisionDAO.getDivisionCount");
	}
	
	public List<DivisionVO> getAjaxList(int page, String sum) {
		int startpage = (page - 1) * 8;
		
		String kind = "";
		String ing = "";
		String how = "";
		String[] array = sum.split(",");

		kind = divvo.divmatter(array[0]);
		ing = divvo.divmatter(array[1]);
		how = divvo.divmatter(array[2]);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("kind", kind);
		map.put("ing", ing);
		map.put("how", how);
		map.put("startpage", startpage);

		return mybatis.selectList("DivisionDAO.getAjaxList", map);
	}
	
	public int getAjaxCount(String sum) {
		
		String kind = "";
		String ing = "";
		String how = "";
		String[] array = sum.split(",");

		kind = divvo.divmatter(array[0]);
		ing = divvo.divmatter(array[1]);
		how = divvo.divmatter(array[2]);
		System.out.println(kind);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("kind", kind);
		map.put("ing", ing);
		map.put("how", how);
		
		return mybatis.selectOne("DivisionDAO.getAjaxCount", map);
	}
	
	
	public int getDivisionInCount() {
		return mybatis.selectOne("DivisionDAO.getDivisionInCount");
	}
	
	public List<DivisionInVO> getAjaxingrelist(int page, String choice) {
		int startpage = (page - 1) * 8;
		
		String categ = divinvo.divInmatter(choice);
		
		if(categ.equals("")) {
			startpage = (page - 1) * 8;
			return mybatis.selectList("DivisionDAO.getDivisionInList", startpage);
			
		} else {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("ingredient_categ", categ);
			map.put("startpage", startpage);
			return mybatis.selectList("DivisionDAO.getAjaxingrelist", map);	
		}
	}
	
	public int getAjaxinCount(String choice) {
		
		String categ = "";
		categ = divinvo.divInmatter(choice);
		
		if(categ.equals("")) {
			return mybatis.selectOne("DivisionDAO.getDivisionInCount");
			
		} else {

			return mybatis.selectOne("DivisionDAO.getAjaxinCount", categ);
		}
	}
}
