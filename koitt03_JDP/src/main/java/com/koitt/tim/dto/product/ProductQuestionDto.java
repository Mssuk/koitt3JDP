package com.koitt.tim.dto.product;

import java.sql.Timestamp;

public class ProductQuestionDto {

	private String q_num;
	private String id;
	private String pro_num;
	private String q_title;
	private String q_content;
	private String q_pw;
	private Timestamp q_date;

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	private String product_name;

	public String getQ_num() {
		return q_num;
	}

	public void setQ_num(String q_num) {
		this.q_num = q_num;
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

	public String getQ_title() {
		return q_title;
	}

	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}

	public String getQ_content() {
		return q_content;
	}

	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}

	public String getQ_pw() {
		return q_pw;
	}

	public void setQ_pw(String q_pw) {
		this.q_pw = q_pw;
	}

	public Timestamp getQ_date() {
		return q_date;
	}

	public void setQ_date(Timestamp q_date) {
		this.q_date = q_date;
	}

}
