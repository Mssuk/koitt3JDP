package com.koitt.tim.dto.order;

import java.sql.Timestamp;

public class OrderDto {
	private String o_num;// 주문번호
	private String id;// 주문아이디
	private int o_point;// 주문시 사용했던 포인트
	private String o_status;// 주문상태
	private Timestamp o_date;// 주문일
	private Timestamp o_update_date;// 수정일
	private String o_name;// 주문자명
	private String o_tel;// 주문자전화번호
	private int o_cost;// 배송료

	public String getO_num() {
		return o_num;
	}

	public void setO_num(String o_num) {
		this.o_num = o_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getO_point() {
		return o_point;
	}

	public void setO_point(int o_point) {
		this.o_point = o_point;
	}

	public String getO_status() {
		return o_status;
	}

	public void setO_status(String o_status) {
		this.o_status = o_status;
	}

	public Timestamp getO_date() {
		return o_date;
	}

	public void setO_date(Timestamp o_date) {
		this.o_date = o_date;
	}

	public String getO_name() {
		return o_name;
	}

	public void setO_name(String o_name) {
		this.o_name = o_name;
	}

	public String getO_tel() {
		return o_tel;
	}

	public void setO_tel(String o_tel) {
		this.o_tel = o_tel;
	}

	public int getO_cost() {
		return o_cost;
	}

	public void setO_cost(int o_cost) {
		this.o_cost = o_cost;
	}

	public Timestamp getO_update_date() {
		return o_update_date;
	}

	public void setO_update_date(Timestamp o_update_date) {
		this.o_update_date = o_update_date;
	}

	public String getO_status() {
		return o_status;
	}

	public void setO_status(String o_status) {
		this.o_status = o_status;
	}
}
