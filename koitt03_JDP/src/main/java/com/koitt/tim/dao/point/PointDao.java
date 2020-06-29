package com.koitt.tim.dao.point;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface PointDao {

	int selectPoint(String id);

	// point 전체 합을 가져옴
	int selectPointSum(@Param("id") String id);

	// 멤버포인트 업데이트
	void insertPointMemberOne(@Param("id") String id, @Param("o_num") String o_num, @Param("point") int point,
			@Param("reason") String reason);
}
