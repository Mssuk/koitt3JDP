package com.koitt.tim.dao.event;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.koitt.tim.dto.event.EventDto;

@Repository
public interface EventDao {
	List<EventDto> selectFinEvent();

	// List<EventDto> selectEvent(int page, int limit, String search, String text,
	// int startrow, int endrow);
	// 페이지 나눠서 글 갖고옴
	List<EventDto> selectEvent(@Param("p1") int start, @Param("p2") int end);

	EventDto event_view(String ev_num);
	//페이지 나눠서 글 갖고옴(search)
	List<EventDto> selectEvent(@Param("p1") int start, @Param("p2") int end, @Param("p3") String keyword);


	//전체 개수 카운트(no search)
	int selectListCount();

}
