package com.shepe.admin.ingredient;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.shepe.client.ingredient.IngredientVO;

public interface IngredientAdminService {
	
		// crud 기능의 메소드 구현
		// 식재료 등록
		void adminInsertDetail(IngredientVO vo) throws IOException ;
		
		// 다중 이미지 업로드
		void imageInsert(IngredientVO vo) throws IOException;
		
		// 식재료들 리스트 뿌리기
		List<IngredientVO> getIngredientList(IngredientVO vo) throws Exception;
		
		// 식재료 추가 페이징 AJAX
		List<IngredientVO> AjaxAddList(IngredientVO vo);
		
		// AJAX 검색 리스트 뿌리기
		List<IngredientVO> ajaxIngredientList(IngredientVO vo);
		
		// 식재료 디테일 
		IngredientVO detailIngredient(IngredientVO vo);
		
		// 식재료 세부사항 디테일
		IngredientVO detailIngredeintDetail(IngredientVO vo);
		
		// 식재료 멀티 디테일
		List<IngredientVO> detailIngredeintMulti(IngredientVO vo);
		
		// 식재료 삭제
		void ingredientDelete(IngredientVO vo);
		
		// 식재료 업데이트
		void ingredientUpdate(IngredientVO vo) throws IOException;
		
		// 식재료 겟!!
		IngredientVO getIngredient(IngredientVO vo);
		IngredientVO getIngredeintDetail(IngredientVO vo);
		List<IngredientVO> getIngredeintMulti(IngredientVO vo); 
		
		// 식재료 중복검사
		int ingredient_nmCheck(IngredientVO vo) throws Exception;
		
		// 식재료 썸네일 중복검사
		int thumbNm(IngredientVO vo) throws Exception;
				
		//페이징 총 데이타 개수 구하기
		int IngredientListCnt(IngredientVO vo) throws Exception;
		
		// AJAX 식재료 그래프 차트
		List<IngredientVO> adminIngredientChart(IngredientVO vo);
		
		// AJAX 식재료 평균 금액 그래프 차트
		List<IngredientVO> adminIngredientAvgChart(IngredientVO vo);
}
