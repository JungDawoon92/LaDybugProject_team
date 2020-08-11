package com.shepe.client.recipe;

import java.util.List;

import com.shepe.admin.recipe.RecipeListVO;

public interface RecipeService {

	void recipeInsert(RecipeVO vo);

	List<RecipeVO> getRecipeList(RecipeVO vo);

	RecipeVO getRecipe(RecipeVO vo);

	void processInsert(RecipeVO vo);

	void recipeIngreInsert(RecipeVO vo);
	
	List<RecipeVO> getRecipeIngreList(RecipeVO vo);

	List<RecipeVO> getRecipeProcessList(RecipeVO vo);

	void recipeCntUpdate(RecipeVO vo);

	void recipeUpdateImg(RecipeVO vo);

	void recipeUpdate(RecipeVO vo);

	void processUpdateImg(RecipeVO vo);

	void processUpdate(RecipeVO vo);

	void recipeIngreUpdate(RecipeVO vo);

	RecipeVO getShopingIngreList(RecipeVO vo);

	void basketInsert(RecipeVO vo);

	int listCount(RecipeListVO vo);

	List<RecipeVO> getAdminRecipeList(RecipeListVO vo);

	void recipeDelete(RecipeVO vo);

	List<RecipeVO> getRecipeChart(RecipeVO vo);

	List<RecipeVO> getRecipeChartIng(RecipeVO vo);

	List<RecipeVO> getRecipeChartHow(RecipeVO vo);

}
