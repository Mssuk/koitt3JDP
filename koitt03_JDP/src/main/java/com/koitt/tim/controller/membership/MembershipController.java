package com.koitt.tim.controller.membership;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MembershipController {

	@RequestMapping("membership/login")
	public String login(Model model) {

		return "membership/login";
	}

}
