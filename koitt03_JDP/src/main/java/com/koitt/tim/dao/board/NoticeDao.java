package com.koitt.tim.dao.board;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.koitt.tim.dto.board.NoticeDto;

@Repository
public interface NoticeDao {

	// 모든 공지사항 갖고옴
	List<NoticeDto> selectAllNotice();

	// 공지사항 추가
	void insertNotice(NoticeDto nDto);
}
