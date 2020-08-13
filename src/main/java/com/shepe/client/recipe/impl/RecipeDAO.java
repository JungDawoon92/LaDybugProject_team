package com.shepe.client.recipe.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shepe.admin.recipe.RecipeListVO;
import com.shepe.client.recipe.RecipeVO;

@Repository
public class RecipeDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void recipeInsert(RecipeVO vo) {
		System.out.println("===> Mybatis로 recipeInsert() 기능 처리");
		mybatis.insert("RecipeDAO.recipeInsert", vo);
	}
	

	public List<RecipeVO> getRecipeList(RecipeVO vo) {
		System.out.println("===> Mybatis로 getRecipeList() 기능 처리");
		return mybatis.selectList("RecipeDAO.getRecipeList", vo);
	}
	
	public RecipeVO getRecipe(RecipeVO vo) {
		System.out.println("===> Mybatis로 getRecipe() 기능 처리");
		
		return mybatis.selectOne("RecipeDAO.getRecipe", vo);
	}

	public void processInsert(RecipeVO vo) {
		System.out.println("===> Mybatis로 processInsert() 기능 처리");
		mybatis.insert("RecipeDAO.recipeProcessInsert", vo);
	}

	public void recipeIngreInsert(RecipeVO vo) {
		System.out.println("===> Mybatis로 recipeIngreInsert() 기능 처리");
		mybatis.insert("RecipeDAO.recipeIngreInsert", vo);
	}
	
	public List<RecipeVO> getRecipeIngreList(RecipeVO vo) {
		System.out.println("===> Mybatis로 getRecipeIngreList() 기능 처리");
		return mybatis.selectList("RecipeDAO.getRecipeIngreList", vo);
		
	}

	public List<RecipeVO> getRecipeProcessList(RecipeVO vo) {
		
		System.out.println("===> Mybatis로 getRecipeProcessList() 기능 처리");
		return mybatis.selectList("RecipeDAO.getRecipeProcessList", vo);
	}

	public void recipeCntUpdate(RecipeVO vo) {
		
		System.out.println("===> Mybatis로 recipeCntUpdate() 기능 처리");
		mybatis.update("RecipeDAO.recipeCntUpdate", vo);
	}

	public void recipeUpdateImg(RecipeVO vo) {
		
		System.out.println("===> Mybatis로 recipeUpdateImg() 기능 처리");
		mybatis.update("RecipeDAO.recipeUpdateImg", vo);
		
	}

	public void recipeUpdate(RecipeVO vo) {
		
		System.out.println("===> Mybatis로 recipeUpdate() 기능 처리");
		mybatis.update("RecipeDAO.recipeUpdate", vo);
		
	}

	public void processUpdateImg(RecipeVO vo) {
		
		System.out.println("===> Mybatis로 processUpdateImg() 기능 처리");
		mybatis.update("RecipeDAO.processUpdateImg", vo);
		
	}

	public void processUpdate(RecipeVO vo) {
		
		System.out.println("===> Mybatis로 processUpdate() 기능 처리");
		mybatis.update("RecipeDAO.processUpdate", vo);
		
	}

	public void recipeIngreUpdate(RecipeVO vo) {
		
		System.out.println("===> Mybatis로 recipeIngreUpdate() 기능 처리");
		mybatis.update("RecipeDAO.recipeIngreUpdate", vo);
		
	}
	
	public RecipeVO getShopingIngreList(RecipeVO vo) {
		
		System.out.println("===> Mybatis로 getShopingIngreList() 기능 처리");
		return mybatis.selectOne("RecipeDAO.getShopingIngreList", vo);
		
	}

	public void basketInsert(RecipeVO vo) {
		
		System.out.println("===> Mybatis로 basketInsert() 기능 처리");
		mybatis.insert("RecipeDAO.basketInsert", vo);
		
	}


	public int listCount(RecipeListVO vo) {
		
		System.out.println("===> Mybatis로 listCount() 기능 처리");
		return mybatis.selectOne("RecipeDAO.listCount", vo);
	}


	public List<RecipeVO> getAdminRecipeList(RecipeListVO vo) {
		
		System.out.println("===> Mybatis로 getAdminRecipeList() 기능 처리");
		return mybatis.selectList("RecipeDAO.getAdminRecipeList", vo);
	}


	public void recipeDelete(RecipeVO vo) {
		
		System.out.println("===> Mybatis로 recipeDelete() 기능 처리");
		mybatis.delete("RecipeDAO.recipeDelete", vo);
	}


	public List<RecipeVO> getRecipeChart(RecipeVO vo) {
		
		System.out.println("===> Mybatis로 getRecipeChart() 기능 처리");
		return mybatis.selectList("RecipeDAO.getRecipeChart", vo);
	}


	public List<RecipeVO> getRecipeChartIng(RecipeVO vo) {
		
		System.out.println("===> Mybatis로 getRecipeChartIng() 기능 처리");
		return mybatis.selectList("RecipeDAO.getRecipeChartIng", vo);
	}


	public List<RecipeVO> getRecipeChartHow(RecipeVO vo) {
		
		System.out.println("===> Mybatis로 getRecipeChartHow() 기능 처리");
		return mybatis.selectList("RecipeDAO.getRecipeChartHow", vo);
	}
	
	/* rank 추가부분 */
	public int getChefRecipeCnt (RecipeVO recipevo) {
		return mybatis.selectOne("RecipeDAO.getChefRecipeCnt", recipevo);
	}
	
	public List<RecipeVO> getChefRecipeList (RecipeVO recipevo) {
		return mybatis.selectList("RecipeDAO.getChefRecipeList", recipevo);
	}
	
}
