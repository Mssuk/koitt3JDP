package com.koitt.tim.dao.order;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ChangeDao {
	// 주문리스트 번호에 해당하는 c_state를 가져옴
	public String selectChangeState(@Param("key") String key);
}
