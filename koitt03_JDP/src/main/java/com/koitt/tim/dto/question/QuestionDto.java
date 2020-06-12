package com.koitt.tim.dto.question;

import java.sql.Timestamp;

public class QuestionDto {

	private int rnum;// mypage이전글,다음글용도
	private String q_num;// 글번호
	private String id;// 글쓴아이디
	private String q_title;// 제목
	private String q_content;// 내용
	private Timestamp q_date;// 작성일 (작성일기준desc , rnum은 거꾸로해야한다..)
	private String q_type;// 분류(상품문의 교환/반품, 배송 기타)
	private String q_file;// 첨부파일

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

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

	public Timestamp getQ_date() {
		return q_date;
	}

	public void setQ_date(Timestamp q_date) {
		this.q_date = q_date;
	}

	public String getQ_type() {
		return q_type;
	}

	public void setQ_type(String q_type) {
		this.q_type = q_type;
	}

	public String getQ_file() {
		return q_file;
	}

	public void setQ_file(String q_file) {
		this.q_file = q_file;
	}

}
