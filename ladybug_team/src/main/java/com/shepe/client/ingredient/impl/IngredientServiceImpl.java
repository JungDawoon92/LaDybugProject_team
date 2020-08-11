package com.shepe.client.ingredient.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shepe.client.ingredient.IngredientService;
import com.shepe.client.ingredient.IngredientVO;

@Service("ingredientService")
public class IngredientServiceImpl implements IngredientService {

	@Autowired
	private IngredientDAO ingredientDAO;

	//	public IngredientVO clientDetail(IngredientVO vo) {
	//		ingredientDAO.clientDetail(vo);
	//		return clientDetail(vo);
	//	}
	
	
	// 클라이언트 첫 리스트
	@Transactional(value="transactionManager", rollbackFor= {Exception.class}) 
	public List<IngredientVO>clientList(IngredientVO vo) {
		return ingredientDAO.clientList(vo);

	}
	// 클라이언트 디테일 리스트
	@Transactional(value="transactionManager", rollbackFor= {Exception.class, NumberFormatException.class}) 
	public List<IngredientVO>clientDetailList(IngredientVO vo) {
		return ingredientDAO.clientDetailList(vo);
	}

	//클라이언트 디테일 
	@Transactional(value="transactionManager", rollbackFor= {Exception.class, NumberFormatException.class}) 
	public IngredientVO clientDetail(IngredientVO vo) {
		return ingredientDAO.clientDetail(vo);
	}

	//클라이언트 디테일디테일
	@Transactional(value="transactionManager", rollbackFor= {Exception.class, NumberFormatException.class}) 
	public IngredientVO clientDetailDetails(IngredientVO vo) {
		return ingredientDAO.clientDetailDetails(vo);
	}

	//클라이언트 디테일멀티
	@Transactional(value="transactionManager", rollbackFor= {Exception.class, NumberFormatException.class}) 
	public List<IngredientVO> clientDetailMulti(IngredientVO vo) {
		return ingredientDAO.clientDetailMulti(vo);
	}

	//클라이언트 식재료 양 AJAX 업데이트
	@Transactional(value="transactionManager", rollbackFor= {Exception.class, NumberFormatException.class}) 
	public IngredientVO ing_amtCheck(IngredientVO vo) {
		return ingredientDAO.ing_amtCheck(vo);
	}
	
//	public int ing_amtCheck(IngredientVO vo) {
//		int result = ingredientDAO.ing_amtCheck(vo);
//		return result;
//	}
}
