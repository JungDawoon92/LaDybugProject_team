package com.shepe.client.biz.division.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shepe.client.biz.division.DivisionInVO;
import com.shepe.client.biz.division.DivisionService;
import com.shepe.client.biz.division.DivisionVO;


@Service("divisionService")
public class DivisionServiceImpl implements DivisionService {
	
	@Autowired
	private DivisionDAO divisionDAO;
	
	public List<DivisionVO> getDivisionList(int page) {
		return divisionDAO.getDivisionList(page);
	}
	
	public int getDivisionCount() {
		return divisionDAO.getDivisionCount();
	}
	
	public List<DivisionVO> getAjaxList(int page, String sum) {
		return divisionDAO.getAjaxList(page, sum);
	}
	
	public int getAjaxCount(String sum) {
		return divisionDAO.getAjaxCount(sum);
	}
	
	public int getDivisionInCount() {
		return divisionDAO.getDivisionInCount();
	}
	
	public List<DivisionInVO> getDivisionInList(int page) {
		return divisionDAO.getDivisionInList(page);
	}
	
	public List<DivisionInVO> getAjaxingrelist(int page, String choice) {
		return divisionDAO.getAjaxingrelist(page, choice);
	}
	
	public int getAjaxinCount(String choice) {
		return divisionDAO.getAjaxinCount(choice);
	}
	
}
