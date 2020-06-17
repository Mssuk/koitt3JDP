package com.koitt.tim.service.nonmember;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koitt.tim.dao.order.OrderDao;
import com.koitt.tim.dao.product.ProductDao;
import com.koitt.tim.dto.basket.BasketMemberDto;
import com.koitt.tim.dto.basket.CartViewDto;
import com.koitt.tim.dto.order.OrderDto;
import com.koitt.tim.dto.product.ProductDto;

@Service
public class NonmemberServiceImpl implements NonmemberService {
	@Autowired
	private ProductDao pdao;

	@Autowired
	private OrderDao odao;

	@Override
	public List<BasketMemberDto> getNonmemCart(HttpSession session) {
		ArrayList<String> arr = (ArrayList<String>) session.getAttribute("baspack");
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

	// 장바구니 상품 가져오기
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

	// 비회원 주문조회
	@Override
	public int getOrderList(String o_num, String o_tel) {
		// 주문번호가 있는지 확인.
		int orch = 1;
		OrderDto odto = odao.selectOrderOne(o_num, o_tel);
		if (odto == null) {
			// 주문이없음
			orch = 0;
		} else {
			// 주문은 있으나 아이디가있음(회원임)
			if (odto.getId() != null)
				orch = -1;
		}

		return orch;
	}

}
