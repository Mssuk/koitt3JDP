package com.koitt.tim.controller.membership;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.koitt.tim.dto.member.MemberDto;
import com.koitt.tim.service.membership.MembershipService;

@Controller
@RequestMapping("/membership")
public class MembershipController {

	@Autowired
	MembershipService membershipService;

	@RequestMapping("login")
	public String login(MemberDto mDto, Model model) {

		return "membership/login";
	}

	@RequestMapping("logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:/main";
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
	public String join2(){

		return "membership/join2";
	}

	@RequestMapping(value="join3", method = RequestMethod.GET)
	public String join3(){

		return "membership/join3";
	}

	@RequestMapping("joinCheck")
	public String joinCheck(){

		return "redirect:join4";

	}

}



