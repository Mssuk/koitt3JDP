package com.koitt.tim.service.basket;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koitt.tim.dao.basket.BasketDao;
import com.koitt.tim.dto.basket.BasketMemberDto;

@Service
public class BasketServiceImpl implements BasketService {
	@Autowired
	private BasketDao bdao;

	// 장바구니 확인후 중복시 카운트+1
	public int insertMemberCart(HttpServletRequest request, HttpSession session) {
		String pro_num = request.getParameter("pro_num");
		String id = (String) session.getAttribute("id");
		int count = Integer.parseInt(request.getParameter("count"));
		BasketMemberDto bdto = new BasketMemberDto();
		bdto.setId(id);
		bdto.setPro_num(pro_num);
		bdto.setCount(count);
		int check = 1;
		BasketMemberDto list = bdao.selectBasketMember(bdto);
		if (list == null) {
			try {
				// 회원장바구니 새로생성
				bdao.insertBasketMember(bdto);
			} catch (Exception e) {
				check = 0;
			}
		} else {
			try {
				// 회원장바구니count 개수증가
				bdao.updateBasketMember(bdto);
			} catch (Exception e) {
				check = 0;
			}
		}
		return check;
	}

}
