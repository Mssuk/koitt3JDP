package com.koitt.tim.dao.order;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.koitt.tim.dto.order.GetOrderNum;
import com.koitt.tim.dto.order.OrderDto;
import com.koitt.tim.dto.order.OrderListDto;
import com.koitt.tim.dto.product.ProductDto;

@Repository
public interface OrderDao {

	int selectOrderCount(@Param("id") String id);

	// 로그인 id로 주문번호 가져오기
	String selectOrderNum1(@Param("id") String id);

	ArrayList<String> selectOrderNumList(String id);

	// 주문 번호를 이용해 주문명세 가져오기(나동수)
	List<OrderListDto> selectOrderList(String orderNum);

	// 주문 생성
	void insertOrder(@Param("date") String date, @Param("id") String id, @Param("orderPoint") String orderPoint,
			@Param("orderName") String orderName, @Param("orderTel") String orderTel,
			@Param("orderCost") String orderCost);

	// 주문 리스트 생성
	void insertOrderList(@Param("convertedDate") String convertedDate, @Param("orderNumber") String orderNumber,
			@Param("pro_num") String pro_num, @Param("spinner") String spinner, @Param("pro_price") String pro_price,
			@Param("pro_name") String pro_name);

	String selectOneOrder(@Param("o_num") String o_num, @Param("orderTel") String orderTel);

	// 비회원 주문번호 검색
	OrderDto selectOrderOne(@Param("o_num") String o_num, @Param("o_tel") String o_tel);

	// 비회원주문내역검색(id없음)
	List<OrderListDto> selectOrderListNone(@Param("orderNum") String o_num, @Param("p1") int startNum,
			@Param("p2") int endNum);

	// 교환반품신청시 가져오는 주문목록 1개
	OrderListDto selectOrderListOne(@Param("key") String key, @Param("orderNum") String o_num);

	// 주문취소
	void updateOrderOne(@Param("orderNum") String o_num, @Param("o_status") String o_status);

	// 반품 교환현황 리스트
	List<OrderListDto> selectClaimListNone(@Param("orderNum") String o_num, @Param("p1") int startNum,
			@Param("p2") int endNum);

	// 구매확정시 update_date 갱신
	void updateOrderDate(@Param("orderNum") String o_num);

	// admin (모든 주문 가져오기)
	List<OrderDto> selectAllOrder();

	// admin (모든 주문내역 가져오기)
	List<OrderListDto> selectAllOL();

	// admin (주문에있는 상품정보들 가져오기)
	List<ProductDto> selectOrderProInfo();
	// 상품번호로 상품 주문했던 주문 키 가져오기(리뷰 작성에 쓰임)

	// admin (주문상태 변경)
	void updateOrderStatus(String o_num, String o_status);

	// 상품번호로 상품 주문했던 주문 키 가져오기(리뷰 작성에 쓰임)

//	String selectOrderKey(String pro_num,String id);

	// 장바구니~~~>구매
	// 1.order주문
	void insertOrderOne(GetOrderNum getOrderNum);

	// 2.orderlist 삽입
	void insertOrderlistOne(@Param("orderDay") String orderDay, @Param("o_num") String o_num,
			@Param("pro_num") String pro_num, @Param("product_name") String product_name, @Param("o_quant") int o_quant,
			@Param("product_price") int product_price);

}
