package com.shepe.client.comment.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shepe.client.comment.RecipeVO;

@Repository
public class RecipeDaoMybatis {

	@Autowired
	private SqlSessionTemplate recipe;
	
	public RecipeVO getRecipe(RecipeVO recipevo) {
		return recipe.selectOne("RecipeTestDAO.getRecipe", recipevo);
	}
	
	public int getChefRecipeCnt (RecipeVO recipevo) {
		return recipe.selectOne("RecipeTestDAO.getChefRecipeCnt", recipevo);
	}
	
	public List<RecipeVO> getChefRecipeList (RecipeVO recipevo) {
		return recipe.selectList("RecipeTestDAO.getChefRecipeList", recipevo);
	}
}
