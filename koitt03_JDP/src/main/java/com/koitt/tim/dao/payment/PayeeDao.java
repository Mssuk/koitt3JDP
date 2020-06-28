package com.koitt.tim.dao.payment;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.koitt.tim.dto.order.PayeeDto;

@Repository
public interface PayeeDao {

	// 주문에 대한 수취자정보
	List<PayeeDto> selectPayeeInfo(String o_num);

	// 수취자 정보 넣기
	void insertPayeeOne(@Param("o_num") String o_num, @Param("p_name") String p_name,
			@Param("p_address") String p_address, @Param("p_phone") String p_phone, @Param("p_tel") String p_tel,
			@Param("p_demand") String p_demand);

	// 수취자 정보 불러오기
	PayeeDto selectPayeeOne(@Param("o_num") String o_num);

}
