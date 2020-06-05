package com.koitt.tim.dto.event;

import com.koitt.tim.dto.member.MemberDto;

public class EventReplyBean {
	private EventReplyDto replyDto;
	private MemberDto memberDto;

	public EventReplyDto getReplyDto() {
		return replyDto;
	}

	public void setReplyDto(EventReplyDto replyDto) {
		this.replyDto = replyDto;
	}

	public MemberDto getMemberDto() {
		return memberDto;
	}

	public void setMemberDto(MemberDto memberDto) {
		this.memberDto = memberDto;
	}
}
