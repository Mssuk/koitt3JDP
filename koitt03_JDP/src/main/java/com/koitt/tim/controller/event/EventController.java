//조미선
package com.koitt.tim.controller.event;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koitt.tim.dto.event.EventDto;
import com.koitt.tim.service.event.EventService;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("event")
public class EventController {

	@Autowired
	EventService eServ;

	//normal
	@RequestMapping("event")
	public String eventList(Model model, @RequestParam(value="page", defaultValue = "1") int pageNum) {

		//정해진 범위의 페이지를 불러옵니다
		List<EventDto> dtos = eServ.selectEvent(pageNum);
		//하단에 1,2,3,4,5 범위를 불러옵니다.
		List<Integer> pageNumbering = eServ.getPageList(pageNum);
		//마지막 페이지 번호
		int maxPage = eServ.getLastNum(eServ.getListCount());

		model.addAttribute("list", dtos);
		model.addAttribute("pageNumbering", pageNumbering);

		//마지막페이지 번호입니다.
		model.addAttribute("maxPage", maxPage);
		//현재 페이지를 알려줍니다
		model.addAttribute("pageNum", pageNum);
		return "event/event";
	}

	
	@RequestMapping("fin_event")
	public String eventFinList(Model model) {
		List<EventDto> dtos = eServ.selectFinEvent();
		model.addAttribute("list", dtos);
		return "event/fin_event";
	}
}
