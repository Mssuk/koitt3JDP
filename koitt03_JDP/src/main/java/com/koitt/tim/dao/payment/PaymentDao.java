package com.koitt.tim.dao.payment;

import com.koitt.tim.dto.order.PaymentDto;
import com.koitt.tim.dto.product.ProductDto;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PaymentDao {

    //주문에 대한 결제내역 가져오기
    List<PaymentDto> selectPaymentInfo(String o_num);


}
