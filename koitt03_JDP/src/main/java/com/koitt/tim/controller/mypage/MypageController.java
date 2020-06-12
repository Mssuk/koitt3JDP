package com.koitt.tim.controller.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MypageController {

    @RequestMapping("coupon_list")
    public String coupon_list(){
        return "mypage/coupon_list";
    }
}
