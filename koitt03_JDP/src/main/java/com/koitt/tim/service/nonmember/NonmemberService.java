package com.koitt.tim.service.nonmember;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.koitt.tim.dto.basket.BasketMemberDto;
import com.koitt.tim.dto.basket.CartViewDto;

public interface NonmemberService {

	List<BasketMemberDto> getNonmemCart(HttpSession session);

	List<CartViewDto> getCartProduct(List<BasketMemberDto> dtos);

}
