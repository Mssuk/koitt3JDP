package com.koitt.tim.service.mypage;

import com.koitt.tim.dto.order.OrderListDto;

import java.util.List;

public interface MypageService {

    int countCoupon(String id);

    int havePoint(String id);

    int orderCount(String id);

    String orderNum(String id);

    List<OrderListDto> orderList(String orderNum);
}
