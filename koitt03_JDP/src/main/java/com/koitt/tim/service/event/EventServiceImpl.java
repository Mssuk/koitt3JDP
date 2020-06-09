package com.koitt.tim.service.event;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koitt.tim.dao.event.EventDao;
import com.koitt.tim.dto.event.EventCouponBean;
import com.koitt.tim.dto.event.EventDto;
import com.koitt.tim.dto.event.EventPreNextBean;
import com.koitt.tim.dto.event.EventReplyBean;
import com.koitt.tim.dto.event.EventReplyDto;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	EventDao edao;

	private static final int ROW_LIMIT = 5; // 밑에 몇개씩 보여줄건지
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

	// 진행중이벤트
	// 페이지리스트(search)
	@Override
	public List<Integer> getPageList(int pageNum, String search, String text) {
		List<Integer> pageList = new ArrayList<>();

		// 총 게시굴 갯수
		double totalCnt = this.getListCount(search, text);
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

	// 이벤트 뷰,쿠폰-------------------------------------
	@Override
	public EventCouponBean selectEventView(String event_num) {
		EventCouponBean couponBean = new EventCouponBean();
		couponBean.setEventDto(edao.selectEventView(event_num));
		couponBean.setCouponDto(edao.selectEventCoupon(event_num));
		return couponBean;
	}

	// 이전글,다음글
	@Override
	public EventPreNextBean selectEventPreNext(int rnum) {
		EventPreNextBean preNextBean = new EventPreNextBean();
		preNextBean.setEventPre(edao.selectEventPre(rnum));
		preNextBean.setEventNext(edao.selectEventNext(rnum));
		return preNextBean;
	}

	// 댓글불러오기
	@Override
	public List<EventReplyBean> selectEventReply(String event_num) {
		// TODO Auto-generated method stub
		return edao.selectEventReply(event_num);
	}
	// 댓글개수

	@Override
	public int getReplyCount(String event_num) {
		return edao.selectReplyCount(event_num);
	}

	// 종료된-검색구현
	// 이벤트 목록(search)
	@Override
	public List<EventDto> selectFinEvent(int pageNum, String search, String text) {
		// 시작 글넘버
		int startNum = (pageNum - 1) * PAGE_LIMIT + 1;
		int endNum = startNum + PAGE_LIMIT - 1;

		// 끝 글넘버
		return edao.selectFinSearchEvent(startNum, endNum, search, text);
	}

	// 검색용 카운트
	@Override
	public int getFinListCount(String search, String text) {
		return edao.selectFinSearchListCount(search, text);
	}

	// 종료된이벤트
	// 페이지리스트(search)
	@Override
	public List<Integer> getFinPageList(int pageNum, String search, String text) {
		List<Integer> pageList = new ArrayList<>();

		// 총 게시굴 갯수
		double totalCnt = this.getFinListCount(search, text);
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

	// 이벤트 뷰,쿠폰-------------------------------------
	@Override
	public EventCouponBean selectFinEventView(String event_num) {
		EventCouponBean couponBean = new EventCouponBean();
		couponBean.setEventDto(edao.selectFinEventView(event_num));
		couponBean.setCouponDto(edao.selectEventCoupon(event_num));
		return couponBean;
	}

	// 이전글,다음글
	@Override
	public EventPreNextBean selectFinEventPreNext(int rnum) {
		EventPreNextBean preNextBean = new EventPreNextBean();
		preNextBean.setEventPre(edao.selectFinEventPre(rnum));
		preNextBean.setEventNext(edao.selectFinEventNext(rnum));
		return preNextBean;
	}

	// ---------------------------------------------------------

	// 댓글작성
	@Override
	public int insertEventReply(EventReplyDto eventReplyDto) {
		int result = 1;
		String id = eventReplyDto.getId();
		String pw = eventReplyDto.getPw();
		if (pw == null)
			pw = "";
		String event_num = eventReplyDto.getEvent_num();
		String event_re_content = eventReplyDto.getEvent_re_content();
		try {
			edao.insertEventReply(id, event_num, pw, event_re_content);
		} catch (Exception e) {
			result = 0;
		}

		return result;
	}

	// 댓글수정
	@Override
	public int updateEventReply(EventReplyDto eventReplyDto) {
		int result = 1;
		String event_re_num = eventReplyDto.getEvent_re_num();
		String event_re_content = eventReplyDto.getEvent_re_content();
		try {
			edao.updateEventReply(event_re_content, event_re_num);
		} catch (Exception e) {
			result = 0;
		}

		return result;
	}

	// 댓글삭제
	@Override
	public int deleteEventReply(String event_re_num) {
		int result = 1;
		try {
			edao.deleteEventReply(event_re_num);
		} catch (Exception e) {
			result = 0;
		}

		return result;
	}

}
