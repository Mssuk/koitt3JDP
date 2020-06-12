package com.koitt.tim.dao.basket;

import com.koitt.tim.dto.basket.BasketMemberDto;

public interface BasketDao {
	// 장바구니 1개 불러오기
	BasketMemberDto selectBasketMember(BasketMemberDto bdto);

	// 장바구니 업데이트
	void updateBasketMember(BasketMemberDto bdto);

	// 장바구니 넣기
	void insertBasketMember(BasketMemberDto bdto);

}
