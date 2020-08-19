package com.shepe.client.member;

import java.sql.Date;


public class MemberVO {
	private int member_sq;
	private String member_nm;
	private String member_id;
	private String member_password;
	private String member_nickname;
	private String member_phone;
	private Date member_birth;
	private String member_email;
	private String member_email_domain;	
	private char member_verify;
	private char del_update;
	private String member_delDate;
	private Date member_join;
	private int failure_cnt;
	private char accountLock;
	private String member_img;
	private Date changePWD_date;
	private char isChangePWD;
	private int dayByMemberCnt;
	private Date login_member_date;
	private int login_member_cnt;
	private int age_10;
	private int age_20;
	private int age_30;
	private int age_40;
	private int age_50;
	private int age_60;
//	@XmlTransient
//	private String searchCondition;
//	@XmlTransient
//	private String searchKeyword;
	
	public int getMember_sq() {
		return member_sq;
	}
	public void setMember_sq(int member_sq) {
		this.member_sq = member_sq;
	}
	public String getMember_nm() {
		return member_nm;
	}
	public void setMember_nm(String member_nm) {
		this.member_nm = member_nm;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_password() {
		return member_password;
	}
	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}
	public String getMember_nickname() {
		return member_nickname;
	}
	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public Date getMember_birth() {
		return member_birth;
	}
	public void setMember_birth(Date member_birth) {
		this.member_birth = member_birth;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_email_domain() {
		return member_email_domain;
	}
	public void setMember_email_domain(String member_email_domain) {
		this.member_email_domain = member_email_domain;
	}
	public char getMember_verify() {
		return member_verify;
	}
	public void setMember_verify(char member_verify) {
		this.member_verify = member_verify;
	}
	public char getDel_update() {
		return del_update;
	}
	public void setDel_update(char del_update) {
		this.del_update = del_update;
	}	
	public String getMember_delDate() {
		return member_delDate;
	}
	public void setMember_delDate(String delTime) {
		this.member_delDate = delTime;
	}	
	public Date getMember_join() {
		return member_join;
	}
	public void setMember_join(Date member_join) {
		this.member_join = member_join;
	}	
	public String getMember_img() {
		return member_img;
	}
	public void setMember_img(String member_img) {
		this.member_img = member_img;
	}	
	public int getFailure_cnt() {
		return failure_cnt;
	}
	public void setFailure_cnt(int failure_cnt) {
		this.failure_cnt = failure_cnt;
	}
	public char getAccountLock() {
		return accountLock;
	}
	public void setAccountLock(char accountLock) {
		this.accountLock = accountLock;
	}	
	public Date getChangePWD_date() {
		return changePWD_date;
	}
	public void setChangePWD_date(Date changePWD_date) {
		this.changePWD_date = changePWD_date;
	}	
	public char getIsChangePWD() {
		return isChangePWD;
	}
	public void setIsChangePWD(char isChangePWD) {
		this.isChangePWD = isChangePWD;
	}	
	public int getDayByMemberCnt() {
		return dayByMemberCnt;
	}
	public void setDayByMemberCnt(int dayByMemberCnt) {
		this.dayByMemberCnt = dayByMemberCnt;
	}	
	public int getAge_10() {
		return age_10;
	}
	public void setAge_10(int age_10) {
		this.age_10 = age_10;
	}
	public int getAge_20() {
		return age_20;
	}
	public void setAge_20(int age_20) {
		this.age_20 = age_20;
	}
	public int getAge_30() {
		return age_30;
	}
	public void setAge_30(int age_30) {
		this.age_30 = age_30;
	}
	public int getAge_40() {
		return age_40;
	}
	public void setAge_40(int age_40) {
		this.age_40 = age_40;
	}
	public int getAge_50() {
		return age_50;
	}
	public void setAge_50(int age_50) {
		this.age_50 = age_50;
	}
	public int getAge_60() {
		return age_60;
	}
	public void setAge_60(int age_60) {
		this.age_60 = age_60;
	}	
	public int getLogin_member_cnt() {
		return login_member_cnt;
	}
	public void setLogin_member_cnt(int login_member_cnt) {
		this.login_member_cnt = login_member_cnt;
	}	
	public Date getLogin_member_date() {
		return login_member_date;
	}
	public void setLogin_member_date(Date login_member_date) {
		this.login_member_date = login_member_date;
	}
	
	@Override
	public String toString() {
		return "MemberVO [member_sq=" + member_sq + ", member_nm=" + member_nm + ", member_id=" + member_id
				+ ", member_password=" + member_password + ", member_nickname=" + member_nickname + ", member_phone="
				+ member_phone + ", member_birth=" + member_birth + ", member_email=" + member_email
				+ ", member_email_domain=" + member_email_domain + ", member_verify=" + member_verify + ", del_update="
				+ del_update + ", member_delDate=" + member_delDate + ", member_join=" + member_join + ", failure_cnt="
				+ failure_cnt + ", accountLock=" + accountLock + ", member_img=" + member_img + ", changePWD_date="
				+ changePWD_date + ", isChangePWD=" + isChangePWD + ", dayByMemberCnt=" + dayByMemberCnt
				+ ", login_member_date=" + login_member_date + ", login_member_cnt=" + login_member_cnt + ", age_10=" + age_10
				+ ", age_20=" + age_20 + ", age_30=" + age_30 + ", age_40=" + age_40 + ", age_50=" + age_50
				+ ", age_60=" + age_60 + "]";
	}	
	
}