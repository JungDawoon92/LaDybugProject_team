package com.shepe.admin.rank;

import java.sql.Date;

public class RankSellRecipeRankingAdminVO {

	private String recipe_no;
	private String recipe_nm;
	private int recipe_sell_sum;
	private int rank_no;
	private Date rank_ymd;
	
	private int offset;
	private String recipe_complete_img;
	private Date order_ymd;
	
	/* 차트관련 */
	private String AGES;
	private int member_count;
	
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
	public int getRecipe_sell_sum() {
		return recipe_sell_sum;
	}
	public void setRecipe_sell_sum(int recipe_sell_sum) {
		this.recipe_sell_sum = recipe_sell_sum;
	}
	public int getRank_no() {
		return rank_no;
	}
	public void setRank_no(int rank_no) {
		this.rank_no = rank_no;
	}
	public Date getRank_ymd() {
		return rank_ymd;
	}
	public void setRank_ymd(Date rank_ymd) {
		this.rank_ymd = rank_ymd;
	}
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	public String getRecipe_complete_img() {
		return recipe_complete_img;
	}
	public void setRecipe_complete_img(String recipe_complete_img) {
		this.recipe_complete_img = recipe_complete_img;
	}
	public Date getOrder_ymd() {
		return order_ymd;
	}
	public void setOrder_ymd(Date order_ymd) {
		this.order_ymd = order_ymd;
	}
	public String getAGES() {
		return AGES;
	}
	public void setAGES(String aGES) {
		AGES = aGES;
	}
	public int getMember_count() {
		return member_count;
	}
	public void setMember_count(int member_count) {
		this.member_count = member_count;
	}
	@Override
	public String toString() {
		return "RankSellRecipeRankingAdminVO [recipe_no=" + recipe_no + ", recipe_nm=" + recipe_nm
				+ ", recipe_sell_sum=" + recipe_sell_sum + ", rank_no=" + rank_no + ", rank_ymd=" + rank_ymd
				+ ", offset=" + offset + ", recipe_complete_img=" + recipe_complete_img + ", order_ymd=" + order_ymd
				+ ", AGES=" + AGES + ", member_count=" + member_count + "]";
	}
	
}
