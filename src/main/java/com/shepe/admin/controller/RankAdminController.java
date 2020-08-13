package com.shepe.admin.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shepe.admin.rank.RankLikeAdminService;
import com.shepe.admin.rank.RankLikeAdminVO;
import com.shepe.admin.rank.RankSubscribeAdminService;
import com.shepe.admin.rank.RankSubscribeAdminVO;

@Controller
public class RankAdminController {

	@Autowired
	private RankLikeAdminService rankLikeService;
	@Autowired
	private RankSubscribeAdminService rankSubscribeService;
	
	
	/* 레시피 추천인 관련 */
	@ResponseBody
	@RequestMapping(value="/admin/insertRankLikeAjax.rk.ad")
	public void insertRankLike (RankLikeAdminVO likevo, Model model) {
		System.out.println("어드민 타는지 테스트중 좋아요 인서트");
		rankLikeService.insertRankLike(likevo);
	}
	
	/* 쉐프 구독자 관련 */
	@ResponseBody
	@RequestMapping(value="/admin/insertRankSubscribeAjax.rk.ad")
	public void insertRankSubscribe (RankSubscribeAdminVO subvo, Model model) {
		System.out.println("어드민 타는지 테스트중 구독 인서트");
		rankSubscribeService.insertRankSubscribe(subvo);
	}
}
