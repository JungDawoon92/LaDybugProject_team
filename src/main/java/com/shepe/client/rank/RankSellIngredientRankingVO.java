package com.shepe.client.rank;

import java.sql.Date;

public class RankSellIngredientRankingVO {

	private String ingredient_no;
	private String ingredient_nm;
	private int ingredient_sell_sum;
	private int rank_no;
	private Date rank_ymd;
	
	private int offset;
	private String ingredient_thumbName;
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
	public int getIngredient_sell_sum() {
		return ingredient_sell_sum;
	}
	public void setIngredient_sell_sum(int ingredient_sell_sum) {
		this.ingredient_sell_sum = ingredient_sell_sum;
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
	public String getIngredient_thumbName() {
		return ingredient_thumbName;
	}
	public void setIngredient_thumbName(String ingredient_thumbName) {
		this.ingredient_thumbName = ingredient_thumbName;
	}
	@Override
	public String toString() {
		return "RankSellIngredientRankingVO [ingredient_no=" + ingredient_no + ", ingredient_nm=" + ingredient_nm
				+ ", ingredient_sell_sum=" + ingredient_sell_sum + ", rank_no=" + rank_no + ", rank_ymd=" + rank_ymd
				+ ", offset=" + offset + ", ingredient_thumbName=" + ingredient_thumbName + "]";
	}
	
	
}
