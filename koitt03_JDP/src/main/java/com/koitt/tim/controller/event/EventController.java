package com.koitt.tim.controller.event;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EventController {

	@RequestMapping("event")
	public String event(Model model) {
		return "event/event";
	}

}
