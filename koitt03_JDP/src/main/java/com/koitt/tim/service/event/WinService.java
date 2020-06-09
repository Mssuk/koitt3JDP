package com.koitt.tim.service.event;

import java.util.List;

import com.koitt.tim.dto.board.WinDto;

public interface WinService {
	// 당첨자발표리스트
	List<WinDto> selectWins(int pageNum, String search, String text);

	// 페이지넘버링
	List<Integer> getWinPageList(int pageNum, String search, String text);

	// 조건에 맞는 당첨글개수
	int getWinListCount(String search, String text);

	// 당첨글 1개
	WinDto selectWin(String w_num);

	int getWinLastNum(double cnt);
}
