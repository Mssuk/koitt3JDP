package com.koitt.tim.controller.membership;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koitt.tim.dto.member.MemberDto;

@Controller
public class MembershipController {

	@RequestMapping("login")
	public String login(MemberDto mdto, Model model) {

		return "membership/login";
	}

	@RequestMapping("membership/loginForm")
	public String loginForm(Model model, HttpServletRequest request) {

		return "membership/loginForm";
	}

	@RequestMapping("idsearch")
	public String idsearch() {

		return "membership/idsearch";
	}

	@RequestMapping("join")
	public String join() {

		return "membership/join";
	}

}
