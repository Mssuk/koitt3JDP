package com.koitt.tim.service.event;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koitt.tim.dao.board.WinDao;
import com.koitt.tim.dto.board.WinDto;

@Service
public class WinServiceImpl implements WinService {

	@Autowired
	private WinDao wdao;

	private static final int ROW_LIMIT = 5; // 밑에 몇개씩 보여줄건지
	private static final int PAGE_LIMIT = 10; // 한페이지에 글 몇개 보여줄건지

	@Override
	public List<WinDto> selectWins(int pageNum, String search, String text) {
		// 시작 글넘버
		int startNum = (pageNum - 1) * PAGE_LIMIT + 1;
		int endNum = startNum + PAGE_LIMIT - 1;
		return wdao.selectWins(startNum, endNum, search, text);
	}

	// 마지막 페이지 계산
	@Override
	public int getWinLastNum(double cnt) {
		return (int) (Math.ceil(cnt / PAGE_LIMIT));
	}

	@Override
	public List<Integer> getWinPageList(int pageNum, String search, String text) {
		List<Integer> pageList = new ArrayList<>();

		// 총 게시굴 갯수
		double totalCnt = this.getWinListCount(search, text);
		// 총 게시글로 마지막페이지 계산
		int lastPageNum = getWinLastNum(totalCnt);

		// 시작 페이지 번호 설정
		int startPageNum = ((int) (Math.ceil((double) pageNum / ROW_LIMIT) - 1) * ROW_LIMIT) + 1;

		// 현재 페이지를 기준으로 마지막 페이지번호 계산 (예. 현재 6페이지면 6,7,8,9,10 이 나타남)
		int realLastNum = (lastPageNum > startPageNum + ROW_LIMIT - 1) ? startPageNum + ROW_LIMIT - 1 : lastPageNum;

		// 페이지 번호 할당
		for (int i = startPageNum; i <= realLastNum; i++) {
			pageList.add(i);
		}
		return pageList;
	}

	@Override
	public int getWinListCount(String search, String text) {
		// TODO Auto-generated method stub
		return wdao.getWinListCount(search, text);
	}

	@Override
	public WinDto selectWin(String w_num) {
		return wdao.selectWin(w_num);
	}

}
