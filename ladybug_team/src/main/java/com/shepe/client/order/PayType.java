package com.shepe.client.order;

public enum PayType {
	KAKAO_PAY("카카오페이"),
	NAVER_PAY("네이버페이"),
	REMITTANCE("무통장입금"),
	EMPTY("없음");
	
	private String title;
	
	PayType(String title) {
		this.title = title;
	}
	public String getTitle() { 
		return title; 
	}
}
