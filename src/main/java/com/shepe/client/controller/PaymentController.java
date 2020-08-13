package com.shepe.client.controller;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.shepe.client.order.OrderService;
import com.shepe.pay.kakao.KakaoPayApprovalVO;
import com.shepe.pay.kakao.impl.KakaoPay;

@Controller
public class PaymentController {
	private static final Logger logger = LoggerFactory.getLogger(PaymentController.class);
	
	@Autowired
    private KakaoPay kakaoPay;
	@Autowired
	private OrderService orderService;
    
    @RequestMapping(value="/kakaoPay", method=RequestMethod.POST)
    public String kakaoPay(HttpServletRequest req) {
    	logger.info("kakaoPay post............................................");
    	
    	return "redirect:" + kakaoPay.kakaoPayReady((Map<?,?>)req.getAttribute("map"));
    }
    
    @RequestMapping(value="/kakaoPaySuccess", method=RequestMethod.GET)
    public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
    	logger.info("kakaoPaySuccess get............................................");
    	logger.info("kakaoPaySuccess pg_token : " + pg_token);
    	Object ob = kakaoPay.kakaoPayApproval(pg_token);
    	if(ob.getClass() == KakaoPayApprovalVO.class) {
    		KakaoPayApprovalVO result = (KakaoPayApprovalVO) ob;

    		if(orderService.updatePaymentCompleted(result.getPartner_order_id()) != true) {
    			logger.info("결제완료 정보 DB업데이트 실패");
    		}
    		model.addAttribute("paymentInfo", result);
    		
    		return "api/kakao/pay/KakaoPaySuccess";
    	}
    	else if(ob.getClass() == String.class) {
    		if(orderService.deletePaymentFail((String) ob) != true) {
    			logger.info("order table 데이터 삭제 실패");
    		}
    		if(kakaoPay.kakaoPayOrderCancel((String) ob) == null) {
    			logger.info("결제에러로 인한 결제 취소 실패");
    		}
    	}
    	
    	return "api/kakao/pay/KakaoPaySuccessFail";
    }
    
    @RequestMapping(value="/kakaoPayHistory", method=RequestMethod.POST)
    public String kakaoPayHistory(Model model) {
    	logger.info("kakaoPayHistory post............................................");
    	
    	model.addAttribute("history", kakaoPay.kakaoPayOrderLookUp());
        return "api/kakao/pay/KakaoPayHistory";
    }
    
    @RequestMapping(value="/kakaoPayCancel", method=RequestMethod.GET)
    public String kakaoPayOrderCancel(@RequestParam String order_no, Model model) {
    	logger.info("kakaoPayOrderCancel post............................................");
    	
    	model.addAttribute("cancel", kakaoPay.kakaoPayOrderCancel(order_no));
        return "api/kakao/pay/KakaoPayOrderCancel";
    }
}
