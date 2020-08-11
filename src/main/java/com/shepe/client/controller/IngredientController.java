package com.shepe.client.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.shepe.client.ingredient.IngredientService;
import com.shepe.client.ingredient.IngredientVO;
import com.shepe.client.ingredient.MemberVO;

@Controller
@SessionAttributes("ingredient")
public class IngredientController {
	
	@Autowired
	private IngredientService ingredientService;
	
	@RequestMapping("/login.do")
	public String login(MemberVO vo, Model model) {
		System.out.println("로그인 접근!");
		try {
			if(vo.getId().equals("test") && vo.getPass().equals("test123")) {
				System.out.println("환영합니다.");
				
			}
			model.addAttribute("id", vo.getId());
			model.addAttribute("pass", vo.getPass());
			
		} catch (NumberFormatException e) {
			e.printStackTrace();
			System.out.println(e+"입니다");
		}
		return "client/ingredient/clientTest";
	}
	// 클라이언트 첫 리스트
	@RequestMapping("/clientList.do")
	public String clientList(IngredientVO vo, Model model) {
		try {
			System.out.println("클라이언트 리스트 컨트롤러 접근!");
			model.addAttribute("ingredient", ingredientService.clientList(vo));
			
		} catch (NumberFormatException e) {
			e.printStackTrace();
			System.out.println(e+"입니다");
		}
		return "redirect:/";
	}
	
	// 클라이언트 디테일 리스트
	@RequestMapping("/clientDetailList.do")
	public String clientDetailList(IngredientVO vo, Model model) {
		try {
			System.out.println("클라이언트 디테일 리스트 컨트롤러 접근!");
			model.addAttribute("ingredient", ingredientService.clientDetailList(vo));
			
		} catch (NumberFormatException e) {
			e.printStackTrace();
			System.out.println(e+"입니다");
		}
		return "client/ingredient/clientDetailList";
	}
	
	//클라이언트 디테일
	@RequestMapping("/clientDetail.do")
	public String clientDetail(IngredientVO vo, Model model) {
		try {
			System.out.println("클라이언트 디테일  컨트롤러 접근!");
			model.addAttribute("ingredient", ingredientService.clientDetail(vo));
			model.addAttribute("ingredientDetail", ingredientService.clientDetailDetails(vo));
			model.addAttribute("ingredientMulti", ingredientService.clientDetailMulti(vo));
			
		} catch (NumberFormatException e) {
			e.printStackTrace();
			System.out.println(e+"입니다");
		}
		return "client/ingredient/clientDetail";
	}
	
	// ajax로 식재료 수량 알려주기!!! 얘는 나중에 지워줘도 됨.
	@ResponseBody
	@RequestMapping("/ing_amtCheck.do")
	public IngredientVO ing_amtCheck(IngredientVO vo, Model model) {
		try {
			System.out.println("클라이언트 식재료양 AJAX 컨트롤러 접근!");
			System.out.println(vo.getIngredient_no());
			System.out.println(vo.getIngredient_amt());
		} catch (NumberFormatException e) {
			e.printStackTrace();
			System.out.println(e+"입니다");
		}	
		return ingredientService.ing_amtCheck(vo);
	} 
	
	@RequestMapping("/orderForm.do")
	public String orderForm(IngredientVO vo, Model model) {
		System.out.println("식재료 구매하기 진입");
		return "client/ingredient/orderForm";
	}
	
	@RequestMapping("/meatPage.do")
	public String meatPage(IngredientVO vo, Model model) {
		System.out.println("식재료 구매하기 진입");
		return "client/ingredient/meatPage";
	}
	

}
