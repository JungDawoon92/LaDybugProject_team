package com.shepe.client.ingredient.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shepe.client.ingredient.IngredientVO;

@Repository
public class IngredientDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 관리자 식재료관련 등록!!!
	public void adminInsertDetail (IngredientVO vo) {
		System.out.println("=================");
		mybatis.insert("IngredientDAO.adminInsert", vo);
		mybatis.insert("IngredientDAO.adminInsertDetail", vo);
		System.out.println("식재료 인서트DAO 접근!!");
		System.out.println("=================");
	}
	
	// 다중 이미지 등록!
	public void imageInsert(IngredientVO vo) {
		System.out.println("=================");
		mybatis.insert("IngredientDAO.adminInsertMulti", vo);
		System.out.println("식재료 다중 이미지 인서트DAO 접근!!");
		System.out.println("=================");
	}
	
	// 식재료 리스트!!
	public List<IngredientVO> getIngredientList(IngredientVO vo) { 
		System.out.println("==================");
		System.out.println("===>식재료 리스트DAO 접근!!");
		System.out.println("==================");
		return mybatis.selectList("IngredientDAO.getIngredientList", vo);
	}
	
	// AJAX 더보기 버튼
	public List<IngredientVO> AjaxAddList(IngredientVO vo) {
		System.out.println("==================");
		System.out.println("===>식재료 추가 버튼 페이징DAO 접근!!");
		System.out.println("==================");
		return mybatis.selectList("IngredientDAO.AjaxAddList", vo);
	}
	
	//AJAX 검색 리스트
	public List<IngredientVO> ajaxIngredientList(IngredientVO vo) {
		System.out.println("==================");
		System.out.println("===>식재료 검색 리스트DAO 접근!!");
		System.out.println("==================");
		return mybatis.selectList("IngredientDAO.ajaxIngredientList", vo);
	}
		
	// 식재료 디테일!
	public IngredientVO detailIngredient(IngredientVO vo) {
		System.out.println("==================");
		System.out.println("===>식재료 디테일1DAO 접근!!");
		System.out.println("==================");
		return mybatis.selectOne("IngredientDAO.detailIngredient", vo);
	}
	
	// 식재료 세부사항 디테일!!
	public IngredientVO detailIngredeintDetail(IngredientVO vo) {
		System.out.println("==================");
		System.out.println("===>식재료 디테일2DAO 접근!!");
		System.out.println("==================");
		return mybatis.selectOne("IngredientDAO.detailIngredeintDetail", vo);
	}
	
	// 식재료 멀티 디테일!!
	public List<IngredientVO> detailIngredeintMulti(IngredientVO vo) {
		System.out.println("==================");
		System.out.println("===>식재료 디테일3DAO 접근!!");
		System.out.println("==================");
		return mybatis.selectList("IngredientDAO.detailIngredeintMulti", vo);
	}
	
	//식재료 삭제얌!!
	public void ingredientDelete(IngredientVO vo) {
		System.out.println("=================");
		mybatis.delete("IngredientDAO.ingredientDeleteDetail", vo);
		mybatis.delete("IngredientDAO.ingredientDeleteMulti", vo);
		mybatis.delete("IngredientDAO.ingredientDelete", vo);
		System.out.println("식재료 삭제DAO 접근!!");
		System.out.println("=================");
	}
	
	//식재료 업데이트!
	public void ingredientUpdate(IngredientVO vo) {
		System.out.println("=================");
		mybatis.update("IngredientDAO.ingredientUpdateDetail", vo);
		mybatis.update("IngredientDAO.ingredientUpdateMulti", vo);
		mybatis.update("IngredientDAO.ingredientUpdate", vo);
		System.out.println("식재료 업데이트DAO 접근!!");
		System.out.println("=================");
	}
	
	//식재료 get!! 업데이트 전!!
	public IngredientVO getIngredient(IngredientVO vo) {
		System.out.println("==================");
		System.out.println("===>식재료겟DAO 접근!!");
		System.out.println("==================");
		return mybatis.selectOne("IngredientDAO.getIngredient", vo);
	}
	
	public IngredientVO getIngredeintDetail(IngredientVO vo) {
		System.out.println("==================");
		System.out.println("===>식재료겟2DAO 접근!!");
		System.out.println("==================");
		return mybatis.selectOne("IngredientDAO.getIngredeintDetail", vo);
	}
	
	public List<IngredientVO> getIngredeintMulti(IngredientVO vo) {
		System.out.println("==================");
		System.out.println("===>식재료겟3DAO 접근!!");
		System.out.println("==================");
		return mybatis.selectList("IngredientDAO.getIngredeintMulti", vo);
	}
	
	// 식재료 중복 검사
	public int ingredient_nmCheck(IngredientVO vo) throws Exception {
		System.out.println("==================");
		System.out.println("===>식재료 중복 검사 DAO 접근!!");
		System.out.println("==================");
		int result = mybatis.selectOne("IngredientDAO.ingredient_nmCheck", vo);
		return result;
	}
	
	// 식재료 썸네일 중복검사
	public int  thumbNm(IngredientVO vo) throws Exception {
		System.out.println("==================");
		System.out.println("===>식재료 썸네일 검사 DAO 접근!!");
		System.out.println("==================");
		int result = mybatis.selectOne("IngredientDAO.thumbNm", vo);
		return result;
	}
	
	// 식재료 업데이트
	public int priceCount(IngredientVO vo) throws Exception {
		System.out.println("==================");
		System.out.println("===>식재료 가격 AJAX DAO 접근!!");
		System.out.println("==================");
		int result = mybatis.update("IngredientDAO.priceCount", vo);
		return result;
	}
	
	// 식재료 데이타 총 개수 구하기
	public int IngredientListCnt(IngredientVO vo) throws Exception {
		System.out.println("==================");
		System.out.println("===>식재료 총 데이타 개수 DAO 접근!!");
		System.out.println("==================");
		int power = mybatis.selectOne("IngredientDAO.IngredientListCnt", vo);
		return power;
	}
	
	// 식재료 데이타 리스트 구하기
	public List<IngredientVO>IngredientList(IngredientVO vo) throws Exception {
		System.out.println("==================");
		System.out.println("===>식재료 총 데이타 개수 DAO 접근!!");
		System.out.println("==================");
		return mybatis.selectList("IngredientDAO.IngredientList", vo);
	}
	
	// AJAX 식재료 그래프 구하기
	public List<IngredientVO> adminIngredientChart(IngredientVO vo) {
		System.out.println("==================");
		System.out.println("===>식재료 차트  DAO 접근!!");
		System.out.println("==================");
		return mybatis.selectList("IngredientDAO.adminIngredientChart", vo);
	}
	
	// AJAX 식재료 그래프 구하기
	public List<IngredientVO> adminIngredientAvgChart(IngredientVO vo) {
		System.out.println("==================");
		System.out.println("===>식재료 평균 가격 그래프  DAO 접근!!");
		System.out.println("==================");
		return mybatis.selectList("IngredientDAO.adminIngredientAvgChart", vo);
	}
	
	
	
	
	
	
	
	
	/* 클라이어트 단 시작!!!
	 * 
	 * 
	 * 
	 * 
	 * */
	// 클라이언트 첫 리스트 시작
	public List<IngredientVO>clientList(IngredientVO vo) {
		System.out.println("==================");
		System.out.println("===>클라이언트 식재료 리스트 DAO 접근!!");
		System.out.println("==================");
		return mybatis.selectList("IngredientDAO.clientList", vo);
	}
	
	// 클라이언트 디테일 더보기 리스트
	public List<IngredientVO>addList(IngredientVO vo) {
		System.out.println("==================");
		System.out.println("===>클라이언트 디테일 더보기 리스트 DAO 접근!!");
		System.out.println("==================");
		return mybatis.selectList("IngredientDAO.addList", vo);
	}
	
	// 클라이언트 디테일 식재료 카운트
	public int count(IngredientVO vo) {
		System.out.println("==================");
		System.out.println("===>클라이언트 더보기 DAO 접근!!");
		System.out.println("==================");
		int result =  mybatis.selectOne("IngredientDAO.count", vo);
		return result;
	}
	
	// 클라이언트 디테일 페이지
	public List<IngredientVO>clientDetailList(IngredientVO vo) {
		System.out.println("==================");
		System.out.println("===>클라이언트 디테일 리스트 DAO 접근!!");
		System.out.println("==================");
		return mybatis.selectList("IngredientDAO.clientDetailList", vo);
	}
	
	// 클라이언트 디테일 페이지
	public IngredientVO clientDetail(IngredientVO vo) {
		System.out.println("==================");
		System.out.println("===>클라이언트 디테일 DAO 접근!!");
		System.out.println("==================");
		return mybatis.selectOne("IngredientDAO.clientDetail", vo);
	}
	
	// 클라이언트 디테일디테일
	public IngredientVO clientDetailDetails(IngredientVO vo) {
		System.out.println("==================");
		System.out.println("===>클라이언트 디테일디테일 DAO 접근!!");
		System.out.println("==================");
		return mybatis.selectOne("IngredientDAO.clientDetailDetails", vo);
	}
	
	// 클라이언트 디테일 멀티
	public List<IngredientVO> clientDetailMulti(IngredientVO vo) {
		System.out.println("==================");
		System.out.println("===>클라이언트 디테일멀티 DAO 접근!!");
		System.out.println("==================");
		return mybatis.selectList("IngredientDAO.clientDetailMulti", vo);
	}
	
	// 클라이언트 식재료 가격 Ajax 업데이트
	public IngredientVO ing_amtCheck(IngredientVO vo) {
		System.out.println("==================");
		System.out.println("===>클라이언트 디테일디테일 DAO 접근!!");
		System.out.println("==================");
		return mybatis.selectOne("IngredientDAO.ing_amtCheck", vo);
	}
}
