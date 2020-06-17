package com.koitt.tim.service.nonmember;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koitt.tim.dao.product.ProductDao;
import com.koitt.tim.dto.basket.BasketMemberDto;
import com.koitt.tim.dto.basket.CartViewDto;
import com.koitt.tim.dto.order.OrderDto;
import com.koitt.tim.dto.product.ProductDto;

@Service
public class NonmemberServiceImpl implements NonmemberService {
	@Autowired
	private ProductDao pdao;

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
	public OrderDto getOrderList(String o_num, String o_tel) {
		// 주문번호가 있는지 확인.

		return null;
	}

}
