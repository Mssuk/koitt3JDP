package com.koitt.tim.controller.basket;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koitt.tim.service.basket.BasketService;

@Controller
public class BasketController {
	@Autowired
	BasketService bServ;

	// 장바구니담기
	@ResponseBody
	@RequestMapping("/putCart")
	public int putCart(@RequestBody HashMap<String, String> obj, HttpSession session) {
		String pro_num = obj.get("pro_num");
		String count = obj.get("count");
		int bascheck = 1;
		// 로그인시 장바구니 담기
		if (session.getAttribute("loginInfo") != null) {
			bascheck = bServ.insertMemberCart(pro_num, count, session);
		} else {
			ArrayList<String> arr = (ArrayList<String>) (session.getAttribute("baspack"));
			String value = pro_num + "_" + count;
			int sessionch = 0;
			/* arrayList 안에 아무것도 없으면 arrayList 생성 */
			if (session.getAttribute("baspack") == null) {
				arr = new ArrayList<String>();
			} else {
				for (int i = 0; i < arr.size(); i++) {
					if (arr.get(i).toString().contains(pro_num)) {
						String[] co = arr.get(i).split("_");
						arr.set(i, pro_num + "_" + (Integer.parseInt(count) + Integer.parseInt(co[1])));
						sessionch = 1;
						break;
					} // 같은 상품이 있으면 선택한만큼 증가
				}
			}
			if (sessionch == 0) {
				arr.add(value);
			} // 없으면 1개 넣기.
			session.setAttribute("baspack", arr);

		} // 비회원일경우 session으로..
		return bascheck;
	}

	// 장바구니 가기
	@RequestMapping("/goCart")
	public String goCart(HttpSession session) {
		String viewpage = "redirect:nonmember/cart";
		if (session.getAttribute("loginInfo") != null) {
			viewpage = "redirect:mypage/cart";
		}

		return viewpage;
	}

	// 장바구니 상품 1개 삭제
	@ResponseBody
	@RequestMapping("/delCartOne")
	public int delCartOne(HttpSession session, @RequestBody HashMap<String, String> reqMap) {
		int cartdel = 1;
		cartdel = bServ.deleteMemberBasket(session, reqMap);

		return cartdel;
	}

	// 장바구니 선택 상품 수정
	@ResponseBody
	@RequestMapping("/modiCart")
	public int modiCart(HttpSession session, @RequestBody HashMap<String, String> reqMap) {
		int cartdel = 1;
		cartdel = bServ.modifyMemberBasket(session, reqMap);

		return cartdel;
	}

	// 장바구니 선택 상품 삭제
	@ResponseBody
	@RequestMapping("/delCart")
	public int deleCart(HttpSession session, @RequestBody HashMap<String, String> reqMap) {
		int cartdel = 1;
		cartdel = bServ.deleteMemberBaskets(session, reqMap);

		return cartdel;
	}
}
