package com.koitt.tim.service.payment;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.koitt.tim.dto.basket.BasketMemberDto;
import com.koitt.tim.dto.basket.CartViewDto;
import com.koitt.tim.dto.coupon.CouponMemBean;
import com.koitt.tim.dto.member.MemberDto;
import com.koitt.tim.dto.order.DoOrderDto;
import com.koitt.tim.dto.order.OrderConfirmBean;

public interface PaymentCartService {
	// order로 들어올때 담은 장바구니를 가져옴
	List<BasketMemberDto> getCart(HttpSession session);

	// 장바구니에 해당하는 상품정보를 가져옴
	List<CartViewDto> getCartProduct(List<BasketMemberDto> dtos);

	// 넘어온 orderpack만큼 장바구니 수정
	int modifyMemberBasket(HttpSession session);

	// id에 해당하는 멤버가져오기
	MemberDto getMember(HttpSession session);

	// 장바구니서 구매할 상품 session에 담아버리는 메소드 :D
	void inputOrderCart(HashMap<String, String> ormap, HttpSession session);

	// 쿠폰가져오기
	List<CouponMemBean> getCoupons(HttpSession session);

	// 주문하기!
	String doOrderCart(DoOrderDto doOrderDto, HttpSession session);

	// 주문정보가져오기
	OrderConfirmBean getOrderInfo(String o_num);

}
