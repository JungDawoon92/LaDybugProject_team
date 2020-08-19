package com.shepe.admin.rank;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class RankLikeRankingAdminVO {

	private int recipe_sq;
	private String recipe_no;
	private String recipe_nm;
	private int recipe_like_sum;
	private int rank_no;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date rank_ymd;
	
	private int offset;
	private String recipe_complete_img;
	
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date recipe_ymd;
	private String member_id;

	
	
	public int getRecipe_sq() {
		return recipe_sq;
	}

	public void setRecipe_sq(int recipe_sq) {
		this.recipe_sq = recipe_sq;
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

	public int getRecipe_like_sum() {
		return recipe_like_sum;
	}

	public void setRecipe_like_sum(int recipe_like_sum) {
		this.recipe_like_sum = recipe_like_sum;
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

	public Date getRecipe_ymd() {
		return recipe_ymd;
	}

	public void setRecipe_ymd(Date recipe_ymd) {
		this.recipe_ymd = recipe_ymd;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	@Override
	public String toString() {
		return "RankLikeRankingAdminVO [recipe_no=" + recipe_no + ", recipe_nm=" + recipe_nm + ", recipe_like_sum="
				+ recipe_like_sum + ", rank_no=" + rank_no + ", rank_ymd=" + rank_ymd + ", offset=" + offset
				+ ", recipe_complete_img=" + recipe_complete_img + ", recipe_ymd=" + recipe_ymd + ", member_id="
				+ member_id + "]";
	}
	
	
}
