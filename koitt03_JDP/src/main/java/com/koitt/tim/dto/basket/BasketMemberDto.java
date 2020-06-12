package com.koitt.tim.dto.basket;

import java.sql.Timestamp;

public class BasketMemberDto {
	private String basket_num;
	private String id;
	private String pro_num;
	private Timestamp put_in;
	private int count;

	public String getBasket_num() {
		return basket_num;
	}

	public void setBasket_num(String basket_num) {
		this.basket_num = basket_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPro_num() {
		return pro_num;
	}

	public void setPro_num(String pro_num) {
		this.pro_num = pro_num;
	}

	public Timestamp getPut_in() {
		return put_in;
	}

	public void setPut_in(Timestamp put_in) {
		this.put_in = put_in;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

}
