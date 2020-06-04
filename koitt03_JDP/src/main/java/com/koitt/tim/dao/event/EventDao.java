package com.koitt.tim.dao.event;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.koitt.tim.dto.coupon.CouponDto;
import com.koitt.tim.dto.event.EventDto;
import com.koitt.tim.dto.event.EventReplyDto;

@Repository
public interface EventDao {

	// 페이지 나눠서 글 갖고옴(no search)------------------------------------------
	List<EventDto> selectEvent(@Param("p1") int start, @Param("p2") int end);

	// 전체 개수 카운트(no search)
	int selectListCount();

	// 글보기----------------------------------------------------------------
	EventDto selectEventView(String ev_num);

	// 이전글
	EventDto selectEventPre(@Param("rnum") int rnum);

	// 다음글
	EventDto selectEventNext(@Param("rnum") int rnum);

	// 쿠폰
	CouponDto selectCoupon(String coupon_num);

	// 댓글가져오기
	List<EventReplyDto> selectEventReply(String event_num);

	// 페이지 나눠서 글 갖고옴(search)-----------------------------------------------
	List<EventDto> selectSearchEvent(@Param("p1") int start, @Param("p2") int end, @Param("opt") String search,
			@Param("key") String txt);

	// 전체 개수 카운트(no search)
	int selectSearchListCount(@Param("opt") String search, @Param("key") String txt);
}
