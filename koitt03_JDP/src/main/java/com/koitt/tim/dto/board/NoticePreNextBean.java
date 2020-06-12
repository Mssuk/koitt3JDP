package com.koitt.tim.dto.board;

public class NoticePreNextBean {

	private NoticeDto dto;// 현재글
	private NoticeDto pre;// 이전글
	private NoticeDto next;// 다음글

	public NoticeDto getDto() {
		return dto;
	}

	public void setDto(NoticeDto dto) {
		this.dto = dto;
	}

	public NoticeDto getPre() {
		return pre;
	}

	public void setPre(NoticeDto pre) {
		this.pre = pre;
	}

	public NoticeDto getNext() {
		return next;
	}

	public void setNext(NoticeDto next) {
		this.next = next;
	}

}
