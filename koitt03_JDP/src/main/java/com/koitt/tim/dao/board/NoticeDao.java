package com.koitt.tim.dao.board;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.koitt.tim.dto.board.NoticeDto;

@Repository
public interface NoticeDao {

	List<NoticeDto> selectAllNotice();
}
