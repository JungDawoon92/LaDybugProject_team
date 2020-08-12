package com.shepe.admin.ingredient.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.shepe.admin.ingredient.IngredientAdminService;
import com.shepe.client.ingredient.IngredientVO;
import com.shepe.client.ingredient.impl.IngredientDAO;


@Service("ingredientAdminService")
public class IngredientAdminServiceImpl implements IngredientAdminService {
	
	@Autowired
	private IngredientDAO ingredientDAO;

	// 식재료 인서트	 
	@Transactional(value="txManager", readOnly = true, rollbackFor= {Exception.class, NumberFormatException.class}) 
	public void adminInsertDetail(IngredientVO vo) throws IOException {
		System.out.println("어드민 인서트 타냐?");
		MultipartFile thumbUpload = vo.getIngredient_thumbimg();
		if(!thumbUpload.isEmpty()) {
			String ingredient_thumbimg = thumbUpload.getOriginalFilename();
			thumbUpload.transferTo(new File("D:\\swork\\shepe_V305\\src\\main\\webapp\\resources\\img\\ingredient-img\\" + ingredient_thumbimg));
			vo.setIngredient_thumbName(ingredient_thumbimg);
		}
			ingredientDAO.adminInsertDetail(vo);
	}
	@Transactional(value="txManager", readOnly = true, rollbackFor= {Exception.class, NumberFormatException.class}) 
	public void imageInsert(IngredientVO vo) throws IOException {
		MultipartFile[] imageUpload = vo.getIngredient_multi_img();
		System.out.println("이미지 다중 인서트 타냐?");
		List<String> imgNames = new ArrayList();
		for(int i=0; i < imageUpload.length; i++) {
			String ingredient_multi_img = imageUpload[i].getOriginalFilename();
			imageUpload[i].transferTo(new File("D:\\swork\\shepe_V305\\src\\main\\webapp\\resources\\img\\upload\\" + ingredient_multi_img));
			imgNames.add(ingredient_multi_img);		
			vo.setIngredient_fileName(ingredient_multi_img);
			ingredientDAO.imageInsert(vo);
		}
	}
	
	// 식재료 리스트 뿌리기
	@Transactional(value="txManager", rollbackFor= {Exception.class}) 
	public List<IngredientVO> getIngredientList(IngredientVO vo) {
		return ingredientDAO.getIngredientList(vo);
	}		
	
	// AJAX 추가 페이징 리스트
	@Transactional(value="txManager", rollbackFor= {Exception.class, NumberFormatException.class})
	public List<IngredientVO> AjaxAddList(IngredientVO vo) {
		return ingredientDAO.AjaxAddList(vo);
	}
	
	// AJAX 검색 리스트
	@Transactional(value="txManager", rollbackFor= {Exception.class, NumberFormatException.class})
	public List<IngredientVO> ajaxIngredientList(IngredientVO vo) {
		return ingredientDAO.ajaxIngredientList(vo);
	}
	
	// 식재료 디테일 페이지
	@Transactional(value="txManager", rollbackFor= {Exception.class, NumberFormatException.class})
	public IngredientVO detailIngredient(IngredientVO vo) {
		return ingredientDAO.detailIngredient(vo);
	}
	
	// 식재료 세부사항 디테일
	@Transactional(value="txManager", rollbackFor= {Exception.class, NumberFormatException.class})
	public IngredientVO detailIngredeintDetail(IngredientVO vo) {
		return ingredientDAO.detailIngredeintDetail(vo);
	}
	
	// 식재료 멀티 디테일
	@Transactional(value="txManager", rollbackFor= {Exception.class, NumberFormatException.class})
	public List<IngredientVO> detailIngredeintMulti(IngredientVO vo) {
		return ingredientDAO.detailIngredeintMulti(vo);
	}
	
	// 식재료 삭제
	@Transactional(value="txManager", readOnly = true, rollbackFor = {Exception.class, NumberFormatException.class}) 
	public void ingredientDelete(IngredientVO vo) {
		ingredientDAO.ingredientDelete(vo);
	}
	
	// 식재료 업데이트
	@Transactional(value="txManager", readOnly = true, rollbackFor = {Exception.class, NumberFormatException.class}) 
	public void ingredientUpdate(IngredientVO vo)  throws IOException {
		MultipartFile[] imageUpload = vo.getIngredient_multi_img();
		MultipartFile thumbUpload = vo.getIngredient_thumbimg();
		
		for(int i=0; i < imageUpload.length; i++) {
			String ingredient_multi_img = imageUpload[i].getOriginalFilename();
			imageUpload[i].transferTo(new File("D:\\swork\\shepe_V305\\src\\main\\webapp\\resources\\img\\upload\\" + ingredient_multi_img));
			vo.setIngredient_fileName(ingredient_multi_img);
			System.out.println(ingredient_multi_img);
		}

		if(!thumbUpload.isEmpty()) {
			String ingredient_thumbimg = thumbUpload.getOriginalFilename();
			thumbUpload.transferTo(new File("D:\\swork\\shepe_V305\\src\\main\\webapp\\resources\\img\\ingredient-img\\" + ingredient_thumbimg));
			vo.setIngredient_thumbName(ingredient_thumbimg);
		}
		ingredientDAO.ingredientUpdate(vo);
	}
	
	// 식재료 겟 !!
	@Transactional(value="txManager", rollbackFor= {Exception.class})
	public IngredientVO getIngredient(IngredientVO vo) {
		return ingredientDAO.getIngredient(vo);
	}
	@Transactional(value="txManager", rollbackFor= {Exception.class})
	public IngredientVO getIngredeintDetail(IngredientVO vo) {
		return ingredientDAO.getIngredeintDetail(vo);
	}
	@Transactional(value="txManager", rollbackFor= {Exception.class})
	public List<IngredientVO> getIngredeintMulti(IngredientVO vo) {
		return ingredientDAO.getIngredeintMulti(vo);
	}
	
	// 식재료 중복검사!!
	@Transactional(value="txManager", rollbackFor= {Exception.class})
	public int ingredient_nmCheck(IngredientVO vo) throws Exception {
		int result = ingredientDAO.ingredient_nmCheck(vo);
		return result;
	}
	
	//식재료 썸네일 중복검사!
	@Transactional(value="txManager", rollbackFor= {Exception.class})
	public int thumbNm(IngredientVO vo) throws Exception {
		int result = ingredientDAO.thumbNm(vo);
		return result;
	}
			
	//식재료 데이타 총 개수 구하기
	@Transactional(value="txManager", rollbackFor= {Exception.class}) 
	public int IngredientListCnt (IngredientVO vo) throws Exception {
		int result =  ingredientDAO.IngredientListCnt(vo);
		return result;
	}
	
	//AJAX 식재료 그래프 
	@Transactional(value="txManager", rollbackFor = {Exception.class})
	public List<IngredientVO> adminIngredientChart(IngredientVO vo) {
		return ingredientDAO.adminIngredientChart(vo);
	}
	
	//AJAX 식재료 그래프 
	@Transactional(value="txManager", rollbackFor = {Exception.class})
	public List<IngredientVO> adminIngredientAvgChart(IngredientVO vo) {
		return ingredientDAO.adminIngredientAvgChart(vo);
	}
	
	
}
