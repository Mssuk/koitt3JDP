package com.koitt.tim.controller.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MypageController {

    @RequestMapping("ordercheck")
    public String ordercheck(){

        return "mypage/ordercheck";
    }
}