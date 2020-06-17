package com.koitt.tim.service.mypage;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koitt.tim.dao.coupon.CouponDao;
import com.koitt.tim.dao.member.MemberDao;
import com.koitt.tim.dao.order.OrderDao;
import com.koitt.tim.dto.order.OrderListDto;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired
	CouponDao couponDao;

	@Autowired
	MemberDao memberDao;

	@Autowired
	OrderDao orderDao;

	@Override
	public int countCoupon(String id) {

		return couponDao.selectCountCoupon(id);
	}

	@Override
	public int havePoint(String id) {

		return memberDao.selectMemberPoint(id);
	}

	@Override
	public int orderCount(String id) {

		return orderDao.selectOrderCount(id);
	}

	@Override
	public ArrayList<String> orderNum(String id) {
		return orderDao.selectOrderNum1(id); // orderNumber 반출
	}

	@Override
	public List<OrderListDto> orderList(String orderNum) {
		return orderDao.selectOrderList(orderNum);

	}
}
