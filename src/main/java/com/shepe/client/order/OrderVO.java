package com.shepe.client.order;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class OrderVO {
	private String order_no;
	private Date order_ymd;
	private int order_sum;
	private OrderInfoVO orderInfoVO;
	private OrderMemberVO orderMemberVO;
	private List<OrderIngredientVO> orderIngreVOs;

	public OrderVO() {
		super();
		this.orderInfoVO = new OrderInfoVO();
		this.orderMemberVO = new OrderMemberVO();
		this.orderIngreVOs = new ArrayList<OrderIngredientVO>();
	}
	
	public String getOrder_no() {
		return order_no;
	}
	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}
	public Date getOrder_ymd() {
		return order_ymd;
	}
	public void setOrder_ymd(Date order_ymd) {
		this.order_ymd = order_ymd;
	}
	public int getOrder_sum() {
		return order_sum;
	}
	public void setOrder_sum(int order_sum) {
		this.order_sum = order_sum;
	}
	public OrderInfoVO getOrderInfoVO() {
		return orderInfoVO;
	}
	public void setOrderInfoVO(OrderInfoVO orderInfoVO) {
		this.orderInfoVO = orderInfoVO;
	}
	public OrderMemberVO getOrderMemberVO() {
		return orderMemberVO;
	}
	public void setOrderMemberVO(OrderMemberVO orderMemberVO) {
		this.orderMemberVO = orderMemberVO;
	}
	public List<OrderIngredientVO> getOrderIngreVOs() {
		return orderIngreVOs;
	}
	public void setOrderIngreVOs(List<OrderIngredientVO> orderIngreVOs) {
		this.orderIngreVOs = orderIngreVOs;
	}
	@Override
	public String toString() {
		return "OrderVO [order_no=" + order_no + ", order_ymd=" + order_ymd + ", order_sum=" + order_sum
				+ ", orderInfoVO=" + orderInfoVO + ", orderMemberVO=" + orderMemberVO + ", orderIngreVOs="
				+ orderIngreVOs + ", getOrder_no()=" + getOrder_no() + ", getOrder_ymd()=" + getOrder_ymd()
				+ ", getOrder_sum()=" + getOrder_sum() + ", getOrderInfoVO()=" + getOrderInfoVO()
				+ ", getOrderMemberVO()=" + getOrderMemberVO() + ", getOrderIngreVOs()=" + getOrderIngreVOs()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
}
