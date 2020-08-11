package com.shepe.client.biz.division;

import java.util.List;

public interface DivisionService {
	
	List<DivisionVO> getDivisionList(int page);
	int getDivisionCount();
	List<DivisionVO> getAjaxList(int page, String sum);
	int getAjaxCount(String sum);
	int getDivisionInCount();
	List<DivisionInVO> getDivisionInList(int page);
	List<DivisionInVO> getAjaxingrelist(int page, String choice);
	int getAjaxinCount(String choice);
	
}
