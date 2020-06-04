package com.koitt.tim.service.event;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koitt.tim.dao.event.EventDao;
import com.koitt.tim.dto.coupon.CouponDto;
import com.koitt.tim.dto.event.EventDto;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	EventDao edao;

	private static final int ROW_LIMIT = 5; // 밑에 (1,2,3,4,5) 이거 몇개씩 보여줄건지
	private static final int PAGE_LIMIT = 10; // 한페이지에 글 몇개 보여줄건지

	// 마지막 페이지 계산
	@Override
	public int getLastNum(double cnt) {
		return (int) (Math.ceil(cnt / PAGE_LIMIT));
	}

	// -------------------------------검색구현
	// 이벤트 목록(search)
	@Override
	public List<EventDto> selectEvent(int pageNum, String search, String text) {
		// 시작 글넘버
		int startNum = (pageNum - 1) * PAGE_LIMIT + 1;
		int endNum = startNum + PAGE_LIMIT - 1;

		// 끝 글넘버
		return edao.selectSearchEvent(startNum, endNum, search, text);
	}

	// 검색용 카운트
	@Override
	public int getListCount(String search, String text) {
		return edao.selectSearchListCount(search, text);
	}

	// 페이지리스트(search)
	@Override
	public List<Integer> getPageList(int pageNum, String search, String text) {
		List<Integer> pageList = new ArrayList<>();

		// 총 게시굴 갯수
		double totalCnt = this.getListCount(search, text);
		// 총 게시글로 마지막페이지 계산
		int lastPageNum = getLastNum(totalCnt);

		// 현재 페이지를 기준으로 마지막 페이지번호 계산 (예. 현재 6페이지면 6,7,8,9,10 이 나타남)
		int realLastNum = Math.min(lastPageNum, pageNum + 1);

		// 시작페이지 번호 설정 (현재 페이지를 기준으로)
		int realStartNum = (pageNum > 1) ? pageNum - 1 : 1;
		if (realLastNum <= 0)
			realLastNum = 1;
		if (realStartNum <= 0)
			realStartNum = 1;
		// 페이지 번호 할당
		for (int i = realStartNum; i <= realLastNum; i++) {
			pageList.add(i);
		}
		return pageList;
	}

	// 이벤트 뷰-------------------------------------
	@Override
	public EventDto eventView(String event_num) {
		return edao.selectEventView(event_num);
	}

	// 이전글
	@Override
	public EventDto eventViewPre(int rnum) {
		// TODO Auto-generated method stub
		return edao.selectEventPre(rnum);
	}

	// 다음글
	@Override
	public EventDto eventViewNext(int rnum) {
		// TODO Auto-generated method stub
		return edao.selectEventNext(rnum);
	}

	// 쿠폰가져오기
	@Override
	public CouponDto couponView(String coupon_num) {
		// TODO Auto-generated method stub
		return edao.selectCoupon(coupon_num);
	}

}
