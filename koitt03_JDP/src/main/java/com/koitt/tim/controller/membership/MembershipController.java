package com.koitt.tim.controller.membership;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koitt.tim.dto.member.MemberDto;
import com.koitt.tim.service.membership.MembershipService;

@Controller
@RequestMapping("/membership")
public class MembershipController {

	@Autowired
	MembershipService membershipService;

	@RequestMapping("login")
	public String login() {

		return "membership/login";
	}

	@RequestMapping("loginCheck")
	@ResponseBody
	public int loginCheck(@RequestBody HashMap<String, String> obj) {

		String id = obj.get("id");
		String pw = obj.get("pw");

		// System.out.println(id + "," + pw);

		int result = membershipService.loginCheck(id, pw);

		return result;
//		return "membership/id_check";
	}

	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main";
	}

	@RequestMapping(value = "loginOk", method = RequestMethod.POST)
	public String loginOk(@RequestParam("id") String id, @RequestParam("pw") String pw, HttpSession session) {
		session.setAttribute("id", id);
		return "redirect:/main";
	}

	@RequestMapping("idsearch")
	public String idsearch() {

		return "membership/idsearch";
	}

	@RequestMapping("join1")
	public String join() {

		return "membership/join1";
	}

	@RequestMapping("join2")
	public String join2() {

		return "membership/join2";
	}

	@RequestMapping("join3")
	public String join3() {

		return "membership/join3";
	}

	@RequestMapping(value = "signUp", method = RequestMethod.POST)
	public String signUp(Model model) {

		return "";

	}

}
