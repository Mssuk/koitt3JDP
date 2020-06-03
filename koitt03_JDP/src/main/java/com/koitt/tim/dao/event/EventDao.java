package com.koitt.tim.dao.event;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.koitt.tim.dto.event.EventDto;

@Repository
public interface EventDao {
	List<EventDto> selectEvent();

	List<EventDto> selectFinEvent();
}
