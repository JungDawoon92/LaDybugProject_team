package com.shepe.pay.kakao;

import java.util.Date;

public class KakaoPayCancelVO {
	private String aid, tid, cid, status, partner_order_id, partner_user_id, payment_method_type, item_name;
	private int quantity;
	private Date created_at, approved_at, canceled_at;
	private AmountVO amount;
	private Canceled_amountVO canceled_amount;
	private Cancel_available_amountVO cancel_available_amount;
	
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPartner_order_id() {
		return partner_order_id;
	}
	public void setPartner_order_id(String partner_order_id) {
		this.partner_order_id = partner_order_id;
	}
	public String getPartner_user_id() {
		return partner_user_id;
	}
	public void setPartner_user_id(String partner_user_id) {
		this.partner_user_id = partner_user_id;
	}
	public String getPayment_method_type() {
		return payment_method_type;
	}
	public void setPayment_method_type(String payment_method_type) {
		this.payment_method_type = payment_method_type;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	public Date getApproved_at() {
		return approved_at;
	}
	public void setApproved_at(Date approved_at) {
		this.approved_at = approved_at;
	}
	public Date getCanceled_at() {
		return canceled_at;
	}
	public void setCanceled_at(Date canceled_at) {
		this.canceled_at = canceled_at;
	}
	public AmountVO getAmount() {
		return amount;
	}
	public void setAmount(AmountVO amount) {
		this.amount = amount;
	}
	public Canceled_amountVO getCanceled_amount() {
		return canceled_amount;
	}
	public void setCanceled_amount(Canceled_amountVO canceled_amount) {
		this.canceled_amount = canceled_amount;
	}
	public Cancel_available_amountVO getCancel_available_amount() {
		return cancel_available_amount;
	}
	public void setCancel_available_amount(Cancel_available_amountVO cancel_available_amount) {
		this.cancel_available_amount = cancel_available_amount;
	}
	@Override
	public String toString() {
		return "KakaoPayCancelVO [aid=" + aid + ", tid=" + tid + ", cid=" + cid + ", status=" + status
				+ ", partner_order_id=" + partner_order_id + ", partner_user_id=" + partner_user_id
				+ ", payment_method_type=" + payment_method_type + ", item_name=" + item_name + ", quantity=" + quantity
				+ ", created_at=" + created_at + ", approved_at=" + approved_at + ", canceled_at=" + canceled_at
				+ ", amount=" + amount + ", canceled_amount=" + canceled_amount + ", cancel_available_amount="
				+ cancel_available_amount + "]";
	}
	
}
