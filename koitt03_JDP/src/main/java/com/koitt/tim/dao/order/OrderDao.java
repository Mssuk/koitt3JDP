package com.koitt.tim.dao.order;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.koitt.tim.dto.order.OrderDto;

@Repository
public interface OrderDao {
	// 주문 생성
	void insertOrder(@Param("date") String date, @Param("id") String id, @Param("orderPoint") String orderPoint,
			@Param("orderName") String orderName, @Param("orderTel") String orderTel,
			@Param("orderCost") String orderCost);

	// 로그인 id로 주문번호 가져오기
	String selectOrderNum(@Param("id") String id);

	// 주문 리스트 생성
	void insertOrderList(@Param("convertedDate") String convertedDate, @Param("orderNumber") String orderNumber,
			@Param("pro_num") String pro_num, @Param("spinner") String spinner, @Param("pro_price") String pro_price,
			@Param("pro_name") String pro_name);

	// 비회원 주문번호 검색
	OrderDto selectOrderOne(@Param("o_num") String o_num, @Param("o_tel") String o_tel);

}
