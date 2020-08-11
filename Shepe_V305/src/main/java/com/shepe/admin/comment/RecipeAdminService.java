package com.shepe.admin.comment;

import java.util.List;

public interface RecipeAdminService {

	RecipeAdminVO getRecipe(RecipeAdminVO recipevo);
	
	int getChefRecipeCnt (RecipeAdminVO recipevo);
	
	List<RecipeAdminVO> getChefRecipeList(RecipeAdminVO recipevo);
	
}
