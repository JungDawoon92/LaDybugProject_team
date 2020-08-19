package com.shepe.admin.rank.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shepe.admin.rank.RankIncomeAdminVO;

@Repository
public class RankIncomeAdminDaoMybatis {

	@Autowired
	private SqlSessionTemplate rankIncome;

	public List<RankIncomeAdminVO> getIncomeSumChart (RankIncomeAdminVO incomevo) {
		return rankIncome.selectList("adRankIncomeDAO.getIncomeSumChart", incomevo);
	}
	
	public List<RankIncomeAdminVO> getMonthTopRecipeIncomeChart (RankIncomeAdminVO incomevo) {
		return rankIncome.selectList("adRankIncomeDAO.getMonthTopRecipeIncomeChart", incomevo);
	}
	
	public List<RankIncomeAdminVO> getMonthTopIngredientIncomeChart (RankIncomeAdminVO incomevo) {
		return rankIncome.selectList("adRankIncomeDAO.getMonthTopIngredientIncomeChart", incomevo);
	}
	
	public List<RankIncomeAdminVO> getMonthTopMemberChart (RankIncomeAdminVO incomevo) {
		return rankIncome.selectList("adRankIncomeDAO.getMonthTopMemberChart", incomevo);
	}
	
	public List<RankIncomeAdminVO> getIncomeDetailList (RankIncomeAdminVO incomevo) {
		return rankIncome.selectList("adRankIncomeDAO.getIncomeDetailList", incomevo);
	}
}
