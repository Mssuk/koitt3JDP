package com.koitt.tim.service.event;

import java.util.List;

import org.springframework.ui.Model;

import com.koitt.tim.dto.event.EventDto;

public interface EventService {

	List<EventDto> selectFinEvent();

	//List<EventDto> selectEvent(Model model);
	
	//글 목록보기(no search)
	List<EventDto> selectEvent(int pageNum);

	//밑에 나타나는 페이지 넘버링
	List<Integer> getPageList(int pageNum);

	//마지막페이지 번호를 알려줌
	int getLastNum(double cnt);

	//전체글 리스트 카운트(no search)
	int getListCount();

	//전체글 리스트 카운트(search)
	int getlistCount(String search, String text);
}
