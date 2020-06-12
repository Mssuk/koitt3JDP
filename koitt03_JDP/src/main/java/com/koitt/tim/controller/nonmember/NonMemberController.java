package com.koitt.tim.controller.nonmember;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("nonmember")
public class NonMemberController {

	@RequestMapping("cart")
	public String getNonCart() {

		return "nonmember/cart";
	}

	@RequestMapping("ordercheck")
	public String getNonOrderCheck() {

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
