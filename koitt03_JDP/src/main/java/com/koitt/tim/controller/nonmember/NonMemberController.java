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
import com.koitt.tim.dto.order.OrderListDto;
import com.koitt.tim.service.nonmember.NonmemberService;
import com.koitt.tim.service.product.ProductService;

@Controller
@RequestMapping("nonmember")
public class NonMemberController {
	@Autowired
	NonmemberService nServ;

	@Autowired
	ProductService pServ;

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
	public int getNonOrderCheck(@RequestBody HashMap<String, String> reqMap, Model model) {
		int orch = 1;
		String o_num = reqMap.get("o_num");
		String o_tel = reqMap.get("o_tel");
		orch = nServ.getOrderList(o_num, o_tel);
		return orch;
	}

	// 비회원 주문리스트 가져오기
	@RequestMapping("ordercheck_view")
	public String ordercheck_view(@RequestParam(value = "o_num") String o_num,
			@RequestParam(value = "page", defaultValue = "1") int pageNum, Model model) {

		List<OrderListDto> list = nServ.getOrderLists(pageNum, o_num);
		List<String> plist = nServ.getPhotoList(list);
		List<Integer> pageNumbering = nServ.getOrderPageList(pageNum, list.size());
		int maxPage = nServ.getLastNum(list.size());
		model.addAttribute("pageNumbering", pageNumbering);
		// 마지막페이지 번호입니다.
		model.addAttribute("maxPage", maxPage);
		// 현재 페이지를 알려줍니다
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("orderList", list);
		model.addAttribute("photoList", plist);
		model.addAttribute("o_num", o_num);
		model.addAttribute("nonOk", "yes");
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

	@RequestMapping("return")
	public String viewreturn() {

		return "nonmember/return";
	}

}
