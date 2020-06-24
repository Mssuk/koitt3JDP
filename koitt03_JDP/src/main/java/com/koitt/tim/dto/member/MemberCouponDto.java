package com.koitt.tim.dto.member;

import java.sql.Timestamp;

public class MemberCouponDto {
	private String id;
	private String coupon_num;
	private Timestamp regist_coupon;
	private Timestamp use_date;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCoupon_num() {
		return coupon_num;
	}

	public void setCoupon_num(String coupon_num) {
		this.coupon_num = coupon_num;
	}

	public Timestamp getUse_date() {
		return use_date;
	}

	public void setUse_date(Timestamp use_date) {
		this.use_date = use_date;
	}

	public Timestamp getRegist_coupon() {
		return regist_coupon;
	}

	public void setRegist_coupon(Timestamp regist_coupon) {
		this.regist_coupon = regist_coupon;
	}
}
