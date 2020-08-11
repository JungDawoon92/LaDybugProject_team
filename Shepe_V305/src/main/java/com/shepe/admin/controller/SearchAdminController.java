package com.shepe.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.shepe.admin.biz.search.SearchAdminService;
import com.shepe.admin.biz.search.SearchAdminVO;

@Controller
public class SearchAdminController {
	
	@Autowired
	private SearchAdminService searchAdminService;
	
	@RequestMapping("/admin/searchChart")
	public String searchChart() {
		
		return "/admin/search/admin_search";
	}
	
	@ResponseBody
	@RequestMapping(value="/admin/search_total", produces = "application/text; charset=utf8")
	public String search_total() {
		Gson searchChartGson = new Gson();
		List<SearchAdminVO> searchChart = searchAdminService.searchChart_total();
		
		return searchChartGson.toJson(searchChart);
	}
	
	@ResponseBody
	@RequestMapping(value="/admin/search_month", produces = "application/text; charset=utf8")
	public String search_month() {
		Gson searchChartGson = new Gson();
		List<SearchAdminVO> searchChart = searchAdminService.searchChart_month();
		
		return searchChartGson.toJson(searchChart);
	}
	
	
	@ResponseBody
	@RequestMapping(value="/admin/search_day", produces = "application/text; charset=utf8")
	public String search_day() {
		Gson searchChartGson = new Gson();
		List<SearchAdminVO> searchChart = searchAdminService.searchChart_day();
		
		return searchChartGson.toJson(searchChart);
	}
	
	@ResponseBody
	@RequestMapping(value="/admin/search_week_searchAmount", produces = "application/text; charset=utf8")
	public String search_week_searchAmount() {
		Gson searchChartGson = new Gson();
		List<SearchAdminVO> searchChart = searchAdminService.search_week_searchAmount();
		
		return searchChartGson.toJson(searchChart);
	}
	
	
}
