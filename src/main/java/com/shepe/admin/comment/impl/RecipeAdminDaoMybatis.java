package com.shepe.admin.comment.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shepe.admin.comment.RecipeAdminVO;

@Repository
public class RecipeAdminDaoMybatis {

	@Autowired
	private SqlSessionTemplate recipe;
	
	public RecipeAdminVO getRecipe(RecipeAdminVO recipevo) {
		return recipe.selectOne("adRecipeTestDAO.getRecipe", recipevo);
	}
	
	public int getChefRecipeCnt (RecipeAdminVO recipevo) {
		return recipe.selectOne("adRecipeTestDAO.getChefRecipeCnt", recipevo);
	}
	
	public List<RecipeAdminVO> getChefRecipeList (RecipeAdminVO recipevo) {
		return recipe.selectList("adRecipeTestDAO.getChefRecipeList", recipevo);
	}
}
