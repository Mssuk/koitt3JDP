package com.koitt.tim.dto.coupon;

import java.sql.Timestamp;

public class CouponMemBean {
	private int rownum;
	private String coupon_num;
	private String coupon_name;
	private String coupon_type;//
	private int coupon_pay;// 쿠폰 할인금액
	private Timestamp startday;//
	private Timestamp endday;//
	private Timestamp regist_coupon;// 발급일
	private Timestamp use_date;// 사용일

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

	public Timestamp getUse_date() {
		return use_date;
	}

	public void setUse_date(Timestamp use_date) {
		this.use_date = use_date;
	}

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}

	public Timestamp getRegist_coupon() {
		return regist_coupon;
	}

	public void setRegist_coupon(Timestamp regist_coupon) {
		this.regist_coupon = regist_coupon;
	}
}
