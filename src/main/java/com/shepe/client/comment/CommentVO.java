package com.shepe.client.comment;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CommentVO {

	private String member_id;
	private String member_nickname;
	private	String recipe_no;
	private int comment_sq;
	private String comment_content;
	@JsonFormat(pattern="yyyy-MM-dd aa hh:mm")
	private Date comment_ymd;
	
	private MultipartFile coUploadFile;
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
	public String getRecipe_no() {
		return recipe_no;
	}
	public void setRecipe_no(String recipe_no) {
		this.recipe_no = recipe_no;
	}
	public int getComment_sq() {
		return comment_sq;
	}
	public void setComment_sq(int comment_sq) {
		this.comment_sq = comment_sq;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public Date getComment_ymd() {
		return comment_ymd;
	}
	public void setComment_ymd(Date comment_ymd) {
		this.comment_ymd = comment_ymd;
	}
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	public MultipartFile getCoUploadFile() {
		return coUploadFile;
	}
	public void setCoUploadFile(MultipartFile coUploadFile) {
		this.coUploadFile = coUploadFile;
	}
	public String getMember_img() {
		return member_img;
	}
	public void setMember_img(String member_img) {
		this.member_img = member_img;
	}
	@Override
	public String toString() {
		return "CommentVO [member_id=" + member_id + ", member_nickname=" + member_nickname + ", recipe_no=" + recipe_no
				+ ", comment_sq=" + comment_sq + ", comment_content=" + comment_content + ", comment_ymd=" + comment_ymd
				+ ", coUploadFile=" + coUploadFile + ", offset=" + offset + ", member_img=" + member_img + "]";
	}
	
}
