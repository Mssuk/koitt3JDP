package com.koitt.tim.service.nonmember;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.koitt.tim.dto.basket.BasketMemberDto;
import com.koitt.tim.dto.basket.CartViewDto;
import com.koitt.tim.dto.order.OrderListDto;

public interface NonmemberService {
	// 비회원 장바구니 아이템 정리
	List<BasketMemberDto> getNonmemCart(HttpSession session);

	// 비회원 장바구니 조회
	List<CartViewDto> getCartProduct(List<BasketMemberDto> dtos);

	// 비회원 주문조회
	int getOrderList(String o_num, String o_tel);

	// 비회원주문리스트 가져오기
	List<OrderListDto> getOrderLists(int pageNum, String o_num);

	int getLastNum(double cnt);

	List<Integer> getOrderPageList(int pageNum, int totalCut);

	// 교환 반품신청시 사용
	String getPhoto(String pro_num);

	OrderListDto getOrderListOne(String key, String o_num);

}
