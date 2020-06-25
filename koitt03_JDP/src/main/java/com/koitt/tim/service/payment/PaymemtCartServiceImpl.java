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
	public int doOrderCart(DoOrderDto doOrderDto, HttpSession session) {
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
		// 쿠폰

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
		int o_cost = 2500;
		// 배송비>> 15000원 이상이면 배송비무료
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
		odao.insertOrderOne(getOrderNum);
		System.out.println(getOrderNum.getNum());

		if (id != "") {
			// 사용쿠폰 업데이트
			// 사용포인트 업데이트
			// 적립포인트 업데이트
		}

		return 0;
	}

}
