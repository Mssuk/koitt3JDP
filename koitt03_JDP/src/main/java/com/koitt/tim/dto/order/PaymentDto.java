package com.koitt.tim.dto.order;

import java.sql.Timestamp;

public class PaymentDto {

	private String o_num;
	private String o_way;
	private Timestamp o_date;
	private int o_sum;
	private String o_coupon_num;
	private String bank;
	private String bank_name;

	public String getO_num() {
		return o_num;
	}

	public void setO_num(String o_num) {
		this.o_num = o_num;
	}

	public String getO_way() {
		return o_way;
	}

	public void setO_way(String o_way) {
		this.o_way = o_way;
	}

	public Timestamp getO_date() {
		return o_date;
	}

	public void setO_date(Timestamp o_date) {
		this.o_date = o_date;
	}

	public int getO_sum() {
		return o_sum;
	}

	public void setO_sum(int o_sum) {
		this.o_sum = o_sum;
	}

	public String getO_coupon_num() {
		return o_coupon_num;
	}

	public void setO_coupon_num(String o_coupon_num) {
		this.o_coupon_num = o_coupon_num;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getBank_name() {
		return bank_name;
	}

	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}

}
