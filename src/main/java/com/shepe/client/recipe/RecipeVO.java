package com.shepe.client.recipe;

import org.springframework.web.multipart.MultipartFile;

public class RecipeVO {
	private String member_id;
	private String member_nickname;
	private String recipe_no;
	private String recipe_nm;
	private String recipe_info;
	private String recipe_ymd;
	private String recipe_complete_img;
	private String recipe_category_kind;
	private String recipe_category_ing;
	private String recipe_category_how;
	private int recipe_cnt;
	private int recipe_person;
	
	private String recipe_process;
	private String recipe_process_img;
	private long recipe_process_sq;
	
	private String ingredient_nm;
	private String recipeingre_cnt;
	private long recipeingre_sq;

	private MultipartFile recipe_complete_img_file;
	private MultipartFile recipe_process_img_file;
	
	private String ingredient_no;
	private int ingredient_price;
	private String ingredient_thumbName;
	private int ingredient_amt;
	private String ingredient_weight;
	private int ingredient_cnt;
	
	private int category_cnt;
	private int categoryIng_cnt;
	private int categoryHow_cnt;
	
	public int getCategoryHow_cnt() {
		return categoryHow_cnt;
	}
	public void setCategoryHow_cnt(int categoryHow_cnt) {
		this.categoryHow_cnt = categoryHow_cnt;
	}
	public int getCategoryIng_cnt() {
		return categoryIng_cnt;
	}
	public void setCategoryIng_cnt(int categoryIng_cnt) {
		this.categoryIng_cnt = categoryIng_cnt;
	}
	public int getCategory_cnt() {
		return category_cnt;
	}
	public void setCategory_cnt(int category_cnt) {
		this.category_cnt = category_cnt;
	}
	public String getRecipe_ymd() {
		return recipe_ymd;
	}
	public void setRecipe_ymd(String recipe_ymd) {
		this.recipe_ymd = recipe_ymd;
	}
	public int getRecipe_person() {
		return recipe_person;
	}
	public void setRecipe_person(int recipe_person) {
		this.recipe_person = recipe_person;
	}
	public int getIngredient_cnt() {
		return ingredient_cnt;
	}
	public void setIngredient_cnt(int ingredient_cnt) {
		this.ingredient_cnt = ingredient_cnt;
	}
	public String getIngredient_weight() {
		return ingredient_weight;
	}
	public void setIngredient_weight(String ingredient_weight) {
		this.ingredient_weight = ingredient_weight;
	}
	private String where;
	private String check;

	
	public String getCheck() {
		return check;
	}
	public void setCheck(String check) {
		this.check = check;
	}
	public String getWhere() {
		return where;
	}
	public void setWhere(String where) {
		this.where = where;
	}
	public String getIngredient_no() {
		return ingredient_no;
	}
	public void setIngredient_no(String ingredient_no) {
		this.ingredient_no = ingredient_no;
	}
	public int getIngredient_price() {
		return ingredient_price;
	}
	public void setIngredient_price(int ingredient_price) {
		this.ingredient_price = ingredient_price;
	}
	public String getIngredient_thumbName() {
		return ingredient_thumbName;
	}
	public void setIngredient_thumbName(String ingredient_thumbName) {
		this.ingredient_thumbName = ingredient_thumbName;
	}
	public int getIngredient_amt() {
		return ingredient_amt;
	}
	public void setIngredient_amt(int ingredient_amt) {
		this.ingredient_amt = ingredient_amt;
	}
	public long getRecipeingre_sq() {
		return recipeingre_sq;
	}
	public long getRecipe_process_sq() {
		return recipe_process_sq;
	}
	public void setRecipe_process_sq(long recipe_process_sq) {
		this.recipe_process_sq = recipe_process_sq;
	}
	public void setRecipeingre_sq(long recipeingre_sq) {
		this.recipeingre_sq = recipeingre_sq;
	}
	public int getRecipe_cnt() {
		return recipe_cnt;
	}
	public void setRecipe_cnt(int recipe_cnt) {
		this.recipe_cnt = recipe_cnt;
	}
	public String getRecipe_no() {
		return recipe_no;
	}
	public void setRecipe_no(String recipe_no) {
		this.recipe_no = recipe_no;
	}
	public String getIngredient_nm() {
		return ingredient_nm;
	}
	public void setIngredient_nm(String ingredient_nm) {
		this.ingredient_nm = ingredient_nm;
	}
	public String getRecipeingre_cnt() {
		return recipeingre_cnt;
	}
	public void setRecipeingre_cnt(String recipeingre_cnt) {
		this.recipeingre_cnt = recipeingre_cnt;
	}
	public String getRecipe_process_img() {
		return recipe_process_img;
	}
	public void setRecipe_process_img(String recipe_process_img) {
		this.recipe_process_img = recipe_process_img;
	}
	public MultipartFile getRecipe_process_img_file() {
		return recipe_process_img_file;
	}
	public void setRecipe_process_img_file(MultipartFile recipe_process_img_file) {
		this.recipe_process_img_file = recipe_process_img_file;
	}
	public String getRecipe_process() {
		return recipe_process;
	}
	public void setRecipe_process(String recipe_process) {
		this.recipe_process = recipe_process;
	}
	public MultipartFile getRecipe_complete_img_file() {
		return recipe_complete_img_file;
	}
	public void setRecipe_complete_img_file(MultipartFile recipe_complete_img_file) {
		this.recipe_complete_img_file = recipe_complete_img_file;
	}
	public String getRecipe_info() {
		return recipe_info;
	}
	public void setRecipe_info(String recipe_info) {
		this.recipe_info = recipe_info;
	}
	public String getRecipe_complete_img() {
		return recipe_complete_img;
	}
	public void setRecipe_complete_img(String recipe_complete_img) {
		this.recipe_complete_img = recipe_complete_img;
	}
	public String getRecipe_category_kind() {
		return recipe_category_kind;
	}
	public void setRecipe_category_kind(String recipe_category_kind) {
		this.recipe_category_kind = recipe_category_kind;
	}
	public String getRecipe_category_ing() {
		return recipe_category_ing;
	}
	public void setRecipe_category_ing(String recipe_category_ing) {
		this.recipe_category_ing = recipe_category_ing;
	}
	public String getRecipe_category_how() {
		return recipe_category_how;
	}
	public void setRecipe_category_how(String recipe_category_how) {
		this.recipe_category_how = recipe_category_how;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_nickname() {
		return member_nickname;
	}
	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
	public String getRecipe_nm() {
		return recipe_nm;
	}
	public void setRecipe_nm(String recipe_nm) {
		this.recipe_nm = recipe_nm;
	}

}
