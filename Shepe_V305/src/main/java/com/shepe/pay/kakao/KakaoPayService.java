package com.shepe.pay.kakao;

import com.shepe.client.order.OrderVO;

public interface KakaoPayService {
	public String kakaoPayReady(OrderVO vo);
	
	public KakaoPayApprovalVO kakaoPayApproval(String pg_token);
	
	public KakaoPayOrderLookUpVO kakaoPayOrderLookUp();
	
	public KakaoPayCancelVO kakaoPayOrderCancel();
}
