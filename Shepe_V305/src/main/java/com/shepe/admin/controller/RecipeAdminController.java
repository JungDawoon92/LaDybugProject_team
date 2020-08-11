package com.shepe.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.shepe.admin.recipe.RecipeListVO;
import com.shepe.admin.recipe.RecipePageMaker;
import com.shepe.client.recipe.RecipeService;
import com.shepe.client.recipe.RecipeVO;

@Controller
public class RecipeAdminController {
	
	@Autowired
	private RecipeService recipeService;
	
	// 임시 관리자 로그인 폼
	@RequestMapping(value="/admin/login.adre", method=RequestMethod.GET)
	public String loginForm() {
			
		return "/admin/adminLoginForm";
	}
	
	// 임시 로그인 세션
	@RequestMapping(value="/admin/login.adre", method=RequestMethod.POST)
	public String login(RecipeVO vo, HttpSession session) {
	
		session.setAttribute("id", vo.getMember_id());
		session.setAttribute("nickname", vo.getMember_nickname());
		return "/admin/adminMain";
	}
	
	// 레시피 리스트
	@RequestMapping("/admin/recipeList.adre")
	public String getRecipeList(RecipeListVO vo, Model model, RecipePageMaker pageMaker) throws Exception {
		
		// null check
		if(vo.getSearchCondition() == null) vo.setSearchCondition("member_id");
		if(vo.getSearchKeyword() == null) vo.setSearchKeyword("");
		
		System.out.println(vo.getSearchCondition() +","+ vo.getSearchKeyword());
		
		model.addAttribute("recipeList", recipeService.getAdminRecipeList(vo));
		
		pageMaker.setCri(vo);
		pageMaker.setTotalCount(recipeService.listCount(vo));
		
		model.addAttribute("pageMaker", pageMaker);
		
		model.addAttribute("search", vo); // 페이지 넘버 이동시 검색 데이터 연결
		
		return "admin/recipe/adminRecipeList";
	}
	
	// 레시피 상세 조회
	@RequestMapping("/admin/getRecipe.adre")
	public String getRecipe(RecipeVO vo, Model model) throws IllegalStateException, IOException {
		
		// 카운트 증가
		recipeService.recipeCntUpdate(vo);
		
		// 기본 정보
		model.addAttribute("recipe", recipeService.getRecipe(vo));	
		
		// 식재료 리스트
		List<RecipeVO> ingredient = recipeService.getRecipeIngreList(vo);
		model.addAttribute("recipeIngreList", ingredient); 
		
		// 과정 리스트
		model.addAttribute("recipeProcessList", recipeService.getRecipeProcessList(vo));
		
		return "admin/recipe/adminRecipeDetail";
	}
	
	// 레시피 삭제 하기
	@RequestMapping("/admin/adminRecipeDelete.adre")
	public String adminRecipeDelete(RecipeVO vo, Model model) throws IllegalStateException, IOException {
		
		// 레시피 삭제
		recipeService.recipeDelete(vo);
		
		return "redirect:recipeList.adre";
	}
	
	// 레시피 업데이트 폼
	@RequestMapping(value="/admin/adminRecipeUpdate.adre", method=RequestMethod.GET)
	public String getUpdaTeRecipe(RecipeVO vo, Model model) throws IllegalStateException,IOException {
			
		// 기본 정보
		model.addAttribute("recipe", recipeService.getRecipe(vo));	
		// 식재료 리스트
		model.addAttribute("recipeIngreList", recipeService.getRecipeIngreList(vo)); 
		// 과정 리스트
		model.addAttribute("recipeProcessList", recipeService.getRecipeProcessList(vo));
			
		return "admin/recipe/adminUpdateRecipe";
	}
	
	// 레시피 업데이트 action
	@RequestMapping(value="/admin/adminRecipeUpdate.adre", method=RequestMethod.POST)
	public String updateRecipe(RecipeVO vo, HttpServletRequest request, MultipartHttpServletRequest multipart, HttpSession session, Model model) throws IOException {
	
		Date date_now = new Date(System.currentTimeMillis());
		SimpleDateFormat fourteen_format = new SimpleDateFormat("yyyyMMddHHmmSS");
		
		// 완성이미지 및 기본 업데이트
		MultipartFile uploadCompleteImege = vo.getRecipe_complete_img_file();
		if(!uploadCompleteImege.isEmpty()) {
			String completeImegeName = uploadCompleteImege.getOriginalFilename() + fourteen_format.format(date_now);
			uploadCompleteImege.transferTo(new File("D:\\upload\\complete\\" + completeImegeName));
			vo.setRecipe_complete_img(completeImegeName);
			
			recipeService.recipeUpdateImg(vo);
		} else if(uploadCompleteImege.isEmpty()) {
			recipeService.recipeUpdate(vo);
		}
			
		// 과정 업로드
		String[] processList = request.getParameterValues("recipe_process");
		List<MultipartFile> processImg = multipart.getFiles("recipe_process_img_file");
		String[] process_sq = request.getParameterValues("recipe_process_sq");
		long[] process_sq_int = Arrays.stream(process_sq).mapToLong(Long::parseLong).toArray();
		
		
		for (int i = 0; i < processList.length; i++) {
			String process = processList[i];
			MultipartFile uploadProcessImege = processImg.get(i);
			
			vo.setRecipe_process(process);
			
			// 과정 번호 처리
			if (process_sq_int[i] == 0) {
				long time = System.currentTimeMillis();
				vo.setRecipe_process_sq(time);
			} else if (process_sq_int[i] != 0) {
				long processSq = process_sq_int[i];
				vo.setRecipe_process_sq(processSq);
			}
			
			// 이미지 업로드
			if(!uploadProcessImege.isEmpty()) {
				String processImegeName = uploadProcessImege.getOriginalFilename() + fourteen_format.format(date_now);
				uploadProcessImege.transferTo(new File("D:\\upload\\process\\" + processImegeName));
				vo.setRecipe_process_img(processImegeName);
				recipeService.processUpdateImg(vo);
			} else if(uploadProcessImege.isEmpty()) {
				recipeService.processUpdate(vo);
			}
		}
		
		// 식재료 업로드
		String[] ingredient_nm_list = request.getParameterValues("ingredient_nm");
		String[] recipeIngre_cnt_list = request.getParameterValues("recipeIngre_cnt");
		String[] recipeingre_sq = request.getParameterValues("recipeingre_sq");
		long[] recipeingre_int = Arrays.stream(recipeingre_sq).mapToLong(Long::parseLong).toArray();
		
		for (int i = 0; i < ingredient_nm_list.length; i++) {
			String ingredient_nm = ingredient_nm_list[i];
			String recipeIngre_cnt = recipeIngre_cnt_list[i];
			vo.setIngredient_nm(ingredient_nm);
			vo.setRecipeingre_cnt(recipeIngre_cnt);
			
			// 식재료 sq 처리
			if (recipeingre_int[i] == 0) {
				long time = System.currentTimeMillis();
				vo.setRecipeingre_sq(time);
			} else if (recipeingre_int[i] != 0) {
				long recipeingreSq = recipeingre_int[i];
				vo.setRecipeingre_sq(recipeingreSq);
			}
			
			recipeService.recipeIngreUpdate(vo);
		}
		
		return "redirect:recipeList.adre";
	}
	
	// 레시피 등록 폼
	@RequestMapping(value="/admin/adminRecipeInsert.adre", method=RequestMethod.GET)
	public String getInsertRecipe(RecipeVO vo) throws IOException {
		
		return "admin/recipe/adminInsertRecipe";
	}
	
	// 레시피 등록 action
	@RequestMapping(value="/admin/adminRecipeInsert.adre", method=RequestMethod.POST)
	public String insertRecipe(RecipeVO vo, HttpServletRequest request, MultipartHttpServletRequest multipart, HttpSession session) throws IOException {
		
		Date date_now = new Date(System.currentTimeMillis());
		SimpleDateFormat fourteen_format = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String memberId = (String) session.getAttribute("id");
		String recipe_no = memberId + fourteen_format.format(date_now);
		
		vo.setRecipe_no(recipe_no);
		
		// 완성이미지 업로드
		MultipartFile uploadCompleteImege = vo.getRecipe_complete_img_file();
		if(!uploadCompleteImege.isEmpty()) {
			String completeImegeName = uploadCompleteImege.getOriginalFilename() + fourteen_format.format(date_now);
			uploadCompleteImege.transferTo(new File("D:\\upload\\complete\\" + completeImegeName));
			vo.setRecipe_complete_img(completeImegeName);
		}
		
		recipeService.recipeInsert(vo);
		
		// 과정 업로드
		String[] processList = request.getParameterValues("recipe_process");
		List<MultipartFile> processImg = multipart.getFiles("recipe_process_img_file");
		for (int i = 0; i < processList.length; i++) {
			String process = processList[i];
			MultipartFile uploadProcessImege = processImg.get(i);
			long time = System.currentTimeMillis();
			
			vo.setRecipe_process_sq(time);
			vo.setRecipe_process(process);
			
			// 이미지 업로드
			if(!uploadProcessImege.isEmpty()) {
				String processImegeName = uploadProcessImege.getOriginalFilename() + fourteen_format.format(date_now);
				uploadProcessImege.transferTo(new File("D:\\upload\\process\\" + processImegeName));
				vo.setRecipe_process_img(processImegeName);
			}
			recipeService.processInsert(vo);
		}
		
		// 식재료 업로드
		String[] ingredient_nm_list = request.getParameterValues("ingredient_nm");
		String[] recipeIngre_cnt_list = request.getParameterValues("recipeIngre_cnt");
		
		for (int i = 0; i < ingredient_nm_list.length; i++) {
			String ingredient_nm = ingredient_nm_list[i];
			String recipeIngre_cnt = recipeIngre_cnt_list[i];
			long time = System.currentTimeMillis();
			vo.setRecipeingre_sq(time);
			vo.setIngredient_nm(ingredient_nm);
			vo.setRecipeingre_cnt(recipeIngre_cnt);
			recipeService.recipeIngreInsert(vo);
		}
		
		return "redirect:recipeList.adre";
	}
	
	// 검색 조건 목록 설정
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "recipe_nm");
		conditionMap.put("작성자", "member_id");
				
		return conditionMap;
	}
}
