package com.koitt.tim.service.event;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koitt.tim.dao.event.EventDao;
import com.koitt.tim.dto.event.EventDto;

@Service
public class EventServiceImpl implements EventService {
	@Autowired
	EventDao edao;

	@Override
	public List<EventDto> selectEvent() {
		// TODO Auto-generated method stub
		return edao.selectEvent();
	}

	@Override
	public List<EventDto> selectFinEvent() {
		// TODO Auto-generated method stub
		return edao.selectFinEvent();
	}

}
