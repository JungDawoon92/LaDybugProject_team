package com.shepe.client.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shepe.client.recipe.RecipeService;
import com.shepe.client.recipe.RecipeVO;

@Controller
public class RecipeClientController {
	
	@Autowired
	private RecipeService recipeService;
	
	// 임시 로그인 폼
	@RequestMapping(value="/login.re", method=RequestMethod.GET)
	public String loginForm() {
		
		return "loginForm";
	}
	
	// 임시 로그인 세션
	@RequestMapping(value="/login.re", method=RequestMethod.POST)
	public String login(RecipeVO vo, HttpSession session) {
	
		session.setAttribute("member_id", vo.getMember_id());
		session.setAttribute("nickname", vo.getMember_nickname());
		return "index";
	}
		
	// 레시피 리스트
	@RequestMapping("/recipeList.re")
	public String getRecipeList(RecipeVO vo, Model model) {
		model.addAttribute("recipeList", recipeService.getRecipeList(vo));
		return "client/recipe/recipeList";
	}
	
	// 레시피 등록 폼
	@RequestMapping(value="/recipeInsert.re", method=RequestMethod.GET)
	public String getInsertRecipe(RecipeVO vo) throws IOException {
		
		return "client/recipe/insertRecipe";
	}
		
	// 레시피 상세 조회
	@RequestMapping("/getRecipe.re")
	public String getRecipe(RecipeVO vo, Model model) throws IllegalStateException, IOException {
		
		// 카운트 증가
		recipeService.recipeCntUpdate(vo);
		
		// 기본 정보
		model.addAttribute("recipe", recipeService.getRecipe(vo));	
		
		model.addAttribute("member_id", recipeService.getRecipe(vo).getMember_id());
		
		// 식재료 리스트
		List<RecipeVO> ingredient = recipeService.getRecipeIngreList(vo);
		model.addAttribute("recipeIngreList", ingredient); 
		
		// 과정 리스트
		model.addAttribute("recipeProcessList", recipeService.getRecipeProcessList(vo));
		
		// 식재료 리스트를 쇼핑리스트에서 셀렉트
		List<RecipeVO> ingredientList =  new ArrayList<RecipeVO>(); // 데이터 담을 list 객체 생성
		for (int i = 0; i < ingredient.size(); i++) {
			RecipeVO ingredientPut =  ingredient.get(i); // select 할 대상 추출(식재료 이름)
			RecipeVO ingredientSelect = recipeService.getShopingIngreList(ingredientPut); // 식재료 이름넣고 정보 가져오기 
			if(ingredientSelect != null) {
				ingredientList.add(ingredientSelect);
			}
		}
		// 쇼핑 리스트
		model.addAttribute("shopingIngreList", ingredientList);
		
		return "client/recipe/recipeDetail";
	}
}
