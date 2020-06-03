package com.koitt.tim.dto.coupon;

import java.sql.Timestamp;

public class CouponDto {

	private String coupon_num;
	private String coupon_name;
	private String coupon_type;
	private int coupon_pay;
	private Timestamp startday;
	private Timestamp endday;

	public String getCoupon_num() {
		return coupon_num;
	}

	public void setCoupon_num(String coupon_num) {
		this.coupon_num = coupon_num;
	}

	public String getCoupon_name() {
		return coupon_name;
	}

	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}

	public String getCoupon_type() {
		return coupon_type;
	}

	public void setCoupon_type(String coupon_type) {
		this.coupon_type = coupon_type;
	}

	public int getCoupon_pay() {
		return coupon_pay;
	}

	public void setCoupon_pay(int coupon_pay) {
		this.coupon_pay = coupon_pay;
	}

	public Timestamp getStartday() {
		return startday;
	}

	public void setStartday(Timestamp startday) {
		this.startday = startday;
	}

	public Timestamp getEndday() {
		return endday;
	}

	public void setEndday(Timestamp endday) {
		this.endday = endday;
	}

}
