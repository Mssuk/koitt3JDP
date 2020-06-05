//이준희

package com.koitt.tim.controller.payment;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.koitt.tim.dto.coupon.CouponDto;
import com.koitt.tim.dto.member.MemberCouponDto;
import com.koitt.tim.dto.member.MemberDto;
import com.koitt.tim.dto.product.ProductDto;
import com.koitt.tim.service.payment.PaymentService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.lang.reflect.Member;
import java.util.List;

@Controller
@RequestMapping("payment")
public class PaymentController {

    @Autowired
    private PaymentService paymentServ;


    @RequestMapping("/payment")
    public String payment(HttpSession session, String pro_num, Model model, @RequestParam("spinner") int spin) throws Exception{
        ProductDto pDto = paymentServ.selectOne(pro_num);
        MemberDto mDto = paymentServ.selectOneMember((String) session.getAttribute("admin"));
        ObjectMapper objectMapper = new ObjectMapper();
        String mDtoValue = objectMapper.writeValueAsString(mDto);   //JSON으로 바꿔줌.
        int count = paymentServ.couponListSum();
        List<MemberCouponDto> memberCoupondtos = paymentServ.getMemberCouponDto();
        String mcDtoValue = objectMapper.writeValueAsString(memberCoupondtos);


        model.addAttribute("memberCouponList",mcDtoValue);
        model.addAttribute("couponCount",count);
        model.addAttribute("spin",spin);
        model.addAttribute("dto",pDto);
        model.addAttribute("mDto", mDtoValue);
        return "payment/payment";
    }

    @RequestMapping("/Child")
    public String couponBook(HttpSession session, Model model){

        List<CouponDto> getCouponList = paymentServ.getCouponList();
        model.addAttribute("cList",getCouponList);
        return "payment/Child";
    }


}
