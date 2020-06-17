package com.koitt.tim.dto.order;

import java.sql.Timestamp;

public class OrderListDto {

	private String key;
	private Timestamp o_date;
	private String o_num;
	private String pro_num;
	private String product_name;
	private String price;
	private int o_quant;
	private String o_status;

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public Timestamp getO_date() {
		return o_date;
	}

	public void setO_date(Timestamp o_date) {
		this.o_date = o_date;
	}

	public String getO_num() {
		return o_num;
	}

	public void setO_num(String o_num) {
		this.o_num = o_num;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getPro_num() {
		return pro_num;
	}

	public void setPro_num(String pro_num) {
		this.pro_num = pro_num;
	}

	public int getO_quant() {
		return o_quant;
	}

	public void setO_quant(int o_quant) {
		this.o_quant = o_quant;
	}

	public String getO_status() {
		return o_status;
	}

	public void setO_status(String o_status) {
		this.o_status = o_status;
	}
}
