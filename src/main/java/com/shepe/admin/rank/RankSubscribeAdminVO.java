package com.shepe.admin.rank;

public class RankSubscribeAdminVO {

	private String member_id;
	private String member_sub_id;
	private String member_nickname;
	
	/* detail chart 용 */
	private String recipe_category_kind;
	private int cate_count;
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_sub_id() {
		return member_sub_id;
	}
	public void setMember_sub_id(String member_sub_id) {
		this.member_sub_id = member_sub_id;
	}
	public String getMember_nickname() {
		return member_nickname;
	}
	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
	public String getRecipe_category_kind() {
		return recipe_category_kind;
	}
	public void setRecipe_category_kind(String recipe_category_kind) {
		this.recipe_category_kind = recipe_category_kind;
	}
	public int getCate_count() {
		return cate_count;
	}
	public void setCate_count(int cate_count) {
		this.cate_count = cate_count;
	}
	
	
}
