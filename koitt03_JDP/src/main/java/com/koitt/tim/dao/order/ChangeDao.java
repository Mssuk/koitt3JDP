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

	// 주문리스트 번호에 해당하는 change를 가져옴
	public ChangeDto selectChangeOne(String key);

	// 반품교환사유변경
	public void updateChange(ChangeDto changeDto);

}
