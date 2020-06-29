package com.koitt.tim.controller.mypage;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koitt.tim.dto.coupon.CouponDto;
import com.koitt.tim.dto.coupon.CouponMemBean;
import com.koitt.tim.dto.member.MemberDto;
import com.koitt.tim.dto.order.OrderListDto;
import com.koitt.tim.service.membership.MembershipService;
import com.koitt.tim.service.mypage.MypageService;
import com.koitt.tim.service.nonmember.NonmemberService;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	MembershipService membershipService;

	@Autowired
	MypageService mypageService;

	@Autowired
	NonmemberService nServ;

	@RequestMapping("ordercheck")
	public String ordercheck(Model model, HttpSession session) {
		MemberDto mDto = (MemberDto) session.getAttribute("loginInfo");

		if (mDto != null) {
			int userCoupon = mypageService.countCoupon(mDto.getId());
			model.addAttribute("userCoupon", userCoupon);

			int userPoint = mypageService.havePoint(mDto.getId());
			model.addAttribute("userPoint", userPoint);

			int orderCount = mypageService.orderCount(mDto.getId());
			model.addAttribute("orderCount", orderCount);

			// o_num 전체를 불러와 ArrayList에 저장 _나동수
			ArrayList<String> orderNumList = mypageService.orderNumList(mDto.getId()); // 해당 ID로 등록된 o_num들 전체 불러옴(order)

			// 불러온 o_num을 이용해 orderList 불러오기 _나동수
			List<List<OrderListDto>> listDto = new ArrayList<List<OrderListDto>>();
			for (int i = 0; i < orderNumList.size(); i++) {
				listDto.add(mypageService.orderList(orderNumList.get(i)));
			}

			model.addAttribute("orderList", listDto);
		}
		return "mypage/ordercheck";
	}

	@RequestMapping("change_info")
	public String changeInfo(Model model, HttpSession session, MemberDto mDto) {
		mDto = (MemberDto) session.getAttribute("loginInfo");

		model.addAttribute("mdto", mDto);
		return "mypage/change_info";
	}

	@RequestMapping("return")
	public String viewreturn(@RequestParam(value = "num1", defaultValue = "") String key,
			@RequestParam(value = "num2", defaultValue = "") String o_num, Model model) {

		OrderListDto odto = nServ.getOrderListOne(key, o_num);
		String photo = nServ.getPhoto(odto.getPro_num());
		System.out.println(photo);
		model.addAttribute("odto", odto);
		model.addAttribute("photo", photo);
		return "nonmember/return";
	}

	@RequestMapping("modifyMember")
	public String modifyMember(MemberDto mdto, HttpServletResponse response) throws Exception {
//		String id = mdto.getId();
		mdto.setBirth(mdto.getBirth1(), mdto.getBirth2(), mdto.getBirth3());
		mdto.setPhone(mdto.getPhone1(), mdto.getPhone2(), mdto.getPhone3());
		mdto.setEmail(mdto.getEmail1(), mdto.getEmail2());
		mdto.setTel(mdto.getTel1(), mdto.getTel2(), mdto.getTel3());

		membershipService.modifyMember(mdto);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('수정이 완료되었습니다')</script>");
		return "redirect:ordercheck";
	}

	@RequestMapping("coupon")
	public String coupon_list(CouponDto cDto, Model model, HttpSession session) {
		MemberDto mdto = (MemberDto) session.getAttribute("loginInfo"); // session에서 login 정보 뽑아옴

		int userCoupon = mypageService.countCoupon(mdto.getId());
		model.addAttribute("userCoupon", userCoupon);

		int userPoint = mypageService.havePoint(mdto.getId());
		model.addAttribute("userPoint", userPoint);

		int orderCount = mypageService.orderCount(mdto.getId());
		model.addAttribute("orderCount", orderCount);

		// loginInfo 에서 id 뽑아서 쿠폰리스트 생성성
		List<CouponMemBean> couponList = mypageService.getMemberCoupons(mdto.getId());
		model.addAttribute("cList", couponList);
		return "mypage/coupon";
	}


	// 주문시 회원정보변경
	@RequestMapping("updateMemInfo")
	@ResponseBody
	public int updateMemInfo(@RequestBody HashMap<String, String> obj, HttpSession session) {

		int result = membershipService.orderModifyMember(obj, session);

		return result;
	}
	@RequestMapping(".writeReview")
	public String writeReview(HttpSession session,Model model, String oNum,String pro_num){

		String id="";
		if(session.getAttribute("loginInfo")!=null){
			MemberDto mDto = (MemberDto) session.getAttribute("loginInfo");
			id=mDto.getId();
		}

		String key = mypageService.getReviewKey(oNum,pro_num,id);		//주문번호로 주문리스트의 key 호출

		model.addAttribute("o_num",oNum);
		model.addAttribute("key",key);


		return "product/photo";
	}

}
