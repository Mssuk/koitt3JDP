package com.koitt.tim.controller.payment;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koitt.tim.dto.order.ChangeDto;
import com.koitt.tim.service.nonmember.NonmemberService;

@Controller
public class ChangeOrderController {

	@Autowired
	NonmemberService nServ;

	// 반품교환 신청완료
	@RequestMapping("/doReturn")
	public String do_return(ChangeDto changeDto, Model model) {
		int check = 1;
		check = nServ.doReturn(changeDto);
		model.addAttribute("doChange", check);
		return "redirect:nonmember/takeback_state";
	}

	// 반품교환 철회
	@ResponseBody
	@RequestMapping("/delChangeOne")
	public int delChangeOne(@RequestBody HashMap<String, String> obj) {
		String key = obj.get("key");
		int check = 1;
		check = nServ.cancelReturn(key);
		return check;
	}

	// 입금전 취소
	@ResponseBody
	@RequestMapping("/delOrderTypeA")
	public int delOrderTypeA(@RequestBody HashMap<String, String> obj) {
		String o_num = obj.get("o_num");
		int check = 1;
		check = nServ.cancelOrderA(o_num);
		return check;
	}

	// 입금 후 취소(배송 준비전)
	@ResponseBody
	@RequestMapping("/delOrderTypeB")
	public int delOrderTypeB(@RequestBody HashMap<String, String> obj) {
		String o_num = obj.get("o_num");
		int check = 1;
		check = nServ.cancelOrderB(o_num);
		return check;
	}

	// 반품교환 철회
	@ResponseBody
	@RequestMapping("/delChangeOneB")
	public int delChangeOneB(@RequestBody HashMap<String, String> obj) {
		String o_num = obj.get("o_num");
		int check = 1;
		check = nServ.cancelReturnB(o_num);
		return check;
	}
}
