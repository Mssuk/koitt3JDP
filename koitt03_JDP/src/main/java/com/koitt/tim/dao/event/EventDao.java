package com.koitt.tim.dao.event;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.koitt.tim.dto.event.EventDto;

@Repository
public interface EventDao {
	List<EventDto> selectFinEvent();

	//List<EventDto> selectEvent(int page, int limit, String search, String text, int startrow, int endrow);
	//페이지 나눠서 글 갖고옴
	List<EventDto> selectEvent(@Param("p1") int start, @Param("p2") int end);

	int getlistCount(String search, String text);
}
