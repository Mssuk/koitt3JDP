package com.koitt.tim.dto.event;

import com.koitt.tim.dto.board.WinDto;

public class WinPreNextBean {
	private WinDto dto;// 현재글
	private WinDto pre;// 이전글
	private WinDto next;// 다음글

	public WinDto getDto() {
		return dto;
	}

	public void setDto(WinDto dto) {
		this.dto = dto;
	}

	public WinDto getPre() {
		return pre;
	}

	public void setPre(WinDto pre) {
		this.pre = pre;
	}

	public WinDto getNext() {
		return next;
	}

	public void setNext(WinDto next) {
		this.next = next;
	}

}
