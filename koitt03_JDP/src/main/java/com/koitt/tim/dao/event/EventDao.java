package com.koitt.tim.dao.event;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.koitt.tim.dto.event.EventDto;

@Repository
public interface EventDao {
	List<EventDto> selectFinEvent();

	List<EventDto> selectEvent(int page, int limit, String search, String text, int startrow, int endrow);

	int getlistCount(String search, String text);
}
