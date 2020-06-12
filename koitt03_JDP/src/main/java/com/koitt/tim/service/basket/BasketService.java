package com.koitt.tim.service.basket;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface BasketService {

	// 장바구니 추가
	public int insertMemberCart(HttpServletRequest request, HttpSession session);
}
