package com.koitt.tim.service.nonmember;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.koitt.tim.dto.basket.BasketMemberDto;
import com.koitt.tim.dto.basket.CartViewDto;
import com.koitt.tim.dto.order.ChangeDto;
import com.koitt.tim.dto.order.OrderListDto;
import com.koitt.tim.dto.review.ReviewDto;

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

	// 교환 반품신청 창생성시 사용
	String getPhoto(String pro_num);

	// 교환 반품신청 창생성시 사용
	OrderListDto getOrderListOne(String key, String o_num);

	// 교환반품신청
	int doReturn(ChangeDto changeDto);

	// 교환반품신청철회
	int cancelReturn(String key);

	// 반품교환현황
	List<OrderListDto> getClaimLists(int pageNum, String o_num);

	// 반품교환 현황에서 이유
	String getReason(String key);

	// 반품교환사유변경
	int updateReason(ChangeDto changeDto);

	// 리뷰작성
	int insertReview(ReviewDto reviewDto, HttpSession session);

	// 주문취소, 구매확정
	int changeOrder(String o_num, String type);

}
