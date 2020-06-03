package com.koitt.tim.service.event;

import java.util.List;

import com.koitt.tim.dto.event.EventDto;

public interface EventService {

	List<EventDto> selectEvent();

	List<EventDto> selectFinEvent();
}
