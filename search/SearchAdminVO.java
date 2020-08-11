package com.shepe.admin.biz.search;

import java.sql.Date;

public class SearchAdminVO {
	
	private String search_data;
	private Date search_date;
	private int search_data_cnt;
	
	public String getSearch_data() {
		return search_data;
	}
	public void setSearch_data(String search_data) {
		this.search_data = search_data;
	}
	public Date getSearch_date() {
		return search_date;
	}
	public void setSearch_date(Date search_date) {
		this.search_date = search_date;
	}
	public int getSearch_data_cnt() {
		return search_data_cnt;
	}
	public void setSearch_data_cnt(int search_data_cnt) {
		this.search_data_cnt = search_data_cnt;
	}
	
}
