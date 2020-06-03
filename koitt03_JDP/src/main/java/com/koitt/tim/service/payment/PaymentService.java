//이준희
package com.koitt.tim.service.payment;

import com.koitt.tim.dto.member.MemberDto;
import com.koitt.tim.dto.product.ProductDto;


public interface PaymentService {

    ProductDto selectOne(String pro_num);

    MemberDto selectOneMember(String member_id);
}
