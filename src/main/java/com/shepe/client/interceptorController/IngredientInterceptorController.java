package com.shepe.client.interceptorController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shepe.client.ingredient.IngredientVO;

@Controller
@RequestMapping(value="/ingredientInterceptor")
public class IngredientInterceptorController {
	
	@RequestMapping("/orderForm.do")
	public String orderForm(IngredientVO vo, Model model) {
		System.out.println("식재료 구매하기 진입");
		return "client/ingredient/orderForm";
	}
	
	@RequestMapping("/insertCart.do")
	public String insertCart(IngredientVO vo, Model model) {
		System.out.println("식재료 구매하기 진입");
		return "client/ingredient/insertCart";
	}
}
