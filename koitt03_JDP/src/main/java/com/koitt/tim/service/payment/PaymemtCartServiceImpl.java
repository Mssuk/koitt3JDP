package com.koitt.tim.service.payment;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koitt.tim.dao.basket.BasketDao;
import com.koitt.tim.dao.coupon.CouponDao;
import com.koitt.tim.dao.member.MemberDao;
import com.koitt.tim.dao.order.OrderDao;
import com.koitt.tim.dao.order.ReceiptDao;
import com.koitt.tim.dao.payment.PaymentDao;
import com.koitt.tim.dao.point.PointDao;
import com.koitt.tim.dao.product.ProductDao;
import com.koitt.tim.dto.basket.BasketMemberDto;
import com.koitt.tim.dto.basket.CartViewDto;
import com.koitt.tim.dto.coupon.CouponMemBean;
import com.koitt.tim.dto.member.MemberDto;
import com.koitt.tim.dto.order.DoOrderDto;
import com.koitt.tim.dto.order.GetOrderNum;
import com.koitt.tim.dto.product.ProductDto;

@Service
public class PaymemtCartServiceImpl implements PaymentCartService {

	@Autowired
	private ProductDao pdao;

	@Autowired
	private BasketDao bdao;

	@Autowired
	private MemberDao mdao;

	@Autowired
	private PointDao podao;

	@Autowired
	private CouponDao cdao;

	@Autowired
	private OrderDao odao;
	@Autowired
	private PaymentDao paydao;

	@Autowired
	private ReceiptDao rdao;

	// orderpack에 해당하는 장바구니모양의 session가져옴
	@Override
	public List<BasketMemberDto> getCart(HttpSession session) {
		ArrayList<String> arr = (ArrayList<String>) session.getAttribute("orderpack");
		List<BasketMemberDto> dtos = new ArrayList<BasketMemberDto>();
		for (int i = 0; i < arr.size(); i++) {
			String[] key = arr.get(i).split("_");
			// session이름(상품이름)
			String productNum = key[0];
			String productCount = key[1];

			BasketMemberDto dto = new BasketMemberDto();
			dto.setPro_num(productNum);
			dto.setCount(Integer.parseInt(productCount));
			dtos.add(dto);
		} // 상품번호와 담은개수 카운트.

		return dtos;
	}

	// orderpack에 해당하는 상품정보 들고옴.
	@Override
	public List<CartViewDto> getCartProduct(List<BasketMemberDto> dtos) {
		List<CartViewDto> plist = new ArrayList<CartViewDto>();
		for (int i = 0; i < dtos.size(); i++) {
			ProductDto pDto = pdao.selectProductOne(dtos.get(i).getPro_num());
			CartViewDto cvDto = new CartViewDto();
			cvDto.setBmdto(dtos.get(i));
			cvDto.setPdto(pDto);
			plist.add(cvDto);
		}

		return plist;
	}

	// 넘어온 값에 맞춰서 장바구니 갱신
	@Override
	public int modifyMemberBasket(HttpSession session) {
		int bascheck = 1;
		ArrayList<String> arr = (ArrayList<String>) session.getAttribute("orderpack");
		String[] pro_num = new String[arr.size()];
		String[] count = new String[arr.size()];
		for (int i = 0; i < arr.size(); i++) {
			String[] co = arr.get(i).split("_");
			pro_num[i] = co[0];
			count[i] = co[1];
		}
		if (session.getAttribute("loginInfo") != null) {
			// 멤버>>에서 아이디 값을 받아와야함
			MemberDto mdto = (MemberDto) session.getAttribute("loginInfo");
			String id = mdto.getId();
			for (int i = 0; i < pro_num.length; i++) {
				BasketMemberDto bdto = new BasketMemberDto();
				bdto.setCount(Integer.parseInt(count[i]));
				bdto.setPro_num(pro_num[i]);
				bdto.setId(id);
				try {
					bdao.updateBasketMember(bdto);
				} catch (Exception e) {
					bascheck = 0;
				}
			}

		} else {
			// 비회원일경우
			ArrayList<String> arr2 = (ArrayList<String>) session.getAttribute("baspack");
			for (int i = 0; i < arr2.size(); i++) {
				for (int j = 0; j < pro_num.length; j++) {
					if (arr2.get(i).toString().contains(pro_num[j])) {
						arr2.set(i, pro_num[j] + "_" + (Integer.parseInt(count[j])));
					}
				}
			} // 같은 상품이 있으면 수정
			session.setAttribute("baspack", arr2);
		}

		return bascheck;

	}

	// 로그인정보에 맞는 회원정보 1개
	@Override
	public MemberDto getMember(HttpSession session) {
		MemberDto mdto = (MemberDto) session.getAttribute("loginInfo");
		String id = mdto.getId();
		mdto = mdao.selectOneMember(id);
		mdto.setPoint(podao.selectPointSum(id));
		mdto.setCouponCount(cdao.selectCountCouponP(id));
		return mdto;
	}

	// 오더 장바구니 만들기 :D
	@Override
	public void inputOrderCart(HashMap<String, String> ormap, HttpSession session) {
		String[] pro_num = ormap.get("pro_num").split("_");
		String[] count = ormap.get("count").split("_");
		ArrayList<String> arr = new ArrayList<String>();
		for (int i = 0; i < pro_num.length; i++) {
			String value = pro_num[i] + "_" + count[i];
			arr.add(value);
		}
		session.setAttribute("orderpack", arr);
	}

	// 회원쿠폰 가져오기
	@Override
	public List<CouponMemBean> getCoupons(HttpSession session) {
		MemberDto mdto = (MemberDto) session.getAttribute("loginInfo");
		String id = mdto.getId();
		return cdao.selectMemberCoupons(id);
	}

	// 오더 처리기
	@Override
	public String doOrderCart(DoOrderDto doOrderDto, HttpSession session) {
		int check = 1; // 주문이 잘 되었는지 체크
		LocalDate date = LocalDate.now();
		// 주문용 오늘날짜
		String orderDay = date.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
		String id = "";// null 방지 id
		// 로그인을 했음 ㅇㅇ
		if (session.getAttribute("loginInfo") != null) {
			MemberDto mDto = (MemberDto) session.getAttribute("loginInfo");
			// 로그인한 아이디
			id = mDto.getId();
		}
		// 포인트(사용)
		int o_point = 0;
		if (doOrderDto.getPay_point() != null && doOrderDto.getPay_point() != "") {
			o_point = Integer.parseInt(doOrderDto.getPay_point());
		}
		// 사용쿠폰
		String o_coupon_num = "";
		// 사용쿠폰금액
		int coupon_pay = 0;
		// 쿠폰정보 가져오기
		if (doOrderDto.getCoupon_num() != null && doOrderDto.getCoupon_num() != ""
				&& !(doOrderDto.getCoupon_num().equals("쿠폰선택"))) {
			o_coupon_num = doOrderDto.getCoupon_num();
			CouponMemBean couponInfo = cdao.selectCouponOne(id, o_coupon_num);
			coupon_pay = couponInfo.getCoupon_pay();
		}

		// 주문폼에 넣을 데이터
		String o_name = doOrderDto.getName();
		String o_tel = doOrderDto.getPhone1() + "-" + doOrderDto.getPhone2() + "-" + doOrderDto.getPhone3();
		// 주문 리스트
		List<CartViewDto> plist = getCartProduct(getCart(session));
		// 주문금액>>total
		int total = 0;
		for (int i = 0; i < plist.size(); i++) {
			// 상품개수*상품가격
			int count = plist.get(i).getBmdto().getCount();
			int pay = plist.get(i).getPdto().getSales_price();
			total += count * pay;
		}
		// 배송비>> 15000원 이상이면 배송비무료
		int o_cost = 2500;
		if (total >= 15000) {
			o_cost = 0;
		}
		// 적립포인트>> 주문금액*0.01
		int increpoint = (int) Math.floor(total * 0.01);

		String o_status = "결제대기중";
		if (doOrderDto.getMethod().equals("card") || doOrderDto.getMethod().equals("bankpay")) {
			o_status = "결제완료";
		}
		GetOrderNum getOrderNum = new GetOrderNum();
		getOrderNum.setId(id);
		getOrderNum.setO_cost(o_cost);
		getOrderNum.setO_name(o_name);
		getOrderNum.setO_point(o_point);
		getOrderNum.setO_status(o_status);
		getOrderNum.setO_tel(o_tel);
		getOrderNum.setOrderDay(orderDay);

		// order에 데이터 넣기 (o_num반환)
		try {
			odao.insertOrderOne(getOrderNum);
		} catch (Exception e) {
			check = -1;// order실패
			System.out.println(check);
		}

		// 방금들어간 오더의 시퀀스 번호!!
		int num = getOrderNum.getNum();
		String k = num + "";
		while (k.length() < 5) {
			k = 0 + k;
		}
		String o_num = orderDay + k;
		// orderlist 넣기
		for (int i = 0; i < plist.size(); i++) {
			String pro_num = plist.get(i).getPdto().getPro_num();
			String product_name = plist.get(i).getPdto().getProduct_name();
			int o_quant = plist.get(i).getBmdto().getCount();
			int product_price = plist.get(i).getPdto().getSales_price();
			int price = o_quant * product_price;
			try {
				odao.insertOrderlistOne(orderDay, o_num, pro_num, product_name, o_quant, price);
			} catch (Exception e) {
				check = -2;// orderlist생성실패
				System.out.println(check);
			}
		}

		// 수취자 정보넣기
		String p_name = doOrderDto.getP_name();
		String p_address = "[" + doOrderDto.getP_address1() + "]" + doOrderDto.getP_address2() + " "
				+ doOrderDto.getP_address3();
		String p_phone = doOrderDto.getP_phone1() + "-" + doOrderDto.getP_phone2() + "-" + doOrderDto.getP_phone3();
		String p_tel = doOrderDto.getP_tel1() + "-" + doOrderDto.getP_tel2() + "-" + doOrderDto.getP_tel3();
		String p_demand = "";
		if (doOrderDto.getP_demand() != null && doOrderDto.getP_demand() != "") {
			p_demand = doOrderDto.getP_demand();
		}
		try {
			paydao.insertPayeeOne(o_num, p_name, p_address, p_phone, p_tel, p_demand);
		} catch (Exception e) {
			check = -3;// 수취자 정보넣기
			System.out.println(check);
		}

		// 결제 및 영수증
		String o_way = doOrderDto.getMethod(); // 결제방법
		int o_sum = total + o_cost - coupon_pay - o_point; // 실제 결제한 가격
		if (o_sum < 0)
			o_sum = 0; // 결제가격이 음수인경우 0원으루..
		String bank = "";
		String bank_name = "";

		switch (o_way) {

		case "card":
			o_way = "카드결제";
			break;

		case "bankpay":
			o_way = "실시간 계좌이체";
			break;

		case "banktemp":
			o_way = "가상계좌";
			break;

		case "banktemp2":
			o_way = "가상계좌(에스크로)";
			break;

		case "banktemp3":
			o_way = "무통장입금";
			break;
		default:
			break;
		}

		// 무통장입금일 경우
		if (o_way.equals("무통장입금")) {
			bank = doOrderDto.getBank();
			bank_name = doOrderDto.getBank_name();
			String receiptChk = doOrderDto.getReceiptChk(); // 영수증여부
			String r_type = "";// 세부방법
			String r_name = "";
			String r_num = "";
			switch (receiptChk) {

			case "individual":
				// 개인소득공제
				receiptChk = "개인소득공제";
				r_type = doOrderDto.getIndividual();
				if (r_type.equals("phone")) {
					r_type = "휴대폰";
					r_name = doOrderDto.getPhone_name();
					r_num = doOrderDto.getPhone_num();
				} else {
					r_type = "현금영수증카드";
					r_name = doOrderDto.getCashreceipts_name();
					r_num = doOrderDto.getCashreceipts_num();
				}
				break;
			case "corporate":
				// 사업자 지출증빙
				receiptChk = "사업자 지출증빙";
				r_type = doOrderDto.getCorporate();
				if (r_type.equals("corporatenumber")) {
					r_type = "사업자번호";
					r_name = doOrderDto.getCorporatenumber_name();
					r_num = doOrderDto.getCorporatenumber_num();
				} else {
					r_type = "현금영수증카드";
					r_name = doOrderDto.getCorporate_cash_name();
					r_num = doOrderDto.getCorporate_cash_num();
				}
				break;
			default:
				break;
			}
			if (!(receiptChk.equals("none"))) {
				// 영수증
				try {
					rdao.insertReceiptOne(o_num, receiptChk, r_type, r_name, r_num);
				} catch (Exception e) {
					check = -4;// 영수증실패
					System.out.println(check);
				}
			}
		}

		// 결제 생성
		try {
			paydao.insertPaymentOne(o_num, o_way, o_sum, o_coupon_num, bank, bank_name);
		} catch (Exception e) {
			check = -5;// 결제테이블 생성실패
			System.out.println(check);
		}

		if (id != "") {
			// 사용쿠폰 업데이트
			if (o_coupon_num != "") {
				try {
					cdao.updateMemberCoupon(o_coupon_num, id);
				} catch (Exception e) {
					check = -6;// 쿠폰 업댓 실패
					System.out.println(check);
				}
			}
			String reason = "";
			// 사용포인트 업데이트
			if (o_point > 0) {
				reason = "구매";
				o_point = -(o_point);
				System.out.println(o_point);
				try {
					podao.insertPointMemberOne(id, o_num, o_point, reason);
				} catch (Exception e) {
					check = -7;// 사용포인트 업댓 실패
					System.out.println(check);
				}
			}
			// 적립포인트 업데이트
			if (increpoint > 0) {
				reason = "구매";
				try {
					podao.insertPointMemberOne(id, o_num, increpoint, reason);
				} catch (Exception e) {
					check = -8;// 적립포인트 업댓 실패
					System.out.println(check);
				}
			}
//			// 회원 장바구니 제거 //로그인시 장바구니 업댓되믄..
//			for (int i = 0; i < plist.size(); i++) {
//				BasketMemberDto bdto = plist.get(i).getBmdto();
//				bdto.setId(id);
//				try {
//					bdao.deleteBasketMember(bdto);
//				} catch (Exception e) {
//					check = -9;// 회원장바구니에서 해당 상품제거
//					System.out.println(check);
//				}
//			}
		}

		// 비회원 장바구니 제거 (비회원)
		if (id == "") {
			// 비회원일경우
			ArrayList<String> arr = (ArrayList<String>) session.getAttribute("baspack");
			for (int i = 0; i < arr.size(); i++) {
				for (int j = 0; j < plist.size(); j++) {
					String pro_num = plist.get(i).getBmdto().getPro_num();
					if (arr.get(i).toString().contains(pro_num)) {
						arr.remove(i);
					}
				}
			}
			// 같은 상품이 있으면 삭제
			session.setAttribute("baspack", arr);
			if (arr.isEmpty()) {
				session.removeAttribute("baspack");
			}

		}
		// 구매한 바구니 제거
		session.removeAttribute("orderpack");

		return o_num;
	}

}
