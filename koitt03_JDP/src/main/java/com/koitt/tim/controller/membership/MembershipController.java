package com.koitt.tim.controller.membership;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koitt.tim.dto.member.MemberDto;
import com.koitt.tim.service.membership.MembershipService;

@Controller
@RequestMapping("membership")
public class MembershipController {

	@Autowired
	MembershipService membershipService;

	@RequestMapping("login")
	public String login(MemberDto mDto, Model model) {

		return "membership/login";
	}

	@RequestMapping("loginCheck")
	@ResponseBody
	public int loginCheck(@RequestBody HashMap<String, String> obj) {

		String id = obj.get("id");
		String pw = obj.get("pw");

		System.out.println(id + "," + pw);

		int result = membershipService.loginCheck(id, pw);

		return result;
//		return "membership/id_check";
	}

	@RequestMapping("loginOk")
	public String loginOk() {

		return "redirect:/main";
	}

	@RequestMapping("loginForm")
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
