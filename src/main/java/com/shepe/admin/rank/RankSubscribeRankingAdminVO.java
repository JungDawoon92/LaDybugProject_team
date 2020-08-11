package com.shepe.admin.rank;

import java.sql.Date;

public class RankSubscribeRankingAdminVO {

	private String member_id;
	private String member_nickname;
	private int member_sub_sum;
	private int rank_no;
	private Date rank_ymd;
	
	private int offset;
	private String member_img;
	
	private int member_sq;
	private Date member_join;
	
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

	public int getMember_sq() {
		return member_sq;
	}

	public void setMember_sq(int member_sq) {
		this.member_sq = member_sq;
	}

	public Date getMember_join() {
		return member_join;
	}

	public void setMember_join(Date member_join) {
		this.member_join = member_join;
	}

	@Override
	public String toString() {
		return "RankSubscribeRankingAdminVO [member_id=" + member_id + ", member_nickname=" + member_nickname
				+ ", member_sub_sum=" + member_sub_sum + ", rank_no=" + rank_no + ", rank_ymd=" + rank_ymd + ", offset="
				+ offset + ", member_img=" + member_img + ", member_sq=" + member_sq + ", member_join=" + member_join
				+ "]";
	}
	
}
