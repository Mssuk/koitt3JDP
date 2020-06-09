package com.koitt.tim.dao.event;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.koitt.tim.dto.coupon.CouponDto;
import com.koitt.tim.dto.event.EventDto;
import com.koitt.tim.dto.event.EventReplyBean;

@Repository
public interface EventDao {
	// 페이지 나눠서 글 갖고옴(search)-----------------------------------------------
	List<EventDto> selectSearchEvent(@Param("p1") int start, @Param("p2") int end, @Param("opt") String search,
			@Param("key") String txt);

	// 전체 개수 카운트(search)
	int selectSearchListCount(@Param("opt") String search, @Param("key") String txt);

	// 글보기,쿠폰----------------------------------------------------------------
	EventDto selectEventView(String event_num);

	CouponDto selectEventCoupon(String event_num);

	// 이전글,다음글
	EventDto selectEventPre(@Param("rnum") int rnum);

	EventDto selectEventNext(@Param("rnum") int rnum);

	// 댓글,회원정보가져오기
	List<EventReplyBean> selectEventReply(String event_num);

	// 댓글 가져오기
	int selectReplyCount(String event_num);

	// ----------------------종료
	// 페이지 나눠서 글 갖고옴(search)-----------------------------------------------
	List<EventDto> selectFinSearchEvent(@Param("p1") int start, @Param("p2") int end, @Param("opt") String search,
			@Param("key") String txt);

	// 전체 개수 카운트(search)
	int selectFinSearchListCount(@Param("opt") String search, @Param("key") String txt);

	// 글보기,쿠폰----------------------------------------------------------------
	EventDto selectFinEventView(String event_num);

	CouponDto selectFinEventCoupon(String event_num);

	// 이전글,다음글
	EventDto selectFinEventPre(@Param("rnum") int rnum);

	EventDto selectFinEventNext(@Param("rnum") int rnum);

	// 댓글등록------------------------------------------------------
	void insertEventReply(@Param("id") String id, @Param("event_num") String event_num, @Param("pw") String pw,
			@Param("event_re_content") String event_re_content);

	void updateEventReply(@Param("event_re_content") String event_re_content,
			@Param("event_re_num") String event_re_num);

	void deleteEventReply(@Param("event_re_num") String event_re_num);

	// admin---------------------------------------------------------------------------------------
	// 이벤트 insert
	void insertEvent(EventDto eDto);

	// 모든 이벤트 가지고 오기
	List<EventDto> selectEventforA();

}
