package com.koitt.tim.service.customer;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koitt.tim.dao.board.NoticeDao;
import com.koitt.tim.dto.board.NoticeDto;
import com.koitt.tim.dto.board.NoticePreNextBean;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private NoticeDao ndao;

	private static final int ROW_LIMIT = 5; // 밑에 몇개씩 보여줄건지
	private static final int PAGE_LIMIT = 10; // 한페이지에 글 몇개 보여줄건지

	// 마지막 페이지 계산
	@Override
	public int getLastNum(double cnt) {
		return (int) (Math.ceil(cnt / PAGE_LIMIT));
	}

	// 공지사항리스트
	@Override
	public List<NoticeDto> selectNotices(int pageNum, String search, String text) {
		// 시작 글넘버
		int startNum = (pageNum - 1) * PAGE_LIMIT + 1;
		// 끝 글넘버
		int endNum = startNum + PAGE_LIMIT - 1;

		return ndao.selectAllNotice(startNum, endNum, search, text);
	}

	// 페이지넘버링
	@Override
	public List<Integer> getNoticePageList(int pageNum, String search, String text) {
		List<Integer> pageList = new ArrayList<>();

		// 총 게시굴 갯수
		double totalCnt = this.getNoticeListCount(search, text);
		// 총 게시글로 마지막페이지 계산
		int lastPageNum = getLastNum(totalCnt);

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

	// 공지개수
	@Override
	public int getNoticeListCount(String search, String text) {
		return ndao.selectNoticeListCount(search, text);
	}

	// 공지 조회수증가
	@Override
	public Cookie updateNoticeUpHit(HttpServletRequest request) {
		String id = "";
		if (request.getParameter("id") != null) {
			id = request.getParameter("id");
		}
		String n_num = request.getParameter("n_num");
		Cookie cookie = null;
		int count = 0;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals("winView_" + id + "ke" + n_num + "00")) {
					count = 2;
					break;
				} // 쿠키 이름 찾기(if)
			}
		}
		// 쿠키값 검색(for)
		if (count == 0) {
			ndao.updateUpHit(n_num);
			cookie = new Cookie("winView_" + id + "ke" + n_num + "00", n_num + "/");
			cookie.setMaxAge(60 * 60 * 24 * 30);
		} // 쿠키가 없을경우 생성
		return cookie;
	}

	// 공지-현재,이전,다음글
	@Override
	public NoticePreNextBean selectNoticePreNext(HttpServletRequest request) {
		String n_num = request.getParameter("n_num");
		NoticePreNextBean bean = new NoticePreNextBean();
		bean.setDto(ndao.selectNotice(n_num));
		bean.setPre(ndao.selectPre(bean.getDto().getRnum()));
		bean.setNext(ndao.selectNext(bean.getDto().getRnum()));
		return bean;
	}

}
