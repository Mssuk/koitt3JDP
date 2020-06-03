package com.koitt.tim.service.event;

import java.util.List;

import org.springframework.ui.Model;

import com.koitt.tim.dto.event.EventDto;

public interface EventService {

	List<EventDto> selectFinEvent();

	//List<EventDto> selectEvent(Model model);
	List<EventDto> selectEvent(int pageNum);

	int getlistCount(String search, String text);
}
