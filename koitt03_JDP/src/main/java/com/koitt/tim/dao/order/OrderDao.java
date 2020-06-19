package com.koitt.tim.dao.order;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.koitt.tim.dto.order.OrderDto;
import com.koitt.tim.dto.order.OrderListDto;

@Repository
public interface OrderDao {

    int selectOrderCount(@Param("id") String id);

	// 로그인 id로 주문번호 가져오기
	String selectOrderNum1(@Param("id") String id);

	ArrayList<String> selectOrderNum2(@Param("id") String id);

	// 주문 생성
	void insertOrder(@Param("date") String date, @Param("id") String id, @Param("orderPoint") String orderPoint,
			@Param("orderName") String orderName, @Param("orderTel") String orderTel,
			@Param("orderCost") String orderCost);

	// 주문 리스트 생성
	void insertOrderList(@Param("convertedDate") String convertedDate, @Param("orderNumber") String orderNumber,
			@Param("pro_num") String pro_num, @Param("spinner") String spinner, @Param("pro_price") String pro_price,
			@Param("pro_name") String pro_name);

	String selectOneOrder(@Param("o_num") String o_num, @Param("orderTel") String orderTel);

	List<OrderListDto> selectOrderList(@Param("orderNum") String orderNum);

	// 비회원 주문번호 검색
	OrderDto selectOrderOne(@Param("o_num") String o_num, @Param("o_tel") String o_tel);

	// 비회원주문내역검색(id없음)
	List<OrderListDto> selectOrderListNone(@Param("orderNum") String o_num, @Param("p1") int startNum,
			@Param("p2") int endNum);

	// 주문 번호를 이용해 주문명세 가져오기(나동수)
    List<OrderListDto> selectOrderList(@Param("orderNum") String orderNum);
	// 교환반품신청시 가져오는 주문목록 1개
	OrderListDto selectOrderListOne(@Param("key") String key, @Param("orderNum") String o_num);

	// 주문취소
	void updateOrderOne(@Param("orderNum") String o_num, @Param("o_type") String o_type);

	// 반품 교환현황 리스트
	List<OrderListDto> selectClaimListNone(@Param("orderNum") String o_num, @Param("p1") int startNum,
			@Param("p2") int endNum);

}
