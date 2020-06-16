package com.koitt.tim.dao.order;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.koitt.tim.dto.order.OrderListDto;

@Repository
public interface OrderDao {
	int selectOrderCount(@Param("id") String id);

	ArrayList<String> selectOrderNum(@Param("id") String id);

	List<OrderListDto> selectOrderList(@Param("orderNum") String orderNum);
}
