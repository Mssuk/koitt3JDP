package com.koitt.tim.service.basket;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

public interface BasketService {

	// 장바구니 추가
	public int insertMemberCart(String pro_num, String count, HttpSession session);

	// 장바구니 삭제(member)
	public int deleteMemberBasket(HttpSession session, HashMap<String, String> reqMap);

	// 장바구니 선택수정
	public int modifyMemberBasket(HttpSession session, HashMap<String, String> reqMap);

	// 장바구니 선택삭제(복수용)
	public int deleteMemberBaskets(HttpSession session, HashMap<String, String> reqMap);

}
