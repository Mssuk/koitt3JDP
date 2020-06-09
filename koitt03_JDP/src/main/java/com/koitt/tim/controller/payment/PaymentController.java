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
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.lang.reflect.Member;
import java.util.List;

@SessionAttributes("admin")
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
        int count = paymentServ.couponListSum((String)session.getAttribute("admin"));

        model.addAttribute("couponCount",count);
        model.addAttribute("spin",spin);
        model.addAttribute("dto",pDto);
        model.addAttribute("mDto", mDtoValue);


        return "payment/payment";
    }

    @RequestMapping("/coupon_list")
    public String coupon_list(Model model,String pro_num, int spin){

        ProductDto pDto = paymentServ.selectOne(pro_num);
        List<CouponDto> getCouponList = paymentServ.getCouponList("abcd1234");


        model.addAttribute("admin","abcd1234");
        model.addAttribute("dto",pDto);         // 넘겨받은 상품 dto
        model.addAttribute("cList",getCouponList);      // 회원 쿠폰 리스트
        model.addAttribute("spin",spin);        // 물품 수량

        return "payment/coupon_list";
    }


}
