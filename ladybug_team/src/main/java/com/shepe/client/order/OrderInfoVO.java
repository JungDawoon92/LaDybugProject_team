package com.shepe.client.order;

import java.sql.Date;

public class OrderInfoVO {
	private String order_no;
	private Date order_ymd;
	private int order_sum;
	private PaymentGroup paymentType;
	private PayType payType;
	
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
	public PaymentGroup getPaymentType() {
		return paymentType;
	}
	public void setPaymentType(PaymentGroup paymentType) {
		this.paymentType = paymentType;
	}
	public PayType getPayType() {
		return payType;
	}
	public void setPayType(PayType payType) {
		this.payType = payType;
	}
	@Override
	public String toString() {
		return "OrderInfoVO [order_no=" + order_no + ", order_ymd=" + order_ymd + ", order_sum=" + order_sum
				+ ", paymentType=" + paymentType + ", payType=" + payType + "]";
	}
}