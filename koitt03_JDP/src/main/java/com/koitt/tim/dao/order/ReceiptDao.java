package com.koitt.tim.dao.order;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ReceiptDao {
	// 영수증 신청 테이블
	void insertReceiptOne(@Param("o_num") String o_num, @Param("r_way") String receiptChk,
			@Param("r_type") String r_type, @Param("r_name") String r_name, @Param("r_num") String r_num);

}
