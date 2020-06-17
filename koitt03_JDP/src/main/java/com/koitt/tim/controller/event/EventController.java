//조미선
package com.koitt.tim.controller.event;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.koitt.tim.dto.event.EventCouponBean;
import com.koitt.tim.dto.event.EventDto;
import com.koitt.tim.dto.event.EventPreNextBean;
import com.koitt.tim.dto.event.EventReplyBean;
import com.koitt.tim.dto.member.MemberDto;
import com.koitt.tim.service.event.EventService;

@Controller
@RequestMapping("event")
public class EventController {

	@Autowired
	EventService eServ;

	@RequestMapping("event_view")
	public String event_view(Model model, @RequestParam("event_num") String event_num,
			@RequestParam(value = "page", defaultValue = "1") int pageNum,
			@RequestParam(value = "search", defaultValue = "") String search,
			@RequestParam(value = "text", defaultValue = "") String text, HttpSession session) {
		// 멤버정보 가져오기
		if (session.getAttribute("loginInfo") != null) {
			MemberDto mDto = (MemberDto) session.getAttribute("loginInfo");
			model.addAttribute("authuser", mDto.getId());
		}
		// 이벤트,쿠폰
		EventCouponBean viewBean = eServ.selectEventView(event_num);
		// 이전글,다음글
		EventPreNextBean preNext = eServ.selectEventPreNext(viewBean.getEventDto().getRnum());
		// 댓글,멤버정보
		List<EventReplyBean> re_dtos = eServ.selectEventReply(viewBean.getEventDto().getEvent_num());
		// 댓글개수
		int reCount = eServ.getReplyCount(event_num);
		model.addAttribute("event_view", viewBean);
		model.addAttribute("pn_list", preNext);
		model.addAttribute("reply_count", reCount);
		// 목록
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("text", text);
		model.addAttribute("search", search);
		if (re_dtos.size() != 0) {
			model.addAttribute("reply_list", re_dtos);
		}
		return "event/event_view";
	}

	// search
	@RequestMapping("event")
	public String event(Model model, @RequestParam(value = "page", defaultValue = "1") int pageNum,
			@RequestParam(value = "search", defaultValue = "") String search,
			@RequestParam(value = "text", defaultValue = "") String text) {
		// 정해진 범위의 페이지를 불러옵니다
		List<EventDto> dtos = eServ.selectEvent(pageNum, search, text);
		// 하단에 1,2,3,4,5 범위를 불러옵니다.
		List<Integer> pageNumbering = eServ.getPageList(pageNum, search, text);
		// 마지막 페이지 번호
		int maxPage = eServ.getLastNum(eServ.getListCount(search, text));
		if (dtos.size() != 0) {
			model.addAttribute("list", dtos);
		}
		model.addAttribute("pageNumbering", pageNumbering);
		// 마지막페이지 번호입니다.
		model.addAttribute("maxPage", maxPage);
		// 현재 페이지를 알려줍니다
		model.addAttribute("pageNum", pageNum);
		if (dtos != null && text != "") {
			// 검색여부
			model.addAttribute("searchflag", "yes");
			// 검색옵션
			model.addAttribute("text", text);
			// 검색어
			model.addAttribute("search", search);
		}
		return "event/event";
	}

	// =======================종료

	@RequestMapping("fin_event_view")
	public String fin_event_view(Model model, @RequestParam("event_num") String event_num,
			@RequestParam(value = "page", defaultValue = "1") int pageNum,
			@RequestParam(value = "search", defaultValue = "") String search,
			@RequestParam(value = "text", defaultValue = "") String text, HttpSession session) {
		// 멤버정보 가져오기
		if (session.getAttribute("loginInfo") != null) {
			MemberDto mDto = (MemberDto) session.getAttribute("loginInfo");
			model.addAttribute("authuser", mDto.getId());
		}
		// 이벤트,쿠폰
		EventCouponBean viewBean = eServ.selectFinEventView(event_num);
		// 이전글,다음글
		EventPreNextBean preNext = eServ.selectFinEventPreNext(viewBean.getEventDto().getRnum());
		// 댓글,멤버정보
		List<EventReplyBean> re_dtos = eServ.selectEventReply(viewBean.getEventDto().getEvent_num());
		// 댓글개수
		int reCount = eServ.getReplyCount(event_num);
		model.addAttribute("event_view", viewBean);
		model.addAttribute("pn_list", preNext);
		model.addAttribute("reply_count", reCount);
		// 목록
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("text", text);
		model.addAttribute("search", search);
		if (re_dtos.size() != 0) {
			model.addAttribute("reply_list", re_dtos);
		}
		return "event/fin_event_view";
	}

	// search
	@RequestMapping("fin_event")
	public String fin_event(Model model, @RequestParam(value = "page", defaultValue = "1") int pageNum,
			@RequestParam(value = "search", defaultValue = "") String search,
			@RequestParam(value = "text", defaultValue = "") String text) {
		// 정해진 범위의 페이지를 불러옵니다
		List<EventDto> dtos = eServ.selectFinEvent(pageNum, search, text);
		// 하단에 1,2,3,4,5 범위를 불러옵니다.
		List<Integer> pageNumbering = eServ.getFinPageList(pageNum, search, text);
		// 마지막 페이지 번호
		int maxPage = eServ.getLastNum(eServ.getFinListCount(search, text));
		if (dtos.size() != 0) {
			model.addAttribute("list", dtos);
		}
		model.addAttribute("pageNumbering", pageNumbering);
		// 마지막페이지 번호입니다.
		model.addAttribute("maxPage", maxPage);
		// 현재 페이지를 알려줍니다
		model.addAttribute("pageNum", pageNum);
		if (dtos != null && text != "") {
			// 검색여부
			model.addAttribute("searchflag", "yes");
			// 검색옵션
			model.addAttribute("text", text);
			// 검색어
			model.addAttribute("search", search);
		}
		return "event/fin_event";
	}

}