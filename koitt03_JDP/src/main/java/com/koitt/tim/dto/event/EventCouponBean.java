package com.koitt.tim.dto.event;

import com.koitt.tim.dto.coupon.CouponDto;

public class EventCouponBean {
	private EventDto eventDto;

	private CouponDto couponDto;

	public EventDto getEventDto() {
		return eventDto;
	}

	public void setEventDto(EventDto eventDto) {
		this.eventDto = eventDto;
	}

	public CouponDto getCouponDto() {
		return couponDto;
	}

	public void setCouponDto(CouponDto couponDto) {
		this.couponDto = couponDto;
	}

}
