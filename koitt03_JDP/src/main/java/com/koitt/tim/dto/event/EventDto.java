package com.koitt.tim.dto.event;

import java.sql.Timestamp;

public class EventDto {

	private String event_num;// 글번호
	private String coupon_num;// 쿠폰번호
	private String event_title;// 제목
	private String event_content;// 글내용
	private String event_image1;// 이미지1(썸네일 이미지)
	private String event_image2;// 이미지2(글내용이미지)
	private Timestamp event_regist;// 등록일
	private Timestamp event_start;// 시작일
	private Timestamp event_end;// 종료일

	public String getEvent_num() {
		return event_num;
	}

	public void setEvent_num(String event_num) {
		this.event_num = event_num;
	}

	public String getCoupon_num() {
		return coupon_num;
	}

	public void setCoupon_num(String coupon_num) {
		this.coupon_num = coupon_num;
	}

	public String getEvent_title() {
		return event_title;
	}

	public void setEvent_title(String event_title) {
		this.event_title = event_title;
	}

	public String getEvent_content() {
		return event_content;
	}

	public void setEvent_content(String event_content) {
		this.event_content = event_content;
	}

	public String getEvent_image1() {
		return event_image1;
	}

	public void setEvent_image1(String event_image1) {
		this.event_image1 = event_image1;
	}

	public String getEvent_image2() {
		return event_image2;
	}

	public void setEvent_image2(String event_image2) {
		this.event_image2 = event_image2;
	}

	public Timestamp getEvent_regist() {
		return event_regist;
	}

	public void setEvent_regist(Timestamp event_regist) {
		this.event_regist = event_regist;
	}

	public Timestamp getEvent_start() {
		return event_start;
	}

	public void setEvent_start(Timestamp event_start) {
		this.event_start = event_start;
	}

	public Timestamp getEvent_end() {
		return event_end;
	}

	public void setEvent_end(Timestamp event_end) {
		this.event_end = event_end;
	}

}
