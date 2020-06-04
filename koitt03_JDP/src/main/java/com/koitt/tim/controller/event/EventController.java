//조미선
package com.koitt.tim.controller.event;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.koitt.tim.dto.coupon.CouponDto;
import com.koitt.tim.dto.event.EventDto;
import com.koitt.tim.dto.event.EventReplyDto;
import com.koitt.tim.service.event.EventService;

@Controller
@RequestMapping("event")
public class EventController {

	@Autowired
	EventService eServ;

	@RequestMapping("event_view")
	public String event_view(Model model, @RequestParam("event_num") String event_num) {
		EventDto dto = eServ.eventView(event_num);
		EventDto dto2 = eServ.eventViewPre(dto.getRnum());
		EventDto dto3 = eServ.eventViewNext(dto.getRnum());
		CouponDto coupon = eServ.couponView(dto.getCoupon_num());
		List<EventReplyDto> re_dtos = eServ.selectEventReply(dto.getEvent_num());
		model.addAttribute("dto", dto);
		model.addAttribute("pre", dto2);
		model.addAttribute("next", dto3);
		model.addAttribute("coupon", coupon);
		if (re_dtos.size() != 0) {
			model.addAttribute("replyList", re_dtos);
			System.out.println(re_dtos.get(0).getEvent_re_num());
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

}