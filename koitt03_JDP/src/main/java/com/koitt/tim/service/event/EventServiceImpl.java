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

	private static final int ROW_LIMIT = 5; // 밑에 (1,2,3,4,5) 이거 몇개씩 보여줄건지
	private static final int PAGE_LIMIT = 10; // 한페이지에 글 몇개 보여줄건지

	public List<EventDto> selectEvent(int pageNum) {

		// 시작 글넘버
		int startNum = (pageNum - 1) * PAGE_LIMIT + 1;
		int endNum = startNum + PAGE_LIMIT - 1;

		// 끝 글넘버
		return edao.selectEvent(startNum, endNum);
	}

	@Override
	public List<EventDto> selectFinEvent() {
		// TODO Auto-generated method stub
		return edao.selectFinEvent();
	}

	// 이벤트뷰
	@Override
	public EventDto event_view(String event_num) {

		return edao.event_view(event_num);
	}

}
