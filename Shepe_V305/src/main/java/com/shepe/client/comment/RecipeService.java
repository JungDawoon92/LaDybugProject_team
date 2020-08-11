package com.shepe.client.comment;

import java.util.List;

public interface RecipeService {

	RecipeVO getRecipe(RecipeVO recipevo);
	
	int getChefRecipeCnt (RecipeVO recipevo);
	
	List<RecipeVO> getChefRecipeList(RecipeVO recipevo);
	
}
