package com.koitt.tim.controller.event;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.koitt.tim.dto.event.EventReplyDto;
import com.koitt.tim.service.event.EventService;

@Controller
@RequestMapping("event")
public class EventReplyController {
	@Autowired
	EventService eServ;

	// 댓글작성
	@RequestMapping("event_reply")
	public String event_reply(@RequestParam(value = "board") String board, EventReplyDto eventReplyDto, Model model) {
		String viewpage = "";
		int check = eServ.insertEventReply(eventReplyDto);
		if (board.equals("event")) {
			viewpage = "redirect:event_view?event_num=" + eventReplyDto.getEvent_num();
		} else if (board.equals("fin_event")) {
			viewpage = "redirect:fin_event_view?event_num=" + eventReplyDto.getEvent_num();
		}
		model.addAttribute("check", check);
		return viewpage;
	}

	// 댓글수정
	@RequestMapping("modify_e_reply")
	public String modify_e_reply(@RequestParam(value = "board") String board, EventReplyDto eventReplyDto,
			Model model) {
		String viewpage = "";
		int check = eServ.updateEventReply(eventReplyDto);
		if (board.equals("event")) {
			viewpage = "redirect:event_view?event_num=" + eventReplyDto.getEvent_num();
		} else if (board.equals("fin_event")) {
			viewpage = "redirect:fin_event_view?event_num=" + eventReplyDto.getEvent_num();
		}
		model.addAttribute("check", check);
		return viewpage;
	}

	// 댓글삭제
	@RequestMapping("delete_e_reply")
	public String delete_e_reply(@RequestParam(value = "board") String board, EventReplyDto eventReplyDto,
			Model model) {
		String viewpage = "";
		System.out.println(eventReplyDto.getEvent_num());
		int check = eServ.deleteEventReply(eventReplyDto.getEvent_re_num());
		if (board.equals("event")) {
			viewpage = "redirect:event_view?event_num=" + eventReplyDto.getEvent_num();
		} else if (board.equals("fin_event")) {
			viewpage = "redirect:fin_event_view?event_num=" + eventReplyDto.getEvent_num();
		}
		model.addAttribute("check", check);
		return viewpage;
	}

}
