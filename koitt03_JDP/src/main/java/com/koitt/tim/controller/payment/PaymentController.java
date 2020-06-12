//이준희

package com.koitt.tim.controller.payment;

import ch.qos.logback.core.CoreConstants;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.koitt.tim.dto.coupon.CouponDto;
import com.koitt.tim.dto.member.MemberCouponDto;
import com.koitt.tim.dto.member.MemberDto;
import com.koitt.tim.dto.product.ProductDto;
import com.koitt.tim.service.payment.PaymentService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.lang.reflect.Member;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@SessionAttributes("admin")
@Controller
@RequestMapping("payment")
public class PaymentController {

    @Autowired
    private PaymentService paymentServ;


    @RequestMapping("/payment")
    public String payment(HttpSession session, String pro_num, Model model, @RequestParam(value = "spinner") int spin) throws Exception{
        ProductDto pDto = paymentServ.selectOne(pro_num);
        MemberDto memDto = paymentServ.selectOneMember((String) session.getAttribute("admin"));
        ObjectMapper objectMapper = new ObjectMapper();

        String mDtoValue = objectMapper.writeValueAsString(memDto);   //JSON으로 바꿔줌.
        int count = paymentServ.couponListSum((String)session.getAttribute("admin"));

        model.addAttribute("memDto",memDto);            //로그인된 회원 정보 가져오기
        model.addAttribute("couponCount",count);        //로그인된 회원의 쿠폰 개수
        model.addAttribute("spin",spin);                //해당상품 개수
        model.addAttribute("dto",pDto);                 //해당상품 정보
        model.addAttribute("mDto", mDtoValue);          //로그인된 회원 정보 - 자바스크립트 관련(정보 불러오기)


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

//    @RequestMapping("/payment.coupon")
//    public String send_to_parent(Model model,String useCoupon){
//
//        model.addAttribute("useCoupon",useCoupon);
//
//        return "payment/payment";
//    }

    @RequestMapping(".modify")      //페이지 중에서 회원정보 수정하면서 <새로고침>
    public String payment_MemberModify(Model model,HttpSession session,String name, String address1,String address2,String address3,String phone,String tel,String email,String spinner,String pro_num){
        System.out.println(address1);
        ProductDto pDto = paymentServ.selectOne(pro_num);
        String id=(String)session.getAttribute("admin");

        paymentServ.modifyMember(id,name,address1,address2,address3,phone,tel,email);   //payment 페이지에서 회원정보 수정 반영

        MemberDto memDto = paymentServ.selectOneMember((String) session.getAttribute("admin"));
        //ObjectMapper objectMapper = new ObjectMapper();

        //String mDtoValue = objectMapper.writeValueAsString(memDto);   //JSON으로 바꿔줌.
        int count = paymentServ.couponListSum((String)session.getAttribute("admin"));

        model.addAttribute("dto",pDto);                 //해당상품 정보
        model.addAttribute("spin",spinner);
        model.addAttribute("memDto",memDto);            //로그인된 회원 정보 가져오기
        model.addAttribute("couponCount",count);        //로그인된 회원의 쿠폰 개수
        //model.addAttribute("mDto", mDtoValue);          //로그인된 회원 정보 - 자바스크립트 관련(정보 불러오기)

        return "payment/payment";
    }



    @RequestMapping("order_clear")
    public String Complete_Order(String spinner,String useCoupon,String orderPoint,String orderCost,String orderName,String orderTel){
        LocalDate date=LocalDate.now();
        String convertedDate = date.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
        paymentServ.addOrder(convertedDate,"abcd1234",orderPoint,orderName,orderTel,orderCost);
        return "payment/order_clear";
    }


}
