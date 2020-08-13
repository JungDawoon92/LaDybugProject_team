package com.shepe.client.rank;

public class RankSubscribeVO {

	private String member_id;
	private String member_sub_id;
	private String member_nickname;
	
	
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
	@Override
	public String toString() {
		return "RankSubscribeVO [member_id=" + member_id + ", member_sub_id=" + member_sub_id + ", member_nickname="
				+ member_nickname + "]";
	}
	
}
