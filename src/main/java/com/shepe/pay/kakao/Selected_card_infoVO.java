package com.shepe.pay.kakao;

public class Selected_card_infoVO {
	private String card_bin, card_corp_name, interest_free_install;
	private int install_month;
	
	public String getCard_bin() {
		return card_bin;
	}
	public void setCard_bin(String card_bin) {
		this.card_bin = card_bin;
	}
	public String getCard_corp_name() {
		return card_corp_name;
	}
	public void setCard_corp_name(String card_corp_name) {
		this.card_corp_name = card_corp_name;
	}
	public String getInterest_free_install() {
		return interest_free_install;
	}
	public void setInterest_free_install(String interest_free_install) {
		this.interest_free_install = interest_free_install;
	}
	public int getInstall_month() {
		return install_month;
	}
	public void setInstall_month(int install_month) {
		this.install_month = install_month;
	}
}
