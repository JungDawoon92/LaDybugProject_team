package com.shepe.admin.rank;

public class RankLikeAdminVO {

	private String recipe_no;
	private String member_like_id;
	private String member_nickname;
	
	/* 차트관련 */
	private String AGES;
	private int member_count;
	
	public String getRecipe_no() {
		return recipe_no;
	}
	public void setRecipe_no(String recipe_no) {
		this.recipe_no = recipe_no;
	}
	public String getMember_like_id() {
		return member_like_id;
	}
	public void setMember_like_id(String member_like_id) {
		this.member_like_id = member_like_id;
	}
	public String getMember_nickname() {
		return member_nickname;
	}
	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
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
	
}
