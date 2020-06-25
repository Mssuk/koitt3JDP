package com.koitt.tim.dto.order;

public class GetOrderNum {
	private int num;
	private String orderDay;
	private String id;
	private int o_point;
	private String o_status;
	private String o_name;
	private String o_tel;
	private int o_cost;

	public String getOrderDay() {
		return orderDay;
	}

	public void setOrderDay(String orderDay) {
		this.orderDay = orderDay;
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

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

}
