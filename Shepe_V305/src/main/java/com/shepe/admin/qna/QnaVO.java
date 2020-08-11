package com.shepe.admin.qna;

import java.sql.Date;

public class QnaVO {
	
	private int qna_sq;
	private String qna_nm;
	private String member_id;
	private String qna_contents;
	private int qna_rc;
	private Date qna_ymd;
	
	public int getQna_sq() {
		return qna_sq;
	}
	public void setQna_sq(int qna_sq) {
		this.qna_sq = qna_sq;
	}
	public String getQna_nm() {
		return qna_nm;
	}
	public void setQna_nm(String qna_nm) {
		this.qna_nm = qna_nm;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getQna_contents() {
		return qna_contents;
	}
	public void setQna_contents(String qna_contents) {
		this.qna_contents = qna_contents;
	}
	public int getQna_rc() {
		return qna_rc;
	}
	public void setQna_rc(int qna_rc) {
		this.qna_rc = qna_rc;
	}
	public Date getQna_ymd() {
		return qna_ymd;
	}
	public void setQna_ymd(Date qna_ymd) {
		this.qna_ymd = qna_ymd;
	}
	@Override
	public String toString() {
		return "QnaVO [qna_sq=" + qna_sq + ", qna_nm=" + qna_nm + ", member_id=" + member_id + ", qna_contents="
				+ qna_contents + ", qna_rc=" + qna_rc + ", qna_ymd=" + qna_ymd + ", getQna_sq()=" + getQna_sq()
				+ ", getQna_nm()=" + getQna_nm() + ", getMember_id()=" + getMember_id() + ", getQna_contents()="
				+ getQna_contents() + ", getQna_rc()=" + getQna_rc() + ", getQna_ymd()=" + getQna_ymd()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
}
