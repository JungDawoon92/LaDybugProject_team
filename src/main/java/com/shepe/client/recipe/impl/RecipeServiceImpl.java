package com.shepe.client.recipe.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shepe.admin.recipe.RecipeListVO;
import com.shepe.client.recipe.RecipeService;
import com.shepe.client.recipe.RecipeVO;

@Service("recipeService")
public class RecipeServiceImpl implements RecipeService{
	@Autowired
	private RecipeDAO recipeDAO;
	
	public void recipeInsert(RecipeVO vo) {

		recipeDAO.recipeInsert(vo);
	}
	
	public List<RecipeVO> getRecipeList(RecipeVO vo) {
		
		return recipeDAO.getRecipeList(vo);
	}

	public RecipeVO getRecipe(RecipeVO vo) {
		
		return recipeDAO.getRecipe(vo);
	}

	public void processInsert(RecipeVO vo) {
		
		recipeDAO.processInsert(vo);
	}

	public void recipeIngreInsert(RecipeVO vo) {
		
		recipeDAO.recipeIngreInsert(vo);
	}

	public List<RecipeVO> getRecipeIngreList(RecipeVO vo) {
		
		return recipeDAO.getRecipeIngreList(vo);
	}

	public List<RecipeVO> getRecipeProcessList(RecipeVO vo) {

		return recipeDAO.getRecipeProcessList(vo);
	}

	public void recipeCntUpdate(RecipeVO vo) {
		
		recipeDAO.recipeCntUpdate(vo);
	}

	public void recipeUpdateImg(RecipeVO vo) {
		
		recipeDAO.recipeUpdateImg(vo);
	}
	
	public void recipeUpdate(RecipeVO vo) {
		
		recipeDAO.recipeUpdate(vo);
	}

	public void processUpdateImg(RecipeVO vo) {
		
		recipeDAO.processUpdateImg(vo);
	}

	public void processUpdate(RecipeVO vo) {
		
		recipeDAO.processUpdate(vo);
	}

	public void recipeIngreUpdate(RecipeVO vo) {
		
		recipeDAO.recipeIngreUpdate(vo);
	}
	
	public RecipeVO getShopingIngreList(RecipeVO vo) {

		return recipeDAO.getShopingIngreList(vo);
	}

	public void basketInsert(RecipeVO vo) {

		recipeDAO.basketInsert(vo);
	}

	public int listCount(RecipeListVO vo) {

		return recipeDAO.listCount(vo);
	}

	public List<RecipeVO> getAdminRecipeList(RecipeListVO vo) {

		return recipeDAO.getAdminRecipeList(vo);
	}

	public void recipeDelete(RecipeVO vo) {
		
		recipeDAO.recipeDelete(vo);
	}

	public List<RecipeVO> getRecipeChart(RecipeVO vo) {
		
		return recipeDAO.getRecipeChart(vo);
	}

	public List<RecipeVO> getRecipeChartIng(RecipeVO vo) {
		
		return recipeDAO.getRecipeChartIng(vo);
	}

	public List<RecipeVO> getRecipeChartHow(RecipeVO vo) {
		
		return recipeDAO.getRecipeChartHow(vo);
	}
	
	/* rank 추가부분 */
	@Override
	public int getChefRecipeCnt(RecipeVO recipevo) {
		return recipeDAO.getChefRecipeCnt(recipevo);
	}

	@Override
	public List<RecipeVO> getChefRecipeList(RecipeVO recipevo) {
		return recipeDAO.getChefRecipeList(recipevo);
	}
}
