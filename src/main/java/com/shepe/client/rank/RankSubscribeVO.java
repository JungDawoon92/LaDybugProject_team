package com.shepe.client.rank;

import java.sql.Date;

public class RankSubscribeVO {

	private String member_id;
	private String member_sub_id;
	private String member_nickname;
	private Date rank_ymd;
	private int push_check;
	
	
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
	public Date getRank_ymd() {
		return rank_ymd;
	}
	public void setRank_ymd(Date rank_ymd) {
		this.rank_ymd = rank_ymd;
	}
	public int getPush_check() {
		return push_check;
	}
	public void setPush_check(int push_check) {
		this.push_check = push_check;
	}
	
}
