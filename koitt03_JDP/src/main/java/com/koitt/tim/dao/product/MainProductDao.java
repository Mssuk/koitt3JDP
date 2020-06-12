package com.koitt.tim.dao.product;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface MainProductDao {

	// 메인 상품 자동등록
	void insertMProduct(@Param("p1") String pro_num);

}
