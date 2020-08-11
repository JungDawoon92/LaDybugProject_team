package com.shepe.client.ingredient;

import java.sql.Date;
import java.util.Arrays;

import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

@Repository
public class IngredientVO {
	
	private String ingredient_no;
	private String ingredient_nm;
	Ingredient_Categ ingredient_categ;
	private int ingredient_price;
	private String ingredient_thumbName;
	private MultipartFile ingredient_thumbimg;
	private int ingredient_amt;
	private String ingredient_searchCondition;
	private String ingredient_searchKeyword;
	
	// 디테일 식재료 
	private int ingredient_codeNum;
	private String ingredient_country;
	private String ingredient_productimporter;
	private String ingredient_weight;
	private Date ingredient_mnfctDate;
	private String ingredient_life;
	private String ingredient_selLife;
	private String ingredient_foodType;
	private String ingredient_selFoodType;
	private String ingredient_storage;
	private String ingredient_selStorage;
	private String ingredient_pckmtr;
	private String ingredient_nutrient;
	private String ingredient_allergy;
	
	// 멀티 식재료
	private String ingredient_fileName;
	private MultipartFile[] ingredient_multi_img;

	// 페이징 처리
	private int offset;
	
	
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	public String getIngredient_searchCondition() {
		return ingredient_searchCondition;
	}
	public void setIngredient_searchCondition(String ingredient_searchCondition) {
		this.ingredient_searchCondition = ingredient_searchCondition;
	}
	public String getIngredient_searchKeyword() {
		return ingredient_searchKeyword;
	}
	public void setIngredient_searchKeyword(String ingredient_searchKeyword) {
		this.ingredient_searchKeyword = ingredient_searchKeyword;
	}
	public String getIngredient_fileName() {
		return ingredient_fileName;
	}
	public void setIngredient_fileName(String ingredient_fileName) {
		this.ingredient_fileName = ingredient_fileName;
	}
	public String getIngredient_thumbName() {
		return ingredient_thumbName;
	}
	public void setIngredient_thumbName(String ingredient_thumbName) {
		this.ingredient_thumbName = ingredient_thumbName;
	}	
	public MultipartFile getIngredient_thumbimg() {
		return ingredient_thumbimg;
	}
	public MultipartFile[] getIngredient_multi_img() {
		return ingredient_multi_img;
	}
	public void setIngredient_multi_img(MultipartFile[] ingredient_multi_img) {
		this.ingredient_multi_img = ingredient_multi_img;
	}
	public void setIngredient_thumbimg(MultipartFile ingredient_thumbimg) {
		this.ingredient_thumbimg = ingredient_thumbimg;
	}
	public String getIngredient_selLife() {
		return ingredient_selLife;
	}
	public void setIngredient_selLife(String ingredient_selLife) {
		this.ingredient_selLife = ingredient_selLife;
	}
	public String getIngredient_selFoodType() {
		return ingredient_selFoodType;
	}
	public void setIngredient_selFoodType(String ingredient_selFoodType) {
		this.ingredient_selFoodType = ingredient_selFoodType;
	}
	public String getIngredient_selStorage() {
		return ingredient_selStorage;
	}
	public void setIngredient_selStorage(String ingredient_selStorage) {
		this.ingredient_selStorage = ingredient_selStorage;
	}
	public Ingredient_Categ getIngredient_categ() {
		return ingredient_categ;
	}
	public void setIngredient_categ(Ingredient_Categ ingredient_categ) {
		this.ingredient_categ = ingredient_categ;
	}
	public String getIngredient_no() {
		return ingredient_no;
	}
	public void setIngredient_no(String ingredient_no) {
		this.ingredient_no = ingredient_no;
	}
	public String getIngredient_nm() {
		return ingredient_nm;
	}
	public void setIngredient_nm(String ingredient_nm) {
		this.ingredient_nm = ingredient_nm;
	}
	
	
//	public String getIngredient_price() {
//		return ingredient_price;
//	}
//	public void setIngredient_price(String ingredient_price) {
//		this.ingredient_price = ingredient_price;
//	}
	
	
//	public int getIngredient_weight() {
//		return ingredient_weight;
//	}
//	public void setIngredient_weight(int ingredient_weight) {
//		this.ingredient_weight = ingredient_weight;
//	}
	public String getIngredient_weight() {
		return ingredient_weight;
	}
	public int getIngredient_price() {
		return ingredient_price;
	}
	public void setIngredient_price(int ingredient_price) {
		this.ingredient_price = ingredient_price;
	}
	public void setIngredient_weight(String ingredient_weight) {
		this.ingredient_weight = ingredient_weight;
	}
	
	
	public int getIngredient_amt() {
		return ingredient_amt;
	}
	public void setIngredient_amt(int ingredient_amt) {
		this.ingredient_amt = ingredient_amt;
	}
	public int getIngredient_codeNum() {
		return ingredient_codeNum;
	}
	public void setIngredient_codeNum(int ingredient_codeNum) {
		this.ingredient_codeNum = ingredient_codeNum;
	}
	public String getIngredient_country() {
		return ingredient_country;
	}
	public void setIngredient_country(String ingredient_country) {
		this.ingredient_country = ingredient_country;
	}
	public String getIngredient_productimporter() {
		return ingredient_productimporter;
	}
	public void setIngredient_productimporter(String ingredient_productimporter) {
		this.ingredient_productimporter = ingredient_productimporter;
	}

	public Date getIngredient_mnfctDate() {
		return ingredient_mnfctDate;
	}
	public void setIngredient_mnfctDate(Date ingredient_mnfctDate) {
		this.ingredient_mnfctDate = ingredient_mnfctDate;
	}
	public String getIngredient_life() {
		return ingredient_life;
	}
	public void setIngredient_life(String ingredient_life) {
		this.ingredient_life = ingredient_life;
	}
	public String getIngredient_foodType() {
		return ingredient_foodType;
	}
	public void setIngredient_foodType(String ingredient_foodType) {
		this.ingredient_foodType = ingredient_foodType;
	}
	public String getIngredient_storage() {
		return ingredient_storage;
	}
	public void setIngredient_storage(String ingredient_storage) {
		this.ingredient_storage = ingredient_storage;
	}
	public String getIngredient_pckmtr() {
		return ingredient_pckmtr;
	}
	public void setIngredient_pckmtr(String ingredient_pckmtr) {
		this.ingredient_pckmtr = ingredient_pckmtr;
	}
	public String getIngredient_nutrient() {
		return ingredient_nutrient;
	}
	public void setIngredient_nutrient(String ingredient_nutrient) {
		this.ingredient_nutrient = ingredient_nutrient;
	}
	public String getIngredient_allergy() {
		return ingredient_allergy;
	}
	public void setIngredient_allergy(String ingredient_allergy) {
		this.ingredient_allergy = ingredient_allergy;
	}
	@Override
	public String toString() {
		return "IngredientVO [ingredient_no=" + ingredient_no + ", ingredient_nm=" + ingredient_nm
				+ ", ingredient_categ=" + ingredient_categ + ", ingredient_price=" + ingredient_price
				+ ", ingredient_thumbName=" + ingredient_thumbName + ", ingredient_thumbimg=" + ingredient_thumbimg
				+ ", ingredient_amt=" + ingredient_amt + ", ingredient_selLife=" + ingredient_selLife
				+ ", ingredient_foodType=" + ingredient_foodType + ", ingredient_selFoodType=" + ingredient_selFoodType
				+ ", ingredient_storage=" + ingredient_storage + ", ingredient_selStorage=" + ingredient_selStorage
				+ ", ingredient_pckmtr=" + ingredient_pckmtr + ", ingredient_nutrient=" + ingredient_nutrient
				+ ", ingredient_allergy=" + ingredient_allergy + ", ingredient_fileName=" + ingredient_fileName
				+ ", ingredient_multi_img=" + Arrays.toString(ingredient_multi_img) + "]";
	}
	
	
	
	
}
