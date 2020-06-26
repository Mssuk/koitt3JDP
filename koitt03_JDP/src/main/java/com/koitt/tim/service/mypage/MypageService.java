package com.koitt.tim.service.mypage;

import java.util.ArrayList;
import java.util.List;

import com.koitt.tim.dto.coupon.CouponMemBean;
import com.koitt.tim.dto.order.OrderListDto;

public interface MypageService {

	int countCoupon(String id);

	int havePoint(String id);

	int orderCount(String id);

	ArrayList<String> orderNumList(String id);

	List<OrderListDto> orderList(String OrderNum);

	List<CouponMemBean> getMemberCoupons(String id);
	void subEmail(MemberDto mDto);

	void subBirth(MemberDto mDto);

	void subTel(MemberDto mDto);

	void subPhone(MemberDto mDto);

	//리뷰 작성 중 주문내역 key와 상품번호 출력  -이준희-
	String getReviewKey(String oNum);
	String getReviewPro_num(String oNum);
}
