package com.koitt.tim.controller.mypage;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.koitt.tim.dto.member.MemberDto;
import com.koitt.tim.dto.order.OrderListDto;
import com.koitt.tim.service.membership.MembershipService;
import com.koitt.tim.service.mypage.MypageService;
import com.koitt.tim.service.nonmember.NonmemberService;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	MembershipService membershipService;

	@Autowired
	MypageService mypageService;

	@Autowired
	NonmemberService nServ;

	@RequestMapping("ordercheck")
	public String ordercheck(Model model, HttpSession session) {
		MemberDto mDto = (MemberDto) session.getAttribute("loginInfo");
		List<OrderListDto> listDto;

		if (mDto != null) {
			int userCoupon = mypageService.countCoupon(mDto.getId());
			model.addAttribute("userCoupon", userCoupon);

			int userPoint = mypageService.havePoint(mDto.getId());
			model.addAttribute("userPoint", userPoint);

			int orderCount = mypageService.orderCount(mDto.getId());
			model.addAttribute("orderCount", orderCount);

			// o_num 전체를 불러와 ArrayList에 저장 _나동수
			ArrayList<String> orderNumList = mypageService.orderNumList(mDto.getId()); // 해당 ID로 등록된 o_num들 전체 불러옴..?
			System.out.println(orderNumList.get(0));
			System.out.println(orderNumList.get(1));
			System.out.println(orderNumList.get(2));
			System.out.println(orderNumList.get(3));
			System.out.println(orderNumList.get(4));
			System.out.println(orderNumList.get(5));
			// 불러온 o_num을 이용해 orderList 불러오기 _나동수
			for (int i = 0; i <= orderNumList.size(); i++) {
				listDto = mypageService.orderList(orderNumList.get(i));
				System.out.println("controller" + listDto.get(i));
				model.addAttribute("orderList", listDto);
			}
		}
		return "mypage/ordercheck";
	}

	@RequestMapping("return")
	public String viewreturn(@RequestParam(value = "num1", defaultValue = "") String key,
			@RequestParam(value = "num2", defaultValue = "") String o_num, Model model) {

		OrderListDto odto = nServ.getOrderListOne(key, o_num);
		String photo = nServ.getPhoto(odto.getPro_num());
		System.out.println(photo);
		model.addAttribute("odto", odto);
		model.addAttribute("photo", photo);
		return "nonmember/return";
	}

}