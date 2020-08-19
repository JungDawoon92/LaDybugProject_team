package com.shepe.client.order;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public enum PaymentGroup {
	CASH("현금", Arrays.asList(PayType.REMITTANCE)),
	PAY("간편결제", Arrays.asList(PayType.KAKAO_PAY, PayType.NAVER_PAY)),
	EMPTY("없음", Collections.emptyList());
	
	private String title;
	private List<PayType> payList;
	
	private PaymentGroup(String title, List<PayType> payList) {
		this.title = title;
		this.payList = payList;
	}
	public String getTitle() {
		return title;
	}
	public static PaymentGroup findByPayType(PayType payType) {
		return Arrays.stream(PaymentGroup.values())
				.filter(payGroup -> payGroup.hasPayCode(payType))
				.findAny()
				.orElse(EMPTY);
	}
	
	public boolean hasPayCode(PayType payType) {
		System.out.println(payList);
		return payList.stream().anyMatch(pay -> pay == payType);
	}
}
