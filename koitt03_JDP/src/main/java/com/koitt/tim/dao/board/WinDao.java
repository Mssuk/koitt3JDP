package com.koitt.tim.dao.board;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.koitt.tim.dto.board.WinDto;

@Repository
public interface WinDao {
	// 당첨자 글 선택
	List<WinDto> selectWins(@Param("p1") int start, @Param("p2") int end, @Param("opt") String search,
			@Param("key") String txt);

	// 페이지계산
	int selectWinListCount(@Param("opt") String search, @Param("key") String txt);

	// 당첨자 글 1개 선택
	WinDto selectWin(@Param("w_num") String w_num);

	// 이전글
	WinDto selectPre(@Param("rnum") int rnum);

	// 다음글
	WinDto selectNext(@Param("rnum") int rnum);

	// 조회수 1증가
	void updateUpHit(@Param("w_num") String w_num);

}
