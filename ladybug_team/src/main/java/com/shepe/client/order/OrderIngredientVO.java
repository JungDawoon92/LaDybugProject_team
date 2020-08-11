package com.shepe.client.order;

public class OrderIngredientVO {
	private String order_no;
	private String ingredient_no;
	private String ingredient_nm;
	private int ingredient_cnt;
	private int ingredient_price;
	private String ingredient_thumbName;
	private String recipe_no;
	private String recipe_nm;
	
	public String getOrder_no() {
		return order_no;
	}
	public void setOrder_no(String order_no) {
		this.order_no = order_no;
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
	public int getIngredient_cnt() {
		return ingredient_cnt;
	}
	public void setIngredient_cnt(int ingredient_cnt) {
		this.ingredient_cnt = ingredient_cnt;
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
	public String getRecipe_no() {
		return recipe_no;
	}
	public void setRecipe_no(String recipe_no) {
		this.recipe_no = recipe_no;
	}
	public String getRecipe_nm() {
		return recipe_nm;
	}
	public void setRecipe_nm(String recipe_nm) {
		this.recipe_nm = recipe_nm;
	}
	@Override
	public String toString() {
		return "OrderIngredientVO [order_no=" + order_no + ", ingredient_no=" + ingredient_no + ", ingredient_nm="
				+ ingredient_nm + ", ingredient_cnt=" + ingredient_cnt + ", ingredient_price=" + ingredient_price
				+ ", ingredient_thumbName=" + ingredient_thumbName + ", recipe_no=" + recipe_no + ", recipe_nm="
				+ recipe_nm + "]";
	}
}
