package com.shepe.admin.rank.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shepe.admin.rank.RankIncomeAdminService;
import com.shepe.admin.rank.RankIncomeAdminVO;

@Service
public class RankIncomeAdminServiceImpl implements RankIncomeAdminService {

	@Autowired
	private RankIncomeAdminDaoMybatis rankIncomeDAO;

	@Override
	public List<RankIncomeAdminVO> getIncomeSumChart(RankIncomeAdminVO incomevo) {
		return rankIncomeDAO.getIncomeSumChart(incomevo);
	}

	@Override
	public List<RankIncomeAdminVO> getMonthTopRecipeIncomeChart(RankIncomeAdminVO incomevo) {
		return rankIncomeDAO.getMonthTopRecipeIncomeChart(incomevo);
	}

	@Override
	public List<RankIncomeAdminVO> getMonthTopIngredientIncomeChart(RankIncomeAdminVO incomevo) {
		return rankIncomeDAO.getMonthTopIngredientIncomeChart(incomevo);
	}

	@Override
	public List<RankIncomeAdminVO> getMonthTopMemberChart(RankIncomeAdminVO incomevo) {
		return rankIncomeDAO.getMonthTopMemberChart(incomevo);
	}

	@Override
	public List<RankIncomeAdminVO> getIncomeDetailList(RankIncomeAdminVO incomevo) {
		return rankIncomeDAO.getIncomeDetailList(incomevo);
	}



}
