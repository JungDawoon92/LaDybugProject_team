package com.shepe.pay.kakao;

import java.util.Date;

public class KakaoPayReadyVO {
    private String tid, next_redirect_pc_url;
    private String next_redirect_app_url, next_redirect_mobile_url, android_app_scheme, ios_app_scheme;
    private Date created_at;
    private boolean tms_result;
    
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getNext_redirect_pc_url() {
		return next_redirect_pc_url;
	}
	public void setNext_redirect_pc_url(String next_redirect_pc_url) {
		this.next_redirect_pc_url = next_redirect_pc_url;
	}
	public String getNext_redirect_app_url() {
		return next_redirect_app_url;
	}
	public void setNext_redirect_app_url(String next_redirect_app_url) {
		this.next_redirect_app_url = next_redirect_app_url;
	}
	public String getNext_redirect_mobile_url() {
		return next_redirect_mobile_url;
	}
	public void setNext_redirect_mobile_url(String next_redirect_mobile_url) {
		this.next_redirect_mobile_url = next_redirect_mobile_url;
	}
	public String getAndroid_app_scheme() {
		return android_app_scheme;
	}
	public void setAndroid_app_scheme(String android_app_scheme) {
		this.android_app_scheme = android_app_scheme;
	}
	public String getIos_app_scheme() {
		return ios_app_scheme;
	}
	public void setIos_app_scheme(String ios_app_scheme) {
		this.ios_app_scheme = ios_app_scheme;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	public boolean isTms_result() {
		return tms_result;
	}
	public void setTms_result(boolean tms_result) {
		this.tms_result = tms_result;
	}
	@Override
	public String toString() {
		return "KakaoPayReadyVO [tid=" + tid + ", next_redirect_pc_url=" + next_redirect_pc_url
				+ ", next_redirect_app_url=" + next_redirect_app_url + ", next_redirect_mobile_url="
				+ next_redirect_mobile_url + ", android_app_scheme=" + android_app_scheme + ", ios_app_scheme="
				+ ios_app_scheme + ", created_at=" + created_at + ", tms_result=" + tms_result + "]";
	}
    
}
