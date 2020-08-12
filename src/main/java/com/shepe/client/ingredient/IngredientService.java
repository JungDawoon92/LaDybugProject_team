package com.shepe.client.ingredient;

import java.util.List;

public interface IngredientService {
	// crud 기능의 메소드 구현
	// 클라이언트 식재료 리스트
	List<IngredientVO>clientList(IngredientVO vo);
	
	// 클라이언트  디테일  더보기 상품 리스트
	List<IngredientVO>addList(IngredientVO vo);

	// 클라이언트 디테일 리스트
	List<IngredientVO>clientDetailList(IngredientVO vo);
	
	// 클라이언트 식재료 디테일 횟수
	int count(IngredientVO vo);

	// 식재료 디테일
	IngredientVO clientDetail(IngredientVO vo);

	// 식재료 디테일디테일
	IngredientVO clientDetailDetails(IngredientVO vo);

	// 식재료 디테일멀티
	List<IngredientVO> clientDetailMulti(IngredientVO vo);
	
	// 식재료 가격 AJAX 업데이트
	IngredientVO ing_amtCheck(IngredientVO vo);
}
