package com.koitt.tim.dao.payment;

import com.koitt.tim.dto.order.PayeeDto;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PayeeDao {

    //주문에 대한 수취자정보
    List<PayeeDto> selectPayeeInfo(String o_num);

}
