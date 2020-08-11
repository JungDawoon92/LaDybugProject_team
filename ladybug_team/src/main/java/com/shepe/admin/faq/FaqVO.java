package com.shepe.admin.faq;


public class FaqVO {
	
	private int faq_sq;
	private String faq_category;
	private String faq_nm;
	private String member_id;
	private String faq_contents;
	private String faq_mtype;
	
	
	public String getFaq_nm() {
		return faq_nm;
	}
	public void setFaq_nm(String faq_nm) {
		this.faq_nm = faq_nm;
	}
	public int getFaq_sq() {
		return faq_sq;
	}
	public void setFaq_sq(int faq_sq) {
		this.faq_sq = faq_sq;
	}
	public String getFaq_category() {
		return faq_category;
	}
	public void setFaq_category(String faq_category) {
		this.faq_category = faq_category;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getFaq_contents() {
		return faq_contents;
	}
	public void setFaq_contents(String faq_contents) {
		this.faq_contents = faq_contents;
	}
	public String getFaq_mtype() {
		return faq_mtype;
	}
	public void setFaq_mtype(String faq_mtype) {
		this.faq_mtype = faq_mtype;
	}
	
	@Override
	public String toString() {
		return "FaqVO [faq_sq=" + faq_sq + ", faq_category=" + faq_category + ", member_id=" + member_id
				+ ", faq_contents=" + faq_contents + ", faq_mtype=" + faq_mtype + "]";
	}
}
