package com.shepe.client.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shepe.client.biz.division.SearchService;
import com.shepe.client.biz.division.SearchVO;
import com.shepe.client.common.PagingVO;
import com.shepe.client.common.PagingVO2;
import com.shepe.client.common.SearchPaging;
import com.shepe.client.common.SearchPaging2;

@Controller
public class SearchController {
	
	@Autowired
	private SearchPaging searchPaging;
	
	@Autowired
	private SearchPaging2 searchPaging2;
	
	@Autowired
	private SearchService searchService;
	
	@ResponseBody
	@RequestMapping("/searchInputAction")
	public List<SearchVO> searchInputAction(@RequestParam(value="search_value", required=false) String search_value) {
		System.out.println("요기타나?"+search_value);
		return searchService.searchInputAction(search_value);
	}
	
	@RequestMapping("/searchAction")
	public String searchAction(@RequestParam(value="searchValue", required=false) String searchValue, @RequestParam(value="page", required=false) String page, @RequestParam(value="pagevalue", required=false) String pagevalue, Model model, PagingVO po, PagingVO2 po2, HttpServletRequest request) {
		
		int pager = 1;
		HttpSession session = request.getSession();

		if(page != null) {
			
			pager = Integer.parseInt(page);
			
			if(pagevalue.equals("1")) {
				//re 페이징
				session.setAttribute("re-page", pager);
				System.out.println("여기타나?");
				System.out.println(pager);
				int re_listcount = searchService.getsearch_reCount(searchValue);
				int in_listcount = searchService.getsearch_inCount(searchValue);
				model.addAttribute("re_paging", searchPaging.searchpaging(pager, re_listcount, po, 2));
				model.addAttribute("re_listcount", re_listcount);
				model.addAttribute("search_reList", searchService.getsearch_reListList(pager, searchValue));
				model.addAttribute("searchValue", searchValue);
				
				pager = 1;
				
				model.addAttribute("in_paging", searchPaging2.searchpaging2(pager, in_listcount, po2, 5));
				model.addAttribute("in_listcount", in_listcount);
				model.addAttribute("search_inList", searchService.getsearch_inListList(pager, searchValue));
				return "/client/division/search/search";
			}
			
			if(pagevalue.equals("2")) {
				//le 페이징
				System.out.println("요기타쥬?");
				session.setAttribute("le-page", pager);
				int re_listcount = searchService.getsearch_reCount(searchValue);
				int in_listcount = searchService.getsearch_inCount(searchValue);
				model.addAttribute("in_paging", searchPaging2.searchpaging2(pager, in_listcount, po2, 5));
				model.addAttribute("in_listcount", in_listcount);
				model.addAttribute("search_inList", searchService.getsearch_inListList(pager, searchValue));
				model.addAttribute("searchValue", searchValue);
				pager = 1;
				model.addAttribute("re_paging", searchPaging.searchpaging(pager, re_listcount, po, 2));
				model.addAttribute("re_listcount", re_listcount);
				model.addAttribute("search_reList", searchService.getsearch_reListList(pager, searchValue));
				return "/client/division/search/search";
			}
		}
		
		//아무것도 안타고 검색 눌렀을때.
		
		int re_listcount = searchService.getsearch_reCount(searchValue);
		int in_listcount = searchService.getsearch_inCount(searchValue);
		
		searchService.search_add(searchValue);
		
		model.addAttribute("re_paging", searchPaging.searchpaging(pager, re_listcount, po, 2));
		model.addAttribute("in_paging", searchPaging2.searchpaging2(pager, in_listcount, po2, 5));
		
		model.addAttribute("re_listcount", re_listcount);
		model.addAttribute("in_listcount", in_listcount);
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("search_reList", searchService.getsearch_reListList(pager, searchValue));
		model.addAttribute("search_inList", searchService.getsearch_inListList(pager, searchValue));
		
		return "/client/division/search/search";
		
	}

}
