package com.koitt.tim.dto.admin;

import java.sql.Timestamp;

public class AnswerDto {

	private String a_num;
	private String q_num;
	private String a_content;
	private Timestamp a_date;

	public String getA_num() {
		return a_num;
	}

	public void setA_num(String a_num) {
		this.a_num = a_num;
	}

	public String getQ_num() {
		return q_num;
	}

	public void setQ_num(String q_num) {
		this.q_num = q_num;
	}

	public String getA_content() {
		return a_content;
	}

	public void setA_content(String a_content) {
		this.a_content = a_content;
	}

	public Timestamp getA_date() {
		return a_date;
	}

	public void setA_date(Timestamp a_date) {
		this.a_date = a_date;
	}

}
