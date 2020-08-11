package com.shepe.admin.notice;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class NoticeVO {
	
	private int notice_sq;
	private String notice_category;
	private String notice_nm;
	private String notice_contents;
	private String member_id;
	private String notice_img;
	private Date notice_ymd;
	private int notice_rc;
	private int notice_mtype;
	private MultipartFile uploadFile;
	
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getNotice_img() {
		return notice_img;
	}
	public void setNotice_img(String notice_img) {
		this.notice_img = notice_img;
	}
	public int getNotice_sq() {
		return notice_sq;
	}
	public void setNotice_sq(int notice_sq) {
		this.notice_sq = notice_sq;
	}
	public String getNotice_category() {
		return notice_category;
	}
	public void setNotice_category(String notice_category) {
		this.notice_category = notice_category;
	}
	public String getNotice_nm() {
		return notice_nm;
	}
	public void setNotice_nm(String notice_nm) {
		this.notice_nm = notice_nm;
	}
	public String getNotice_contents() {
		return notice_contents;
	}
	public void setNotice_contents(String notice_contents) {
		this.notice_contents = notice_contents;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public Date getNotice_ymd() {
		return notice_ymd;
	}
	public void setNotice_ymd(Date notice_ymd) {
		this.notice_ymd = notice_ymd;
	}
	public int getNotice_rc() {
		return notice_rc;
	}
	public void setNotice_rc(int notice_rc) {
		this.notice_rc = notice_rc;
	}
	public int getNotice_mtype() {
		return notice_mtype;
	}
	public void setNotice_mtype(int notice_mtype) {
		this.notice_mtype = notice_mtype;
	}
	@Override
	public String toString() {
		return "NoticeVO [notice_sq=" + notice_sq + ", notice_category=" + notice_category + ", notice_nm=" + notice_nm
				+ ", notice_contents=" + notice_contents + ", member_id=" + member_id + ", notice_img=" + notice_img
				+ ", notice_ymd=" + notice_ymd + ", notice_rc=" + notice_rc + ", notice_mtype=" + notice_mtype
				+ ", uploadFile=" + uploadFile + "]";
	}
}
