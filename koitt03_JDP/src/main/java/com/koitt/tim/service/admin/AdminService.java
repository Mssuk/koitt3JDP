package com.koitt.tim.service.admin;

import java.util.List;

import com.koitt.tim.dto.admin.MallDto;
import com.koitt.tim.dto.coupon.CouponDto;
import com.koitt.tim.dto.event.EventDto;
import com.koitt.tim.dto.member.MemberDto;

public interface AdminService {

	MallDto getMallInfo();

	// All Members
	List<MemberDto> getAllMembers();

	// All Event Posts
	List<EventDto> getAllEvents(int start, int end);

	// All Coupons
	List<CouponDto> getAllCoupons();

	// insert Event
	void insertEvent(EventDto eDto);
}
