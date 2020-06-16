package com.koitt.tim.dao.order;

import com.koitt.tim.dto.order.OrderDto;
import com.koitt.tim.dto.order.OrderListDto;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public interface OrderDao {
    int selectOrderCount(@Param("id") String id);

    String selectOrderNum(@Param("id") String id);

    List<OrderListDto> selectOrderList(@Param("orderNum") String orderNum);
}
