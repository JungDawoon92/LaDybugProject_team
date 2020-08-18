package com.shepe.client.interceptorController;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shepe.client.recipe.RecipeService;
import com.shepe.client.recipe.RecipeVO;

@Controller
@RequestMapping("/recipeInterceptor")
public class RecipeClientInterceptorController {
	
	@Autowired
	private RecipeService recipeService;
	
	// 레시피 등록 폼
	@RequestMapping(value="/recipeInsert.re", method=RequestMethod.GET)
	public String getInsertRecipe(RecipeVO vo) throws IOException {
		System.out.println("레시피 인터셉터 확인");
		return "client/recipe/insertRecipe";
	}
	
	// 레시피 등록 action
	@RequestMapping(value="/recipeInsert.re", method=RequestMethod.POST)
	public String insertRecipe(RecipeVO vo, HttpServletRequest request, MultipartHttpServletRequest multipart,
			HttpSession session, RedirectAttributes redirectAttributes) throws IOException {
		
		Date date_now = new Date(System.currentTimeMillis());
		SimpleDateFormat fourteen_format = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String iname = (String) session.getAttribute("member_id");
		
		String memberId = null;
		if(iname != null) memberId = (String) session.getAttribute("member_id");
		
		String recipe_no = memberId + fourteen_format.format(date_now);
		
		vo.setRecipe_no(recipe_no);
		
		// 완성이미지 업로드
		MultipartFile uploadCompleteImege = vo.getRecipe_complete_img_file();
		if(!uploadCompleteImege.isEmpty()) {
			String completeImegeName = fourteen_format.format(date_now) + uploadCompleteImege.getOriginalFilename();
			uploadCompleteImege.transferTo(new File("E:\\Swork\\sharecipe\\src\\main\\webapp\\resources\\img\\recipe-com-img\\" + completeImegeName));
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
				String processImegeName = fourteen_format.format(date_now) + uploadProcessImege.getOriginalFilename();
				uploadProcessImege.transferTo(new File("E:\\Swork\\sharecipe\\src\\main\\webapp\\resources\\img\\recipe-pro-img\\" + processImegeName));
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
		
		redirectAttributes.addAttribute("recipe_no", vo.getRecipe_no());
		return "redirect:/getRecipe.re";
	}
	
	// 레시피 업데이트 폼
	@RequestMapping(value="/recipeUpdate.re", method=RequestMethod.GET)
	public String getUpdaTeRecipe(RecipeVO vo, Model model) throws IllegalStateException,IOException {
			
		// 기본 정보
		model.addAttribute("recipe", recipeService.getRecipe(vo));	
		// 식재료 리스트
		model.addAttribute("recipeIngreList", recipeService.getRecipeIngreList(vo)); 
		// 과정 리스트
		model.addAttribute("recipeProcessList", recipeService.getRecipeProcessList(vo));
			
		return "client/recipe/updateRecipe";
	}
	
	// 레시피 업데이트 action
	@RequestMapping(value="/recipeUpdate.re", method=RequestMethod.POST)
	public String updateRecipe(RecipeVO vo, HttpServletRequest request, MultipartHttpServletRequest multipart,
			HttpSession session, Model model, RedirectAttributes redirectAttributes) throws IOException {
	
		Date date_now = new Date(System.currentTimeMillis());
		SimpleDateFormat fourteen_format = new SimpleDateFormat("yyyyMMddHHmmSS");
		String[] process_sq = request.getParameterValues("recipe_process_sq");
		long[] process_sq_int = Arrays.stream(process_sq).mapToLong(Long::parseLong).toArray();
		
		// 완성이미지 및 기본 업데이트
		MultipartFile uploadCompleteImege = vo.getRecipe_complete_img_file();
		if(!uploadCompleteImege.isEmpty()) {
			String completeImegeName = fourteen_format.format(date_now) + uploadCompleteImege.getOriginalFilename();
			uploadCompleteImege.transferTo(new File("E:\\Swork\\sharecipe\\src\\main\\webapp\\resources\\img\\recipe-com-img\\" + completeImegeName));
			vo.setRecipe_complete_img(completeImegeName);
			
			recipeService.recipeUpdateImg(vo);
		} else if(uploadCompleteImege.isEmpty()) {
			recipeService.recipeUpdate(vo);
		}
			
		// 과정 업로드
		String[] processList = request.getParameterValues("recipe_process");
		List<MultipartFile> processImg = multipart.getFiles("recipe_process_img_file");
		
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
				String processImegeName = fourteen_format.format(date_now) + uploadProcessImege.getOriginalFilename();
				uploadProcessImege.transferTo(new File("E:\\Swork\\sharecipe\\src\\main\\webapp\\resources\\img\\recipe-pro-img\\" + processImegeName));
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
		
		redirectAttributes.addAttribute("recipe_no", vo.getRecipe_no());
		return "redirect:/getRecipe.re";
	}
	
	// 장바구니 입력
	@RequestMapping(value="/basketInsert.re", method=RequestMethod.POST)
	public String insertBasket(RecipeVO vo, HttpServletRequest request, RedirectAttributes redirectAttributes) throws IllegalStateException, IOException {
		
		String[] checkList = request.getParameterValues("check");
		String[] member_idList = request.getParameterValues("member_id");
		String[] recipe_noList = request.getParameterValues("recipe_no");
		String[] ingredient_noList = request.getParameterValues("ingredient_no");
		String[] ingredient_nmList = request.getParameterValues("ingredient_nm");
		String[] ingredient_cntList = request.getParameterValues("ingredient_cnt");
		String[] ingredient_priceList = request.getParameterValues("ingredient_price");
		String[] ingredient_thumbNameList = request.getParameterValues("ingredient_thumbName");
		int[] ingredient_priceListInt = Arrays.stream(ingredient_priceList).mapToInt(Integer::parseInt).toArray();
		int[] ingredient_cntListInt = Arrays.stream(ingredient_cntList).mapToInt(Integer::parseInt).toArray();
		
		for (int i = 0; i < member_idList.length; i++) {	
			
			// 체크박스 거르기
			String check = checkList[i];
			if (check.equals("false")) {
				continue;
			}
			
			String member_id = member_idList[i];
			String recipe_no = recipe_noList[i];
			String ingredient_no = ingredient_noList[i];
			String ingredient_nm = ingredient_nmList[i];
			int ingredient_cnt = ingredient_cntListInt[i];
			int ingredient_price = ingredient_priceListInt[i];
			String ingredient_thumbName = ingredient_thumbNameList[i];
			
			vo.setMember_id(member_id);
			vo.setRecipe_no(recipe_no);
			vo.setIngredient_no(ingredient_no);
			vo.setIngredient_nm(ingredient_nm);
			vo.setIngredient_cnt(ingredient_cnt);
			vo.setIngredient_price(ingredient_price);
			vo.setIngredient_thumbName(ingredient_thumbName);
			
			recipeService.basketInsert(vo);
		}
		
		redirectAttributes.addAttribute("recipe_no", vo.getRecipe_no());
		
		if (vo.getWhere().equals("recipe")) {
			return "redirect:/getRecipe.re";
		} else {
			return "redirect:/cartList";
		}
	}
	
	// 인터셉터 태우기
	@RequestMapping(value= "/intercept",produces = "application/text; charset=utf8")
	public String orderForm(@RequestParam String recipe_no, RedirectAttributes redirectAttributes) {
		
		redirectAttributes.addAttribute("recipe_no", recipe_no);
		return "redirect:/getRecipe.re";
	}
	
}