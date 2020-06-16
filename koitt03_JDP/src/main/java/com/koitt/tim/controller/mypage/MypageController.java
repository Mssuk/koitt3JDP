package com.koitt.tim.controller.mypage;

import com.koitt.tim.dto.member.MemberDto;
import com.koitt.tim.dto.order.OrderListDto;
import com.koitt.tim.service.membership.MembershipService;
import com.koitt.tim.service.mypage.MypageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Collection;
import java.util.List;

@Controller
@RequestMapping("/mypage")
public class MypageController {

    @Autowired
    MembershipService membershipService;

    @Autowired
    MypageService mypageService;

    @RequestMapping("ordercheck")
    public String ordercheck(Model model, HttpSession session){
        MemberDto mDto = (MemberDto) session.getAttribute("loginInfo");

        if(mDto != null) {
            int userCoupon = mypageService.countCoupon(mDto.getId());
            model.addAttribute("userCoupon", userCoupon);

            int userPoint = mypageService.havePoint(mDto.getId());
            model.addAttribute("userPoint", userPoint);

            int orderCount = mypageService.orderCount(mDto.getId());
            model.addAttribute("orderCount", orderCount);

            String orderNum = mypageService.orderNum(mDto.getId());
            List<OrderListDto> list = mypageService.orderList(orderNum);
            System.out.println(list.get(0));
//            model.addAttribute();

        }

        return "mypage/ordercheck";
    }
}