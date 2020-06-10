package com.koitt.tim.service.customer;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import com.koitt.tim.dto.board.NoticeDto;
import com.koitt.tim.dto.board.NoticePreNextBean;

public interface CustomerService {
	// 공지글 불러오기
	List<NoticeDto> selectNotices(int pageNum, String search, String text);

	// 공지글 페이징
	List<Integer> getNoticePageList(int pageNum, String search, String text);

	// 공지글 개수 세기
	int getNoticeListCount(String search, String text);

	// 마지막번호
	int getLastNum(double cnt);

	// 조회수무한증가방지 쿠키
	Cookie updateNoticeUpHit(HttpServletRequest request);

	// 공지-현재,이전,다음글
	NoticePreNextBean selectNoticePreNext(HttpServletRequest request);

}
