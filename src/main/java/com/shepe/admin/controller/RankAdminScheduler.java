package com.shepe.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.shepe.admin.rank.RankLikeRankingAdminService;
import com.shepe.admin.rank.RankLikeRankingAdminVO;
import com.shepe.admin.rank.RankSellIngredientRankingAdminService;
import com.shepe.admin.rank.RankSellIngredientRankingAdminVO;
import com.shepe.admin.rank.RankSellRecipeRankingAdminService;
import com.shepe.admin.rank.RankSellRecipeRankingAdminVO;
import com.shepe.admin.rank.RankSubscribeRankingAdminService;
import com.shepe.admin.rank.RankSubscribeRankingAdminVO;

@Service
public class RankAdminScheduler {

	@Autowired
	private RankLikeRankingAdminService rankLikeRankingService;
	@Autowired
	private RankSubscribeRankingAdminService rankSubscribeRankingService;
	@Autowired
	private RankSellIngredientRankingAdminService rankSellIngredientRankingService;
	@Autowired
	private RankSellRecipeRankingAdminService rankSellRecipeRankingService;
	
	@Scheduled(cron="00 40 09 * * *")
	public void insertRankLikeRanking () {
		System.out.println("좋아요 insert 시작합니다.");
		
		RankLikeRankingAdminVO likeRankingvo = new RankLikeRankingAdminVO();
		
		rankLikeRankingService.insertRankLikeRanking(likeRankingvo);
		
		List<RankLikeRankingAdminVO> likeList = rankLikeRankingService.getLikeRankList(likeRankingvo);
		
		for(int i=0; i<likeList.size(); i++) {
			likeRankingvo.setRank_no(i + 1);
			likeRankingvo.setRecipe_no(likeList.get(i).getRecipe_no());
			likeList.set(i, likeRankingvo);
			rankLikeRankingService.updateRankLikeRanking(likeRankingvo);
		}
	}
	
	
	@Scheduled(cron="00 40 09 * * *")
	public void insertRankSubscribeRanking () {
		System.out.println("구독 insert 시작합니다.");
		
		RankSubscribeRankingAdminVO subRankingvo = new RankSubscribeRankingAdminVO();
		
		rankSubscribeRankingService.insertRankSubscribeRanking(subRankingvo);
		
		List<RankSubscribeRankingAdminVO> subList = rankSubscribeRankingService.getSubscribeRankList(subRankingvo);
		
		for(int i=0; i<subList.size(); i++) {
			subRankingvo.setRank_no(i +1);
			subRankingvo.setMember_id(subList.get(i).getMember_id());
			subList.set(i, subRankingvo);
			rankSubscribeRankingService.updateRankSubscribeRanking(subRankingvo);
		}
	}
	
	/* 식재료 인서트 */
	@Scheduled(cron="00 40 09 * * *")
	public void insertRankSellIngredientRanking () {
		System.out.println("식재료 insert 시작합니다.");
		
		RankSellIngredientRankingAdminVO ingreRankingvo = new RankSellIngredientRankingAdminVO();
		
		rankSellIngredientRankingService.insertRankSellIngredientRanking(ingreRankingvo);
		
		List<RankSellIngredientRankingAdminVO> ingreList = rankSellIngredientRankingService.getIngredientRankList(ingreRankingvo);
		
		for(int i=0; i<ingreList.size(); i++) {
			ingreRankingvo.setRank_no(i +1);
			ingreRankingvo.setIngredient_nm(ingreList.get(i).getIngredient_nm());
			ingreList.set(i, ingreRankingvo);
			rankSellIngredientRankingService.updateRankSellIngredientRanking(ingreRankingvo);
		}
	}
	
	
	/* 레시피 리스트 인서트 */
	@Scheduled(cron="00 40 09 * * *")
	public void insertRankSellRecipeRanking () {
		System.out.println("레시피 insert 시작합니다.");
		
		RankSellRecipeRankingAdminVO recipeRankingvo = new RankSellRecipeRankingAdminVO();
		
		rankSellRecipeRankingService.insertRankSellRecipeRanking(recipeRankingvo);
		
		List<RankSellRecipeRankingAdminVO> recipeList = rankSellRecipeRankingService.getRecipeRankList(recipeRankingvo);
		
		for(int i=0; i<recipeList.size(); i++) {
			recipeRankingvo.setRank_no(i +1);
			recipeRankingvo.setRecipe_nm(recipeList.get(i).getRecipe_nm());
			recipeList.set(i, recipeRankingvo);
			rankSellRecipeRankingService.updateRankSellRecipeRanking(recipeRankingvo);
		}
	}
}
