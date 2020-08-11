package com.shepe.admin.comment.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shepe.admin.comment.RecipeAdminService;
import com.shepe.admin.comment.RecipeAdminVO;

@Service
public class RecipeAdminServiceImpl implements RecipeAdminService {

	@Autowired
	private RecipeAdminDaoMybatis RecipeDAO;

	@Override
	public RecipeAdminVO getRecipe(RecipeAdminVO recipevo) {
		return RecipeDAO.getRecipe(recipevo);
	}

	@Override
	public int getChefRecipeCnt(RecipeAdminVO recipevo) {
		return RecipeDAO.getChefRecipeCnt(recipevo);
	}

	@Override
	public List<RecipeAdminVO> getChefRecipeList(RecipeAdminVO recipevo) {
		return RecipeDAO.getChefRecipeList(recipevo);
	}

}
