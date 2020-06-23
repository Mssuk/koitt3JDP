package com.koitt.tim.service.mypage;

import java.util.ArrayList;
import java.util.List;

import com.koitt.tim.dto.member.MemberDto;
import com.koitt.tim.dto.order.OrderListDto;

public interface MypageService {

	int countCoupon(String id);

	int havePoint(String id);

	int orderCount(String id);

	ArrayList<String> orderNumList(String id);

	List<OrderListDto> orderList(String OrderNum);

	void subEmail(MemberDto mDto);

	void subBirth(MemberDto mDto);

	void subTel(MemberDto mDto);

	void subPhone(MemberDto mDto);
}
