//이준희
package com.koitt.tim.service.payment;

import com.koitt.tim.dto.coupon.CouponDto;
import com.koitt.tim.dto.member.MemberCouponDto;
import com.koitt.tim.dto.member.MemberDto;
import com.koitt.tim.dto.product.ProductDto;
import jdk.vm.ci.meta.Local;

import javax.servlet.http.HttpSession;
import java.lang.reflect.Member;
import java.time.LocalDate;
import java.util.List;


public interface PaymentService {


    ProductDto selectOne(String pro_num);

    int couponListSum(String id);

    MemberDto selectOneMember(String member_id);

    List<CouponDto> getCouponList(String id);

    //payment에서 회원정보 수정 반영
    void modifyMember(String id,String name, String address1, String address2, String address3, String pw, String phone, String tel, String email);

    void addOrder(String id, LocalDate date,String spinner,String useCoupon,String orderCost,String orderName,String orderTel);   //주문 생성
}
