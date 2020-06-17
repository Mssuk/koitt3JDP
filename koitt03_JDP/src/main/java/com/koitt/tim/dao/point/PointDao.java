package com.koitt.tim.dao.point;

import org.springframework.stereotype.Repository;

@Repository
public interface PointDao {

    int selectPoint(String id);
}
