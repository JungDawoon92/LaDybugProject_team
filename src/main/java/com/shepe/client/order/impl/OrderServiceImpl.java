package com.shepe.client.order.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.shepe.client.cart.CartVO;
import com.shepe.client.ingredient.IngredientVO;
import com.shepe.client.ingredient.impl.IngredientDAO;
import com.shepe.client.member.MemberVO;
import com.shepe.client.order.OrderInfoVO;
import com.shepe.client.order.OrderIngredientVO;
import com.shepe.client.order.OrderMemberVO;
import com.shepe.client.order.OrderService;
import com.shepe.client.order.OrderVO;
import com.shepe.client.order.PayType;
import com.shepe.client.order.PaymentGroup;

@Service("orderService")
public class OrderServiceImpl implements OrderService{
	@Autowired
	private OrderDAOMybatis orderDAOMybatis;
	@Autowired
	private IngredientDAO ingreDAO;
	
	
	public List<CartVO> viewOrder(Map<String, String> param) {
		JsonParser jsonParser = new JsonParser();
		JsonArray jsonArray = (JsonArray) jsonParser.parse(param.get("order"));
		IngredientVO ingreVO = new IngredientVO();
		List<CartVO> orderList = new ArrayList<CartVO>();
		
		for (int i = 0; i < jsonArray.size(); i++) {
			CartVO cartVO = new CartVO();
			System.out.println(param.get("recipe_no"));
			System.out.println(param.get("recipe_nm"));
			if(param.get("recipe_no") != null && param.get("recipe_nm") != null) {
				cartVO.setRecipe_no(param.get("recipe_no"));
				cartVO.setRecipe_nm(param.get("recipe_nm"));
			}
			else {
				cartVO.setRecipe_nm("기타");
				cartVO.setRecipe_no("0");
			}
			JsonObject object = (JsonObject) jsonArray.get(i);
			String NO = object.get("ingre_no").getAsString();
			String CNT = object.get("ingre_cnt").getAsString();
			ingreVO.setIngredient_no(NO);
			ingreVO = ingreDAO.getIngredient(ingreVO);
			cartVO.setIngredient_no(NO);
			cartVO.setIngredient_cnt(Integer.parseInt(CNT));
//			cartVO.setIngredient_nm("mongshell");
//			cartVO.setIngredient_price(1000);
			cartVO.setIngredient_nm(ingreVO.getIngredient_nm());
			cartVO.setIngredient_price(ingreVO.getIngredient_price());
			cartVO.setIngredient_thumbName(ingreVO.getIngredient_thumbName());
			orderList.add(i, cartVO);
		}
		return orderList;
	}
	@Transactional(rollbackFor={Exception.class})
	public Map<String, Object> insertOrder(Map<String, String> param, MemberVO memberVO, HttpSession session) throws Exception {
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		String order_no = format.format(new Date());
		JsonParser jsonParser = new JsonParser();
		JsonArray jsonArray = (JsonArray) jsonParser.parse(param.get("orderIngredient"));
		List<OrderIngredientVO> itemList = new ArrayList<OrderIngredientVO>(); 
		
		for (int i = 0; i < jsonArray.size(); i++) {
			JsonObject object = (JsonObject) jsonArray.get(i);
			OrderIngredientVO orderIngredientVO = new OrderIngredientVO();
			
			orderIngredientVO.setOrder_no(order_no);
			orderIngredientVO.setIngredient_no(object.get("ingredient_no").getAsString());
			orderIngredientVO.setIngredient_nm(object.get("ingredient_nm").getAsString());
			orderIngredientVO.setIngredient_cnt(object.get("ingredient_cnt").getAsInt());
			orderIngredientVO.setIngredient_price(object.get("ingredient_price").getAsInt());
			orderIngredientVO.setIngredient_thumbName(object.get("ingredient_thumbName").getAsString());
			orderIngredientVO.setRecipe_no(object.get("recipe_no").getAsString());
			orderIngredientVO.setRecipe_nm(object.get("recipe_nm").getAsString());

			itemList.add(orderIngredientVO);
		}
		
		OrderInfoVO orderInfoVO = new OrderInfoVO(); 
		orderInfoVO.setOrder_no(order_no);
		orderInfoVO.setOrder_sum(Integer.parseInt(param.get("orderPriceSum")));
		orderInfoVO.setPaymentType(PaymentGroup.findByPayType(PayType.valueOf(param.get("payType"))));
		orderInfoVO.setPayType(PayType.valueOf(param.get("payType")));
		
		
		OrderMemberVO orderMemberVO = new OrderMemberVO();
		orderMemberVO.setOrder_no(order_no);
		System.out.println(session.getAttribute("apiLogin"));
		
		if(session.getAttribute("apiLogin") != null && session.getAttribute("apiLogin").equals("true")) {
			orderMemberVO.setMember_id((String) session.getAttribute("member_id"));
		}
		else {
			orderMemberVO.setMember_id(memberVO.getMember_id());
			orderMemberVO.setMember_nm(memberVO.getMember_nm());
			orderMemberVO.setMember_email(memberVO.getMember_email());
			orderMemberVO.setMember_email_domain(memberVO.getMember_email_domain());
		}
		
		orderMemberVO.setMember_address1(param.get("address"));
		orderMemberVO.setMember_address2(param.get("detail_address"));
		orderMemberVO.setMember_phone(param.get("phone_first").concat(param.get("phone_second")).concat(param.get("phone_third")));
		orderMemberVO.setMember_reciever(param.get("receiver"));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("orderInfo", orderInfoVO);
		map.put("orderMember", orderMemberVO);
		map.put("orderItemList", itemList);
		orderDAOMybatis.insertOrder(map);
		
//		throw new RuntimeException("roll back");
		return map;
	}
	
	public boolean updatePaymentCompleted(String order_no) {
		if(orderDAOMybatis.updatePaymentCompleted(order_no) != 0)
			return true;
		
		return false;
	}
	
	public boolean deletePaymentFail(String order_no) {
		if(orderDAOMybatis.deletePaymentFail(order_no) != 0)
			return true;
		
		return false;
	}
	
	public List<OrderVO> orderHistory(HttpSession session) {
		if(session != null)
			return orderDAOMybatis.orderHistory((String)session.getAttribute("member_id"));
		else
			return null;
	}
}
