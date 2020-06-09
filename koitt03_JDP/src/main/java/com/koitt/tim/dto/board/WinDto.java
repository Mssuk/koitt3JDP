package com.koitt.tim.dto.board;

import java.sql.Timestamp;

public class WinDto {
	private int rnum;// 이전글,다음글을 위한 번호
	private String w_num;// 고유글번호
	private String w_title;// 제목
	private String w_content;// 내용
	private String w_image;// 삽입이미지
	private Timestamp w_regist;// 작성일
	private int w_hit;// 조회수

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public String getW_num() {
		return w_num;
	}

	public void setW_num(String w_num) {
		this.w_num = w_num;
	}

	public String getW_title() {
		return w_title;
	}

	public void setW_title(String w_title) {
		this.w_title = w_title;
	}

	public String getW_content() {
		return w_content;
	}

	public void setW_content(String w_content) {
		this.w_content = w_content;
	}

	public String getW_image() {
		return w_image;
	}

	public void setW_image(String w_image) {
		this.w_image = w_image;
	}

	public Timestamp getW_regist() {
		return w_regist;
	}

	public void setW_regist(Timestamp w_regist) {
		this.w_regist = w_regist;
	}

	public int getW_hit() {
		return w_hit;
	}

	public void setW_hit(int w_hit) {
		this.w_hit = w_hit;
	}

}
