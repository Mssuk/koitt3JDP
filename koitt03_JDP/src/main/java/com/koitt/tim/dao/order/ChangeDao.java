package com.koitt.tim.dao.order;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.koitt.tim.dto.order.ChangeDto;

import java.util.List;

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

	//모든 반품리스트 가져옴(admin)
	List<ChangeDto> selectAllChange();

	//반품상태 업데이트
	void updateChangeStatus(@Param("key") String key, @Param("type") String c_type, @Param("state") String c_state);

}
