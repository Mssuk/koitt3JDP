package com.koitt.tim.controller.nonmember;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.koitt.tim.dto.basket.BasketMemberDto;
import com.koitt.tim.dto.basket.CartViewDto;
import com.koitt.tim.dto.order.ChangeDto;
import com.koitt.tim.dto.order.OrderListDto;
import com.koitt.tim.dto.review.ReviewDto;
import com.koitt.tim.service.nonmember.NonmemberService;
import com.koitt.tim.service.product.ProductService;
import com.koitt.tim.utils.CommonUtils;

@Controller
@RequestMapping("nonmember")
public class NonMemberController {
	@Autowired
	NonmemberService nServ;

	@Autowired
	ProductService pServ;

	@Autowired
	CommonUtils utils;

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
		if (cart != null && cart.size() != 0) {
			model.addAttribute("list", cart);
		}
		return "nonmember/cart";
	}

	// 비회원 주문조회
	@ResponseBody
	@RequestMapping("ordercheck")
	public int getNonOrderCheck(@RequestBody HashMap<String, String> reqMap, Model model, HttpSession session) {
		int orch = 1;
		String o_num = reqMap.get("o_num");
		String o_tel = reqMap.get("o_tel");
		o_tel = o_tel.trim();
		o_tel = o_tel.replace("-", "");
		o_tel = o_tel.replace(" ", "");
		String o_tel1 = "";
		String o_tel2 = "";
		String o_tel3 = "";
		if (o_tel.length() == 10) {
			o_tel1 = o_tel.substring(0, 3);
			o_tel2 = o_tel.substring(3, 6);
			o_tel3 = o_tel.substring(6, o_tel.length());
		} else {
			o_tel1 = o_tel.substring(0, 3);
			o_tel2 = o_tel.substring(3, 7);
			o_tel3 = o_tel.substring(7, o_tel.length());
		}
		o_tel = o_tel1 + "-" + o_tel2 + "-" + o_tel3;

		orch = nServ.getOrderList(o_num, o_tel);
		if (orch == 1) {
			session.setAttribute("nonOk", o_num);
		}
		return orch;
	}

	// 비회원 주문리스트 가져오기
	@RequestMapping("ordercheck_view")
	public String ordercheck_view(@RequestParam(value = "o_num") String o_num,
			@RequestParam(value = "page", defaultValue = "1") int pageNum, Model model, HttpServletRequest request,
			HttpSession session) {

		if (request.getParameter("inqu_ch") != null) {
			int incheck = Integer.parseInt(request.getParameter("inqu_ch"));
			model.addAttribute("incheck", incheck);
		}
		List<OrderListDto> list = nServ.getOrderLists(pageNum, o_num);
		List<Integer> pageNumbering = nServ.getOrderPageList(pageNum, list.size());
		int maxPage = nServ.getLastNum(list.size());
		model.addAttribute("pageNumbering", pageNumbering);
		// 마지막페이지 번호입니다.
		model.addAttribute("maxPage", maxPage);
		// 현재 페이지를 알려줍니다
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("orderList", list);
		model.addAttribute("o_num", o_num);

		return "nonmember/ordercheck";
	}

	// 반품교환 현황
	@RequestMapping("takeback_state")
	public String getTakebackState(HttpSession session, @RequestParam(value = "page", defaultValue = "1") int pageNum,
			@RequestParam(value = "o_num", defaultValue = "") String o_num, HttpServletRequest request, Model model) {

		if (o_num == "" && session.getAttribute("nonOk") != null) {
			o_num = (String) session.getAttribute("nonOk");
		}
		if (request.getParameter("doChange") != null) {
			int docheck = Integer.parseInt(request.getParameter("doChange"));
			model.addAttribute("docheck", docheck);
		}
		if (request.getParameter("updateCh") != null) {
			int updateCh = Integer.parseInt(request.getParameter("updateCh"));
			model.addAttribute("upcheck", updateCh);
		}
		List<OrderListDto> list = nServ.getClaimLists(pageNum, o_num);
		List<Integer> pageNumbering = nServ.getOrderPageList(pageNum, list.size());
		int maxPage = nServ.getLastNum(list.size());
		model.addAttribute("pageNumbering", pageNumbering);
		// 마지막페이지 번호입니다.
		model.addAttribute("maxPage", maxPage);
		// 현재 페이지를 알려줍니다
		model.addAttribute("pageNum", pageNum);
		if (list != null) {
			model.addAttribute("claimList", list);
		}
		model.addAttribute("o_num", o_num);
		return "nonmember/takeback_state";
	}

	// 반품교환신청창 생성
	@RequestMapping("return")
	public String viewreturn(@RequestParam(value = "num1", defaultValue = "") String key,
			@RequestParam(value = "num2", defaultValue = "") String o_num, Model model) {

		OrderListDto odto = nServ.getOrderListOne(key, o_num);
		String photo = nServ.getPhoto(odto.getPro_num());
		model.addAttribute("odto", odto);
		model.addAttribute("photo", photo);
		return "nonmember/return";
	}

	// 반품현황 이유창 생성
	@RequestMapping("reason")
	public String reason(@RequestParam(value = "num1", defaultValue = "") String key,
			@RequestParam(value = "num2", defaultValue = "") String o_num,
			@RequestParam(value = "type", defaultValue = "") String type, Model model) {
		String reason = nServ.getReason(key);
		model.addAttribute("reason", reason);
		model.addAttribute("type", type);
		model.addAttribute("key", key);
		model.addAttribute("o_num", o_num);
		return "nonmember/reason";
	}

	// 비회원리뷰창 생성
	@RequestMapping("review")
	public String review(@RequestParam(value = "num1", defaultValue = "") String key, Model model) {
		model.addAttribute("key", key);
		return "nonmember/review";
	}

	// 리뷰전송
	@PostMapping(value = "writereview", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public String dowriteRv(@RequestParam(value = "image", defaultValue = "") MultipartFile image, String title,
			String content, String key, int score, HttpSession session, Model model) throws IOException {
		int inqu_ch = 1;
		ReviewDto rDto = new ReviewDto();
		rDto.setTitle(title);
		rDto.setContent(content);
		rDto.setKey(key);
		rDto.setScore(score);
		// null방지 :D
		if (image.getOriginalFilename() != "") {
			rDto.setImage(utils.FileUploaderCDN(image, "review/"));
		} else {
			String q_nonfile = "";
			rDto.setImage(q_nonfile);
		}
		try {
			nServ.insertReview(rDto, session);
		} catch (Exception e) {
			inqu_ch = 0;
		}
		String o_num = (String) session.getAttribute("nonOk");
		model.addAttribute("o_num", o_num);
		return "redirect:ordercheck_view?inqu_ch=" + inqu_ch;
	}

	// 반품교환 이유변경
	@RequestMapping("/updateChange")
	public String modiReason(ChangeDto changeDto, HttpSession session, Model model) {
		int check = 1;
		String o_num = (String) session.getAttribute("nonOk");
		check = nServ.updateReason(changeDto);
		model.addAttribute("o_num", o_num);
		return "redirect:takeback_state?updateCh=" + check;
	}

	// 반품교환 신청완료
	@RequestMapping("/doReturn")
	public String do_return(ChangeDto changeDto, HttpSession session, Model model) {
		int check = 1;
		String o_num = (String) session.getAttribute("nonOk");
		check = nServ.doReturn(changeDto);
		model.addAttribute("o_num", o_num);
		return "redirect:takeback_state?doChange=" + check;
	}

}
