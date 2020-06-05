package com.koitt.tim.dao.event;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.koitt.tim.dto.coupon.CouponDto;
import com.koitt.tim.dto.event.EventDto;
import com.koitt.tim.dto.event.EventReplyBean;

@Repository
public interface EventDao {

	// 글보기,쿠폰----------------------------------------------------------------
	EventDto selectEventView(String event_num);

	CouponDto selectEventCoupon(String event_num);


	// 이전글,다음글
	List<EventDto> selectEventPreNext(@Param("rnum") int rnum);

	// 댓글,회원정보가져오기
	List<EventReplyBean> selectEventReply(String event_num);

	// 페이지 나눠서 글 갖고옴(search)-----------------------------------------------
	List<EventDto> selectSearchEvent(@Param("p1") int start, @Param("p2") int end, @Param("opt") String search,
			@Param("key") String txt);

	// 전체 개수 카운트(no search)
	int selectSearchListCount(@Param("opt") String search, @Param("key") String txt);


	//admin---------------------------------------------------------------------------------------
	//이벤트 insert
	void insertEvent(EventDto eDto);

	//모든 이벤트 가지고 오기
	List<EventDto> selectEventforA();

}
