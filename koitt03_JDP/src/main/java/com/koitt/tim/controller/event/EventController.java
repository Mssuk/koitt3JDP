//조미선
package com.koitt.tim.controller.event;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.koitt.tim.dto.event.EventDto;
import com.koitt.tim.service.event.EventService;

@Controller
@RequestMapping("event")
public class EventController {

	@Autowired
	EventService eServ;

	@RequestMapping("event")
	public String eventList(Model model, @RequestParam(value = "page", defaultValue = "1") int pageNum) {

		// 정해진 범위의 페이지를 불러옵니다
		List<EventDto> dtos = eServ.selectEvent(pageNum);
		// 하단에 1,2,3,4,5 범위를 불러옵니다.

		model.addAttribute("list", dtos);
		return "event/event";
	}

	@RequestMapping("fin_event")
	public String eventFinList(Model model) {
		List<EventDto> dtos = eServ.selectFinEvent();
		model.addAttribute("list", dtos);
		return "event/fin_event";
	}

	@RequestMapping("event_view")
	public String event_view(Model model, @RequestParam("event_num") String event_num) {
		EventDto dto = eServ.event_view(event_num);
		model.addAttribute("dto", dto);
		return "event/event_view";
	}
}
