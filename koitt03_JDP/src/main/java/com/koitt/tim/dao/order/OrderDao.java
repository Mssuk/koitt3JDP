package com.koitt.tim.dao.order;

import java.time.LocalDate;

public interface OrderDao {
    void insertOrder(String id, LocalDate date, String spinner, String useCoupon, String orderCost, String orderName, String orderTel);
}
