package com.koitt.tim.dto.board;

import java.sql.Timestamp;

public class NoticeDto {
	private int rnum;// 이전글,다음글을 불러오기위한 변수
	private String n_num;
	private String n_title;
	private String n_content;
	private Timestamp n_regist;
	private int n_hit;

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public String getN_num() {
		return n_num;
	}

	public void setN_num(String n_num) {
		this.n_num = n_num;
	}

	public String getN_title() {
		return n_title;
	}

	public void setN_title(String n_title) {
		this.n_title = n_title;
	}

	public String getN_content() {
		return n_content;
	}

	public void setN_content(String n_content) {
		this.n_content = n_content;
	}

	public Timestamp getN_regist() {
		return n_regist;
	}

	public void setN_regist(Timestamp n_regist) {
		this.n_regist = n_regist;
	}

	public int getN_hit() {
		return n_hit;
	}

	public void setN_hit(int n_hit) {
		this.n_hit = n_hit;
	}

}
