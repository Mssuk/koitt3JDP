package com.koitt.tim.dto.event;

import com.koitt.tim.dto.member.MemberDto;

public class EventReplyDto {
	private EventReplyDto reply;
	private MemberDto member;

	public EventReplyDto getReply() {
		return reply;
	}

	public void setReply(EventReplyDto reply) {
		this.reply = reply;
	}

	public MemberDto getMember() {
		return member;
	}

	public void setMember(MemberDto member) {
		this.member = member;
	}

}
