package com.koitt.tim.controller.event;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.koitt.tim.dto.board.WinDto;
import com.koitt.tim.service.event.WinService;

@Controller
@RequestMapping("event")
public class WinController {

	@Autowired
	WinService wServ;

	@RequestMapping("prizewinner")
	public String prizewinner(Model model, @RequestParam(value = "page", defaultValue = "1") int pageNum,
			@RequestParam(value = "search", defaultValue = "") String search,
			@RequestParam(value = "text", defaultValue = "") String text) {
		// 정해진 범위의 페이지를 불러옵니다
		List<WinDto> dtos = wServ.selectWins(pageNum, search, text);
		// 하단에 1,2,3,4,5 범위를 불러옵니다.
		List<Integer> pageNumbering = wServ.getWinPageList(pageNum, search, text);
		// 마지막 페이지 번호
		int maxPage = wServ.getWinLastNum(wServ.getWinListCount(search, text));
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
		return "event/prizewinner";
	}
}
