package com.koitt.tim.dao.payment;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.koitt.tim.dto.order.PaymentDto;

@Repository
public interface PaymentDao {

	// 주문에 대한 결제내역 가져오기
	List<PaymentDto> selectPaymentInfo(String o_num);

	// 수취자 정보 넣기
	void insertPayeeOne(@Param("o_num") String o_num, @Param("p_name") String p_name,
			@Param("p_address") String p_address, @Param("p_phone") String p_phone, @Param("p_tel") String p_tel,
			@Param("p_demand") String p_demand);

	// 결제정보넣기
	void insertPaymentOne(@Param("o_num") String o_num, @Param("o_way") String o_way, @Param("o_sum") int o_sum,
			@Param("o_coupon_num") String o_coupon_num, @Param("bank") String bank,
			@Param("bank_name") String bank_name);

}
