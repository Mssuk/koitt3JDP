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
}
