package com.koitt.tim.controller.payment;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koitt.tim.dto.basket.BasketMemberDto;
import com.koitt.tim.dto.basket.CartViewDto;
import com.koitt.tim.dto.coupon.CouponMemBean;
import com.koitt.tim.service.payment.PaymentCartService;

@Controller
public class PaymentCartController {
	@Autowired
	PaymentCartService pcServ;

	@ResponseBody
	@RequestMapping("addOrderCart")
	public int inputOrderCart(@RequestBody HashMap<String, String> ormap, HttpSession session) {
		int check = 1;
		try {
			pcServ.inputOrderCart(ormap, session);
		} catch (Exception e) {
			check = 0;
		}
		return check;
	}

	// 주문할 장바구니목록 가져오기
	@RequestMapping("cartpayment")
	public String cartpayment(HttpSession session, Model model) {
		if (session.getAttribute("loginInfo") != null) {
			// 회원장바구니에서 건너옴
			model.addAttribute("member", pcServ.getMember(session));
		}
		// 장바구니 최종 반영
		int check = pcServ.modifyMemberBasket(session);
		model.addAttribute("check", check);

		// orderpack에 담긴 내역가져오기
		List<BasketMemberDto> dtos = null;
		if (session.getAttribute("orderpack") != null) {
			dtos = pcServ.getCart(session);
		}
		// 해당 상품정보 추가하기.
		List<CartViewDto> cart = null;
		if (dtos != null) {
			cart = pcServ.getCartProduct(dtos);
		}
		if (cart != null && cart.size() != 0) {
			model.addAttribute("list", cart);
		}
		return "/payment/cart_payment";
	}

	@RequestMapping("/coupon_cart_list")
	public String coupon_cart_list(HttpSession session, Model model) {
		List<CouponMemBean> coupons = pcServ.getCoupons(session);
		model.addAttribute("list", coupons);
		return "payment/coupon_cart_list";
	}

}
