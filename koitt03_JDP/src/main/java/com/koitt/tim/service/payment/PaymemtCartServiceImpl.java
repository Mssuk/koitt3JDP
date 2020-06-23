package com.koitt.tim.service.payment;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koitt.tim.dao.basket.BasketDao;
import com.koitt.tim.dao.member.MemberDao;
import com.koitt.tim.dao.product.ProductDao;
import com.koitt.tim.dto.basket.BasketMemberDto;
import com.koitt.tim.dto.basket.CartViewDto;
import com.koitt.tim.dto.member.MemberDto;
import com.koitt.tim.dto.product.ProductDto;

@Service
public class PaymemtCartServiceImpl implements PaymentCartService {

	@Autowired
	ProductDao pdao;

	@Autowired
	BasketDao bdao;

	@Autowired
	MemberDao mdao;

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
					if (arr.get(i).toString().contains(pro_num[j])) {
						arr.set(i, pro_num[j] + "_" + (Integer.parseInt(count[j])));
					}
				}
			} // 같은 상품이 있으면 수정
			session.setAttribute("baspack", arr);
		}

		return bascheck;

	}

	// 로그인정보에 맞는 회원정보 1개
	@Override
	public MemberDto getMember(HttpSession session) {
		MemberDto mdto = (MemberDto) session.getAttribute("loginInfo");
		String id = mdto.getId();
		return mdao.selectOneMember(id);
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

}
