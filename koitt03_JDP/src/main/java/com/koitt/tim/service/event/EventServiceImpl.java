package com.koitt.tim.service.event;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.koitt.tim.dao.event.EventDao;
import com.koitt.tim.dto.event.EventDto;

@Service
public class EventServiceImpl implements EventService {
	@Autowired
	EventDao edao;

	@Override
	public List<EventDto> selectEvent(Model model) {
		HttpServletRequest request = (HttpServletRequest) model.getAttribute("request");
		// 검색변수
		int page = 1;// 최초기본 1페이지 세팅
		int limit = 10;// 1페이지=게시글 10개
		String searchflag = request.getParameter("searchflag");
		String search = request.getParameter("search");// 전체 제목 내용
		String text = request.getParameter("text");// 검색어

		if (search == null)
			search = "";
		if (text == null)
			text = "";
		// page가 넘어온게 있을경우..ex)4..
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		// 전체 게시글 count(*) //검색창 추가로 변수 2개 추가
		int listcount = getlistCount(search, text);
		// 최대 페이지 수
		int maxpage = (int) ((double) listcount / limit + 0.95);
		// 처음페이지
		int startpage = (((int) ((double) page / limit + 0.95)) - 1) * limit + 1;
		// 마지막페이지
		int endpage = maxpage; // 총 페이지 개수가 1~10까지는 maxpage가 endpage가 됨.
		// 11페이지 이후 endpage
		if (endpage > startpage + limit - 1)
			endpage = startpage + limit - 1;

		// 하단 페이지 번호를 위한 5개의 변수
		model.addAttribute("listcount", listcount);
		model.addAttribute("page", page);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);

		// search를 사용하면 넘어가는 것
		if (search != "") {
			searchflag = "1";
			model.addAttribute("searchflag", searchflag);
			model.addAttribute("search", search);
			model.addAttribute("text", text);
		}
		return edao.selectEvent(page, limit, search, text);
	}

	@Override
	public List<EventDto> selectFinEvent() {
		// TODO Auto-generated method stub
		return edao.selectFinEvent();
	}

	@Override
	public int getlistCount(String search, String text) {

		return edao.getlistCount(search, text);
	}

}
