package com.shepe.client.comment.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shepe.client.comment.RecipeService;
import com.shepe.client.comment.RecipeVO;

@Service
public class RecipeServiceImpl implements RecipeService {

	@Autowired
	private RecipeDaoMybatis RecipeDAO;

	@Override
	public RecipeVO getRecipe(RecipeVO recipevo) {
		return RecipeDAO.getRecipe(recipevo);
	}

	@Override
	public int getChefRecipeCnt(RecipeVO recipevo) {
		return RecipeDAO.getChefRecipeCnt(recipevo);
	}

	@Override
	public List<RecipeVO> getChefRecipeList(RecipeVO recipevo) {
		return RecipeDAO.getChefRecipeList(recipevo);
	}

}
