package com.koitt.tim.controller.customer;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.koitt.tim.dto.board.NoticeDto;
import com.koitt.tim.dto.board.NoticePreNextBean;
import com.koitt.tim.service.customer.CustomerService;

@Controller
@RequestMapping("customer")
public class NoticeController {

	@Autowired
	CustomerService cServ;

	// 공지사항====================================================
	@RequestMapping("notice")
	public String notice(Model model, @RequestParam(value = "page", defaultValue = "1") int pageNum,
			@RequestParam(value = "search", defaultValue = "") String search,
			@RequestParam(value = "text", defaultValue = "") String text) {
		// 정해진 범위의 페이지를 불러옵니다
		List<NoticeDto> dtos = cServ.selectNotices(pageNum, search, text);
		// 하단에 1,2,3,4,5 범위를 불러옵니다.
		List<Integer> pageNumbering = cServ.getNoticePageList(pageNum, search, text);
		// 마지막 페이지 번호
		int maxPage = cServ.getLastNum(cServ.getNoticeListCount(search, text));
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
		return "customer/notice";
	}

	// 공지사항 글보기
	@RequestMapping("notice_view")
	public String notice_view(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "page", defaultValue = "1") int pageNum,
			@RequestParam(value = "search", defaultValue = "") String search,
			@RequestParam(value = "text", defaultValue = "") String text) {

		// 조회수 증가방지쿠키
		Cookie cookie = cServ.updateNoticeUpHit(request);

		// 현재글 이전글,다음글
		NoticePreNextBean notiView = cServ.selectNoticePreNext(request);
		model.addAttribute("dtos", notiView);
		if (cookie != null) {
			response.addCookie(cookie);
		}
		// 목록
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("search", search);
		model.addAttribute("text", text);
		return "customer/notice_view";
	}

}
