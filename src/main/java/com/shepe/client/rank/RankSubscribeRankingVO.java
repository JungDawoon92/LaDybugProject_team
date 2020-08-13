package com.shepe.client.rank;

import java.sql.Date;

public class RankSubscribeRankingVO {

	private String member_id;
	private String member_nickname;
	private int member_sub_sum;
	private int rank_no;
	private Date rank_ymd;
	
	private int offset;
	private String member_img;

	
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

	public int getMember_sub_sum() {
		return member_sub_sum;
	}

	public void setMember_sub_sum(int member_sub_sum) {
		this.member_sub_sum = member_sub_sum;
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

	public String getMember_img() {
		return member_img;
	}

	public void setMember_img(String member_img) {
		this.member_img = member_img;
	}

	@Override
	public String toString() {
		return "RankSubscribeRankingVO [member_id=" + member_id + ", member_nickname=" + member_nickname
				+ ", member_sub_sum=" + member_sub_sum + ", rank_no=" + rank_no + ", rank_ymd=" + rank_ymd + ", offset="
				+ offset + ", member_img=" + member_img + "]";
	}
	
}
