package com.koitt.tim.dao.board;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.koitt.tim.dto.board.WinDto;

public interface WinDao {
	// 당첨자 글 선택
	List<WinDto> selectWins(@Param("p1") int start, @Param("p2") int end, @Param("opt") String search,
			@Param("key") String txt);

	// 페이지계산
	int getWinListCount(@Param("opt") String search, @Param("key") String txt);

	// 당첨자 글 1개 선택
	WinDto selectWin(@Param("w_num") String w_num);
}
