package com.shepe.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.shepe.admin.ingredient.IngredientAdminService;
import com.shepe.client.ingredient.IngredientVO;

@Controller
@SessionAttributes("ingredientAdmin")
public class IngredientAdminChartController {

	@Autowired
	private IngredientAdminService ingredientAdminService;	
	
	@RequestMapping(value="/admin/ingredientChart.co")
	public String ingredientChart(IngredientVO vo, Model model) {
		return "admin/ingredient/adminIngredientChart";
	}
	
	@ResponseBody
	@RequestMapping(value="/admin/adminIngredientChart.co")
	public List<IngredientVO> adminIngredientChart(IngredientVO vo, Model model) {
		return ingredientAdminService.adminIngredientChart(vo);
	}
	
	@ResponseBody
	@RequestMapping(value="/admin/adminIngredientAvgChart.co")
	public List<IngredientVO> adminIngredientAvgChart(IngredientVO vo, Model model) {
		System.out.println("평균가격 ajax 진입");
//		List<IngredientVO> test = null;
//		test.addAll(ingredientAdminService.adminIngredientAvgChart(vo));
//		System.out.println(test.get(0).);
		return ingredientAdminService.adminIngredientAvgChart(vo);
	}
	
}
