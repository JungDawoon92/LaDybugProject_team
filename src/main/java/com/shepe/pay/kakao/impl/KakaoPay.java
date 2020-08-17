package com.shepe.pay.kakao.impl;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.shepe.client.order.OrderInfoVO;
import com.shepe.client.order.OrderIngredientVO;
import com.shepe.client.order.OrderMemberVO;
import com.shepe.pay.kakao.KakaoPayApprovalVO;
import com.shepe.pay.kakao.KakaoPayCancelVO;
import com.shepe.pay.kakao.KakaoPayOrderLookUpVO;
import com.shepe.pay.kakao.KakaoPayReadyVO;

@Service
public class KakaoPay {
	private static final Logger logger = LoggerFactory.getLogger(KakaoPay.class);
	private static final String HOST = "https://kapi.kakao.com";
	
    @Autowired
	private KakaoPayDAO kakaoPayDAO;
    
	private KakaoPayReadyVO kakaoPayReadyVO;
    private KakaoPayApprovalVO kakaoPayApprovalVO;
	private KakaoPayOrderLookUpVO kakaoPayOrderLookUpVO;
    private KakaoPayCancelVO kakaoPayCancelVO;
    private OrderInfoVO orderInfoVO;
    private OrderMemberVO orderMemberVO;
    
    
	public String kakaoPayReady(Map<?, ?> map) {
        RestTemplate restTemplate = new RestTemplate();
        
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK 8f84420a692548d322ed0f776ecec388");
        headers.add("Accept", "application/json");
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        if(map.get("orderInfo") != null && map.get("orderMember") != null && map.get("orderItemList") != null) {
        	orderInfoVO = (OrderInfoVO) map.get("orderInfo");
        	orderMemberVO = (OrderMemberVO) map.get("orderMember");
        	String item_name = null;
        	if(map.get("orderItemList") != null) {
        		List<?> itemList = (List<?>) map.get("orderItemList");
        		itemList.size();
        		OrderIngredientVO orderIngredientVO = (OrderIngredientVO) itemList.get(0);
        		if(itemList.size() == 1)
        			item_name = orderIngredientVO.getRecipe_nm();
        		else
        			item_name = orderIngredientVO.getRecipe_nm().concat("외 " + itemList.size());
        		
        	}
        	MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
            params.add("cid", "TC0ONETIME");
            params.add("partner_order_id", orderInfoVO.getOrder_no());
            params.add("partner_user_id", orderMemberVO.getMember_id());
            params.add("item_name", item_name);
            params.add("quantity", "1");
            params.add("total_amount", String.valueOf(orderInfoVO.getOrder_sum()));
            params.add("tax_free_amount", "0");
            params.add("approval_url", "http://localhost:8090/shepe/kakaoPaySuccess");
            params.add("cancel_url", "http://localhost:8090/shepe/kakaoPayCancel");
            params.add("fail_url", "http://localhost:8090/shepe/kakaoPaySuccessFail");
            HttpEntity<MultiValueMap<String,String>> body = new HttpEntity<MultiValueMap<String,String>>(params, headers);
            
            try {
            	kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
            	logger.info("debug ---------" + kakaoPayReadyVO.toString());
            	
                return kakaoPayReadyVO.getNext_redirect_pc_url();
            } catch (RestClientException e) {
                e.printStackTrace();
            } catch (URISyntaxException e) {
                e.printStackTrace();
            }
        }
        
        return "/pay";
	}
	@Transactional(rollbackFor={Exception.class})
	public Object kakaoPayApproval(String pg_token) {
		 
		logger.info("KakaoPayApprovalVO............................................");

		RestTemplate restTemplate = new RestTemplate();
 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK 8f84420a692548d322ed0f776ecec388");
        headers.add("Accept", MediaType.APPLICATION_JSON_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
 
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", kakaoPayReadyVO.getTid());
        params.add("partner_order_id", orderInfoVO.getOrder_no());
        params.add("partner_user_id", orderMemberVO.getMember_id());
        params.add("pg_token", pg_token);
        params.add("total_amount", String.valueOf(orderInfoVO.getOrder_sum()));
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        
        try {
            kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);
            logger.info("debug ---------" + kakaoPayApprovalVO.toString());
            
            kakaoPayDAO.insertKakaoPay(kakaoPayApprovalVO);

            return kakaoPayApprovalVO;
        } catch (Exception e) {
        	e.printStackTrace();
		}

        return orderInfoVO.getOrder_no();
    }
	
	public KakaoPayOrderLookUpVO kakaoPayOrderLookUp() {
		logger.info("KakaoPayOrderLookUpVO............................................");
		logger.info("-----------------------------");
		
		RestTemplate restTemplate = new RestTemplate();
		 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK 8f84420a692548d322ed0f776ecec388");
        headers.add("Accept", MediaType.APPLICATION_JSON_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
 
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", kakaoPayApprovalVO.getTid());
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        
        try {
        	kakaoPayOrderLookUpVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/order"), body, KakaoPayOrderLookUpVO.class);
            logger.info("" + kakaoPayOrderLookUpVO);
            return kakaoPayOrderLookUpVO;
        } catch (RestClientException e) {
            e.printStackTrace();
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }
        
        return null;
	}
	
	public KakaoPayCancelVO kakaoPayOrderCancel(String order_no) {
		logger.info("kakaoPayOrderCancelVO............................................");
		
		RestTemplate restTemplate = new RestTemplate();
		
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK 8f84420a692548d322ed0f776ecec388");
        headers.add("Accept", MediaType.APPLICATION_JSON_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        Map<String, ?> cancelDataMap = kakaoPayDAO.cancelKakaoPay(order_no);
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", (String)cancelDataMap.get("cid"));
        params.add("tid", (String)cancelDataMap.get("tid"));
        params.add("cancel_amount", String.valueOf(cancelDataMap.get("total")));
        params.add("cancel_tax_free_amount", String.valueOf(cancelDataMap.get("tax_free")));
        
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        
        try {
        	kakaoPayCancelVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/cancel"), body, KakaoPayCancelVO.class);
            logger.info("" + kakaoPayCancelVO);
            
            return kakaoPayCancelVO;
        } catch (RestClientException e) {
            e.printStackTrace();
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }
        
        return null;
	}
}