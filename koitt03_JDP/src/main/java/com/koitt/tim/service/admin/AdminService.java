package com.koitt.tim.service.admin;

import java.util.List;

import com.koitt.tim.dto.admin.MallDto;
import com.koitt.tim.dto.event.EventDto;
import com.koitt.tim.dto.member.MemberDto;

public interface AdminService {

	MallDto getMallInfo();

	// All Members
	List<MemberDto> getAllMembers();

	// All Events
	List<EventDto> getAllEvents(int start, int end);

}
