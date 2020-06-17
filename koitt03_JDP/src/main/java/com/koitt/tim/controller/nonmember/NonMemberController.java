package com.koitt.tim.controller.nonmember;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koitt.tim.dto.basket.BasketMemberDto;
import com.koitt.tim.dto.basket.CartViewDto;
import com.koitt.tim.service.nonmember.NonmemberService;

@Controller
@RequestMapping("nonmember")
public class NonMemberController {
	@Autowired
	NonmemberService nServ;

	// 비회원 장바구니
	@RequestMapping("cart")
	public String getNonCart(Model model, HttpSession session) {
		List<BasketMemberDto> dtos = null;
		if (session.getAttribute("baspack") != null) {
			dtos = nServ.getNonmemCart(session);
		}
		List<CartViewDto> cart = null;
		if (dtos != null) {
			cart = nServ.getCartProduct(dtos);
		}
		if (cart != null) {
			model.addAttribute("list", cart);
		}
		return "nonmember/cart";
	}

	// 비회원 주문조회
	@ResponseBody
	@RequestMapping("ordercheck")
	public int getNonOrderCheck(@RequestBody HashMap<String, String> reqMap) {
		int orch = 1;
		String o_num = reqMap.get("o_num");
		String o_tel = reqMap.get("o_tel");
		orch = nServ.getOrderList(o_num, o_tel);

		return orch;
	}

	@RequestMapping("ordercheck_view")
	public String ordercheck_view(@RequestParam(value = "o_num") String o_num) {

		return "nonmember/ordercheck";
	}

	@RequestMapping("takeback_delivery")
	public String getTakebackDelevery() {

		return "nonmember/takeback_delivery";
	}

	@RequestMapping("takeback_state")
	public String getTakebackState() {

		return "nonmember/takeback_state";
	}
}
