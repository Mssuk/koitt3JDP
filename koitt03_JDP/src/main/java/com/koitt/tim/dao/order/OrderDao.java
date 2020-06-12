package com.koitt.tim.dao.order;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;

@Repository
public interface OrderDao {
    void insertOrder(@Param("id")String id, @Param("date")String date, @Param("spinner")String spinner, @Param("useCoupon")String useCoupon, @Param("orderPoint")String orderPoint, @Param("orderCost")String orderCost, @Param("orderName")String orderName, @Param("orderTel")String orderTel);
}
