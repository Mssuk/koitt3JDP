//이준희
package com.koitt.tim.service.payment;

import com.koitt.tim.dto.coupon.CouponDto;
import com.koitt.tim.dto.member.MemberCouponDto;
import com.koitt.tim.dto.member.MemberDto;
import com.koitt.tim.dto.product.ProductDto;

import java.lang.reflect.Member;
import java.util.List;


public interface PaymentService {

    List<MemberCouponDto> getMemberCouponDto();

    ProductDto selectOne(String pro_num);

    int couponListSum();

    MemberDto selectOneMember(String member_id);

    List<CouponDto> getCouponList();
}
