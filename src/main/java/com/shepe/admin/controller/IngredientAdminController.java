package com.shepe.admin.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.shepe.admin.ingredient.IngredientAdminService;
import com.shepe.client.ingredient.IngredientVO;

@Controller
@SessionAttributes("ingredientAdmin")
public class IngredientAdminController {		
	@Autowired
	private IngredientAdminService ingredientAdminService;	
															
	@RequestMapping(value ="/admin/adminInsert.co", method=RequestMethod.GET)
	public String adminInsert (IngredientVO vo, HttpServletRequest req) throws IOException  {	
		return "admin/ingredient/adminInsert"; 
	}
	
	// 식재료 등록 GET의 방식
	@RequestMapping(value ="/admin/adminInsertDetail.co", method=RequestMethod.GET) //@ModelAttribute("ingredientVO")
	public String adminInsertDetail(@ModelAttribute("ingredientVO") IngredientVO ingredientVO) throws IOException, ParseException {	
			return "admin/ingredient/adminInsert";
	}
	
	// 식재료 등록 POST의 방식
	@RequestMapping(value ="/admin/adminInsertDetail.co", method=RequestMethod.POST) //@ModelAttribute("ingredientVO")
	public String adminInsertDetail(@Valid IngredientVO ingredientVO, Errors errors, Model model) throws IOException, ParseException {	
		System.out.println(errors.hasErrors());
		if (errors.hasErrors()) {
			System.out.println("식재료 등록 중 에러 발생!!");
			return "admin/ingredient/adminInsert";
		} else {
			Date nowDate = new Date(System.currentTimeMillis());			
			SimpleDateFormat no = new SimpleDateFormat("yyyyMMddHHmmss");
			String ingredient_no = no.format(nowDate);
			ingredientVO.setIngredient_no(ingredient_no);
			System.out.println("식재료 등록 성공!!");
			ingredientAdminService.adminInsertDetail(ingredientVO);
			ingredientAdminService.imageInsert(ingredientVO);
			return "redirect:/admin/getIngredientList.co";
		}
	}
	
	@ModelAttribute("conditionMap")
	public  Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("식재료 이름", "ingredient_nm");
		conditionMap.put("식재료 번호", "ingredient_no");
		System.out.println("컨디션맵을 거친 후 컨트롤러로 전송이 되낭??");
		return conditionMap;
	}
	
	@RequestMapping(value="/admin/getIngredientList.co")
	public String getIngredientList(IngredientVO vo, Model model) throws Exception {		
		System.out.println("여기타나?");
		model.addAttribute("getInsertList", ingredientAdminService.getIngredientList(vo));	
		model.addAttribute("listCount", ingredientAdminService.IngredientListCnt(vo));
		return "admin/ingredient/getIngredientList";
	}
	
	@ResponseBody
	@RequestMapping(value="/admin/ajaxIngredientList.co")
	public List<IngredientVO>/*String*/ ajaxIngredientList(IngredientVO vo, Model model) throws Exception {
		
		if(vo.getIngredient_searchCondition()== null) vo.setIngredient_searchCondition("ingredient_nm");
		if(vo.getIngredient_searchKeyword() == null) vo.setIngredient_searchKeyword("");
		System.out.println("글 목록 검색 처리");	
		System.out.println("검색 조건 : " + vo.getIngredient_searchCondition());
		System.out.println("검색 단어 : " + vo.getIngredient_searchKeyword());		
		return ingredientAdminService.ajaxIngredientList(vo);
	}

	// 더보기 버튼 리스트 AJAX!
	@ResponseBody
	@RequestMapping(value="/admin/AjaxAddList.co")
	public List<IngredientVO> AjaxAddList(@RequestParam(value="paging") int page , IngredientVO vo, Model model) {
		System.out.println(page+"는 입니다");
		int offset = (page - 1) * 10;
		vo.setOffset(offset);
		return ingredientAdminService.AjaxAddList(vo);
	}
	
	@RequestMapping(value="/admin/detailIngredient.co")
	public String detailIngredient(IngredientVO vo, Model model) {
		model.addAttribute("detail", ingredientAdminService.detailIngredient(vo));
		model.addAttribute("detailDetail",ingredientAdminService.detailIngredeintDetail(vo));
		model.addAttribute("detailMulti", ingredientAdminService.detailIngredeintMulti(vo));
		return "admin/ingredient/detailIngredient";
	}

	@RequestMapping(value="/admin/ingredientDelete.co")
	public String ingredientDelete(IngredientVO vo, Model model) {
		System.out.println(vo.getIngredient_no());
		ingredientAdminService.ingredientDelete(vo);
		return "redirect:getIngredientList.co";
	}

	@RequestMapping(value="/admin/getIngredient.co")
	public String getIngredient(IngredientVO vo, Model model) {
		System.out.println(vo.getIngredient_no());
		model.addAttribute("get",ingredientAdminService.getIngredient(vo));
		model.addAttribute("get2",ingredientAdminService.getIngredeintDetail(vo));
		model.addAttribute("get3",ingredientAdminService.getIngredeintMulti(vo));
		return "admin/ingredient/ingredientUpdate";
	}

	@RequestMapping(value="/admin/ingredientUpdate.co")
	public String ingredientUpdate(IngredientVO vo, Model model) throws IOException {
		ingredientAdminService.ingredientUpdate(vo);
		model.addAttribute(vo);
		return "redirect:getIngredientList.co";
	}

	// 식재료 이름 중복 체크
	@ResponseBody
	@RequestMapping(value="/admin/nmCheck.co")
	public int nmCheck(IngredientVO vo) throws Exception {
		System.out.println("safs;");
		int result = ingredientAdminService.ingredient_nmCheck(vo);
		System.out.println("여기 로직 타냥??");
		return result;
	}

	// 식재료 썸네일 중복 체크
	@ResponseBody
	@RequestMapping(value="/admin/thumbNm.co")
	public int thumbNm(IngredientVO vo) throws Exception {			
		System.out.println("홀리 쉬엣");
		int result = ingredientAdminService.thumbNm(vo);
		return result;
	}
}
