package com.shepe.client.comment;

import java.util.Date;

public class RecipeVO {

	private String member_id;
	private String member_nickname;
	private String recipe_no;
	private String recipe_nm;
	private String recipe_info;
	private Date recipe_ymd;
	private String recipe_complete_img;
	private String recipe_category_kind;
	private String recipe_category_ing;
	private String recipe_category_how;
	private int recipe_cnt;
	
	private int offset;
	
	
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
	public String getRecipe_info() {
		return recipe_info;
	}
	public void setRecipe_info(String recipe_info) {
		this.recipe_info = recipe_info;
	}
	public Date getRecipe_ymd() {
		return recipe_ymd;
	}
	public void setRecipe_ymd(Date recipe_ymd) {
		this.recipe_ymd = recipe_ymd;
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
	public int getRecipe_cnt() {
		return recipe_cnt;
	}
	public void setRecipe_cnt(int recipe_cnt) {
		this.recipe_cnt = recipe_cnt;
	}
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}

}
