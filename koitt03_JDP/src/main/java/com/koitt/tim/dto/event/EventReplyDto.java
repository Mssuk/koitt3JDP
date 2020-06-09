package com.koitt.tim.dto.event;

import java.sql.Timestamp;

public class EventReplyDto {
	private String event_re_num;// 글번호
	private String id;// 회원id
	private String event_num;// 이벤트번호
	private String pw;// 글 비밀번호
	private String event_re_content;// 글내용
	private Timestamp event_re_regist;// 작성일
	private Timestamp event_re_modify;// 수정일

	public String getEvent_re_num() {
		return event_re_num;
	}

	public void setEvent_re_num(String event_re_num) {
		this.event_re_num = event_re_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEvent_num() {
		return event_num;
	}

	public void setEvent_num(String event_num) {
		this.event_num = event_num;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getEvent_re_content() {
		return event_re_content;
	}

	public void setEvent_re_content(String event_re_content) {
		this.event_re_content = event_re_content;
	}

	public Timestamp getEvent_re_regist() {
		return event_re_regist;
	}

	public void setEvent_re_regist(Timestamp event_re_regist) {
		this.event_re_regist = event_re_regist;
	}

	public Timestamp getEvent_re_modify() {
		return event_re_modify;
	}

	public void setEvent_re_modify(Timestamp event_re_modify) {
		this.event_re_modify = event_re_modify;
	}

}
