package com.koitt.tim.dto.order;

public class OrderDto {
	private String o_num;// 주문번호
	private String id;// 주문아이디
	private String o_point;// 주문시 사용했던 포인트
	private String o_state;// 주문상태
	private String o_date;// 주문일
	private String o_name;// 주문자명
	private String o_tel;// 주문자전화번호
	private String o_cost;// 배송료

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

	public String getO_point() {
		return o_point;
	}

	public void setO_point(String o_point) {
		this.o_point = o_point;
	}

	public String getO_state() {
		return o_state;
	}

	public void setO_state(String o_state) {
		this.o_state = o_state;
	}

	public String getO_date() {
		return o_date;
	}

	public void setO_date(String o_date) {
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

	public String getO_cost() {
		return o_cost;
	}

	public void setO_cost(String o_cost) {
		this.o_cost = o_cost;
	}

}
