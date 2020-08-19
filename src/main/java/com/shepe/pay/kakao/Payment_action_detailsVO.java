package com.shepe.pay.kakao;

public class Payment_action_detailsVO {
	private String aid, approved_at, payment_action_type;
	private int amount, point_amount, discount_amount;
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getApproved_at() {
		return approved_at;
	}
	public void setApproved_at(String approved_at) {
		this.approved_at = approved_at;
	}
	public String getPayment_action_type() {
		return payment_action_type;
	}
	public void setPayment_action_type(String payment_action_type) {
		this.payment_action_type = payment_action_type;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getPoint_amount() {
		return point_amount;
	}
	public void setPoint_amount(int point_amount) {
		this.point_amount = point_amount;
	}
	public int getDiscount_amount() {
		return discount_amount;
	}
	public void setDiscount_amount(int discount_amount) {
		this.discount_amount = discount_amount;
	}
}
