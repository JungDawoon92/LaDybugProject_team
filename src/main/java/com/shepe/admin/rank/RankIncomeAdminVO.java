package com.shepe.admin.rank;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class RankIncomeAdminVO {

	
	private int offset;
	private String searchCondition;
	private String searchKeyWord;
	
	/* 월별 총 매출액 */
	private String month;
	private int income_sum;
	
	/* 월별 매출액 Top 레시피 */
	private String recipe_nm;
	private String recipe_no;
	private int recipe_income;
	
	/* 월별 매출액 Top 식재료 */
	private String ingredient_nm;
	private String ingredient_no;
	private int ingredient_income;
	
	/* 월별 매출액 TOP 회원 */
	private String member_id;
	private int member_sq;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date member_join;
	
	/* 매출액 상세피이지 */
	private String order_no;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date order_ymd;
	private int order_sum;
	private String paytype;
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyWord() {
		return searchKeyWord;
	}
	public void setSearchKeyWord(String searchKeyWord) {
		this.searchKeyWord = searchKeyWord;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public int getIncome_sum() {
		return income_sum;
	}
	public void setIncome_sum(int income_sum) {
		this.income_sum = income_sum;
	}
	public String getRecipe_nm() {
		return recipe_nm;
	}
	public void setRecipe_nm(String recipe_nm) {
		this.recipe_nm = recipe_nm;
	}
	public String getRecipe_no() {
		return recipe_no;
	}
	public void setRecipe_no(String recipe_no) {
		this.recipe_no = recipe_no;
	}
	public int getRecipe_income() {
		return recipe_income;
	}
	public void setRecipe_income(int recipe_income) {
		this.recipe_income = recipe_income;
	}
	public String getIngredient_nm() {
		return ingredient_nm;
	}
	public void setIngredient_nm(String ingredient_nm) {
		this.ingredient_nm = ingredient_nm;
	}
	public String getIngredient_no() {
		return ingredient_no;
	}
	public void setIngredient_no(String ingredient_no) {
		this.ingredient_no = ingredient_no;
	}
	public int getIngredient_income() {
		return ingredient_income;
	}
	public void setIngredient_income(int ingredient_income) {
		this.ingredient_income = ingredient_income;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getMember_sq() {
		return member_sq;
	}
	public void setMember_sq(int member_sq) {
		this.member_sq = member_sq;
	}
	public Date getMember_join() {
		return member_join;
	}
	public void setMember_join(Date member_join) {
		this.member_join = member_join;
	}
	public String getOrder_no() {
		return order_no;
	}
	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}
	public Date getOrder_ymd() {
		return order_ymd;
	}
	public void setOrder_ymd(Date order_ymd) {
		this.order_ymd = order_ymd;
	}
	public int getOrder_sum() {
		return order_sum;
	}
	public void setOrder_sum(int order_sum) {
		this.order_sum = order_sum;
	}
	public String getPaytype() {
		return paytype;
	}
	public void setPaytype(String paytype) {
		this.paytype = paytype;
	}
	
	
}
