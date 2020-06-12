package com.koitt.tim.service.event;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.koitt.tim.dto.board.WinDto;
import com.koitt.tim.dto.event.EventCouponBean;
import com.koitt.tim.dto.event.EventDto;
import com.koitt.tim.dto.event.EventPreNextBean;
import com.koitt.tim.dto.event.EventReplyBean;
import com.koitt.tim.dto.event.EventReplyDto;
import com.koitt.tim.dto.event.WinPreNextBean;

public interface EventService {

	// 진행중이벤트
	// 글보기,쿠폰
	EventCouponBean selectEventView(String event_num);

	// 이전글,다음글
	EventPreNextBean selectEventPreNext(int rnum);

	// 글목록보기(search)-----------------------------------
	List<EventDto> selectEvent(int pageNum, String search, String text);

	List<Integer> getPageList(int pageNum, String search, String text);

	// 전체글 리스트 카운트(search)
	int getListCount(String search, String text);

	// -----------------------------------------------------------------------------

	// 댓글가져오기
	List<EventReplyBean> selectEventReply(String event_num);

	// 댓글개수
	int getReplyCount(String event_num);

	// 마지막페이지 번호를 알려줌
	int getLastNum(double cnt);

	// 종료된이벤트------------------------------------------------------------------
	// 글보기,쿠폰
	EventCouponBean selectFinEventView(String event_num);

	// 이전글,다음글
	EventPreNextBean selectFinEventPreNext(int rnum);

	// 글목록보기(search)-----------------------------------
	List<EventDto> selectFinEvent(int pageNum, String search, String text);

	List<Integer> getFinPageList(int pageNum, String search, String text);

	// 전체글 리스트 카운트(search)
	int getFinListCount(String search, String text);

	// 댓글작성-------------------------------
	int insertEventReply(EventReplyDto eventReplyDto);

	// 댓글수정
	int updateEventReply(EventReplyDto eventReplyDto);

	// 댓글삭제
	int deleteEventReply(String event_re_num);

	// ------------------------------------------------------------------------------------
	// 당첨자 발표 리스트
	List<WinDto> selectWins(int pageNum, String search, String text);

	List<Integer> getWinPageList(int pageNum, String search, String text);

	// 전체글 리스트 카운트(search)
	int getWinListCount(String search, String text);

	WinPreNextBean selectWinPreNext(HttpServletRequest request);

	// 조회수 중복방지
	Cookie updateWinUpHit(HttpServletRequest request, HttpSession session);

}
