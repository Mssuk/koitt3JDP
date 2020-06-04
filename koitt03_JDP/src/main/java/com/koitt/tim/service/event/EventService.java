package com.koitt.tim.service.event;

import java.util.List;

import com.koitt.tim.dto.coupon.CouponDto;
import com.koitt.tim.dto.event.EventDto;

public interface EventService {

	// 글보기
	EventDto eventView(String event_num);

	// 이전글
	EventDto eventViewPre(int rnum);

	// 다음글
	EventDto eventViewNext(int rnum);

	// 쿠폰가져오기
	CouponDto couponView(String coupon_num);

	// 글 목록보기(no search)-----------------------------
	List<EventDto> selectEvent(int pageNum);

	// 밑에 나타나는 페이지 넘버링
	List<Integer> getPageList(int pageNum);

	// 전체글 리스트 카운트
	int getListCount();

	// 글목록보기(search)-----------------------------------
	List<EventDto> selectEvent(int pageNum, String search, String text);

	List<Integer> getPageList(int pageNum, String search, String text);

	// 전체글 리스트 카운트(search)
	int getListCount(String search, String text);

	// 마지막페이지 번호를 알려줌
	int getLastNum(double cnt);
}
