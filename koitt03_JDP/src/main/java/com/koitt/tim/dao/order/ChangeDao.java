package com.koitt.tim.dao.order;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.koitt.tim.dto.order.ChangeDto;

@Repository
public interface ChangeDao {
	// 주문리스트 번호에 해당하는 c_state를 가져옴
	public String selectChangeState(@Param("key") String key);

	// 반품 교환신청
	public void insertChangeOne(ChangeDto changeDto);

	// 반품 교환신청 철회
	public void deleteChangeOne(@Param("key") String key);

	// 주문취소(입금완료 ,배송전 취소라서 클레임처리)
	public void insertChangeOrder(@Param("key") String key, @Param("c_type") String type);

	// 주문리스트 번호에 해당하는 change를 가져옴
	public ChangeDto selectChangeOne(String key);

}
