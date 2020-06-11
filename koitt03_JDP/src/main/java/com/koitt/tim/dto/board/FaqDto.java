package com.koitt.tim.dto.board;

import java.sql.Timestamp;

public class FaqDto {

	private String faq_num;// FAQ고유글번호
	private String faq_type;// 글종류
	private String faq_title;// 제목
	private String faq_content;// 내용
	private Timestamp faq_written_date;// 작성일
	private Timestamp faq_modified_date;// 수정일

	public String getFaq_num() {
		return faq_num;
	}

	public void setFaq_num(String faq_num) {
		this.faq_num = faq_num;
	}

	public String getFaq_type() {
		return faq_type;
	}

	public void setFaq_type(String faq_type) {
		this.faq_type = faq_type;
	}

	public String getFaq_title() {
		return faq_title;
	}

	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}

	public String getFaq_content() {
		return faq_content;
	}

	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}

	public Timestamp getFaq_written_date() {
		return faq_written_date;
	}

	public void setFaq_written_date(Timestamp faq_written_date) {
		this.faq_written_date = faq_written_date;
	}

	public Timestamp getFaq_modified_date() {
		return faq_modified_date;
	}

	public void setFaq_modified_date(Timestamp faq_modified_date) {
		this.faq_modified_date = faq_modified_date;
	}

}
