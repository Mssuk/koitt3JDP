package com.koitt.tim.service.customer;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.koitt.tim.dto.board.FaqDto;
import com.koitt.tim.dto.board.NoticeDto;
import com.koitt.tim.dto.board.NoticePreNextBean;
import com.koitt.tim.dto.question.QuestionDto;

public interface CustomerService {
	// 공지글 불러오기
	List<NoticeDto> selectNotices(int pageNum, String search, String text);

	// 공지글 페이징
	List<Integer> getNoticePageList(int pageNum, String search, String text);

	// 공지글 개수 세기
	int getNoticeListCount(String search, String text);

	// 마지막번호
	int getLastNum(double cnt);

	// 조회수무한증가방지 세션
	Cookie updateNoticeUpHit(HttpServletRequest request, HttpSession session);

	// 공지-현재,이전,다음글
	NoticePreNextBean selectNoticePreNext(HttpServletRequest request);

	/// =======FAQ
	// FAQ불러오기
	List<FaqDto> selectFaqs(int pageNum, String faq_type, String search, String text);

	// 하단 페이지넘버링
	List<Integer> getFaqPageList(int pageNum, String faq_type, String search, String text);

	// FAQ글 개수세기
	int getFaqListCount(String faq_type, String search, String text);

	// 1:1문의 글쓰기
	void insertQuestion(QuestionDto qDto);

}
