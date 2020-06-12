package com.koitt.tim.controller.basket;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koitt.tim.service.basket.BasketService;

@Controller
public class BasketController {
	@Autowired
	BasketService bServ;

	// 장바구니담기
	@ResponseBody
	@RequestMapping("/putCart")
	public int putCart(HttpServletRequest request, HttpSession session, HttpServletResponse response) {
		int bascheck = 1;
		Cookie cookie = null;
		// 로그인시 장바구니 담기
		if (session.getAttribute("id") != null) {
			bascheck = bServ.insertMemberCart(request, session);
		} else {
			long bas_cookie = System.currentTimeMillis();
			cookie = new Cookie("bas_koti" + bas_cookie,
					request.getParameter("pro_num") + "_" + request.getParameter("count"));
		} // 비회원일경우 장바구니 개수 +1 이아닌 덮어쓰기로..
		if (cookie != null) {
			response.addCookie(cookie);
		}
		return bascheck;
	}

	// 장바구니 가기
	@RequestMapping("/goCart")
	public String goCart(HttpSession session, HttpServletRequest request) {
		String viewpage = "redirect:nonmember/cart";
		if (session.getAttribute("id") != null) {
			viewpage = "redirect:mypage/cart";
		}
		return viewpage;
	}
}
