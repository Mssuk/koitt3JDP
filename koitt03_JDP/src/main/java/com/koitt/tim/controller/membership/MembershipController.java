package com.koitt.tim.controller.membership;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koitt.tim.dto.member.MemberDto;
import com.koitt.tim.dto.member.SjoinStringDto;
import com.koitt.tim.service.membership.MembershipService;

@Controller
@RequestMapping("/membership")
public class MembershipController {

	SqlSession sql;

	@Autowired
	MembershipService membershipService;

	@RequestMapping("login")
	public String login() {

		return "membership/login";
	}

	// 로그인 값이 제대로 들어오는 확인하는 ajax
	@RequestMapping("loginCheck")
	@ResponseBody
	public int loginCheck(@RequestBody HashMap<String, String> obj) {

		String id = obj.get("id");
		String pw = obj.get("pw");

		// System.out.println(id + "," + pw);

		int result = membershipService.loginCheck(id, pw);
		return result;
	}

	// 로그인
	@RequestMapping(value = "loginOk", method = RequestMethod.POST)
	public String loginOk(@RequestParam("id") String id, HttpSession session) {

		MemberDto mdto = membershipService.getMemInfo(id);
		session.setAttribute("loginInfo", mdto);

		return "redirect:/main";
	}

	// 비회원 로그인
	@RequestMapping("nonMember")
	public int nonMember(@RequestParam("orderNum") String o_num, @RequestParam("orderTel") String orderTel) {
		int nonMem = membershipService.getNonMemInfo(o_num, orderTel);

		return nonMem;
	}

	// 로그아웃
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main";
	}

	@RequestMapping("idsearch")
	public String idsearch() {

		return "membership/idsearch";
	}

	// 아이디 찻기 === 이메일 전송 구현중
	@RequestMapping(value = "searchId", method = RequestMethod.POST)
	public void searchId(@RequestParam("name") String name, @RequestParam("email") String email, Model model) {
		System.out.println(name + ", " + email);
		String id = membershipService.searchId(name, email);
		System.out.println(id);
		model.addAttribute(id);

		// 메일 전송
		/*
		 * if(!(id.equals("0"))){ EmailSend emailSend = new EmailSend();
		 * emailSend.run();
		 *
		 * } else {
		 *
		 * }
		 */
	}

	// 비밀번호 찾기
	@RequestMapping(value = "searchPw", method = RequestMethod.POST)
	public void searchPw(@RequestParam("id") String id, @RequestParam("email") String email) {
		String pw = membershipService.searchPw(id, email);
		System.out.println("Controller : " + pw);
	}

	@RequestMapping("join1")
	public String join() {

		return "membership/join1";
	}

	@RequestMapping(value = "signUp", method = RequestMethod.POST)
	public String signUp(MemberDto mdto) throws Exception {

		mdto.setBirth(mdto.getBirth1(), mdto.getBirth2(), mdto.getBirth3());
		mdto.setPhone(mdto.getPhone1(), mdto.getPhone2(), mdto.getPhone3());
		mdto.setEmail(mdto.getEmail1(), mdto.getEmail2());
		mdto.setTel(mdto.getTel1(), mdto.getTel2(), mdto.getTel3());

		membershipService.signUp(mdto);

		return "membership/join4";
	}

	@RequestMapping("join2")
	public String join2() {

		return "membership/join2";
	}

	@RequestMapping("join3")
	public String join3() {

		return "membership/join3";
	}

}
