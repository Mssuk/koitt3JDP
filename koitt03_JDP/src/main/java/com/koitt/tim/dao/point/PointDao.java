package com.koitt.tim.dao.point;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface PointDao {

	int selectPoint(String id);

	// point 전체 합을 가져옴
	int selectPointSum(@Param("id") String id);
}
