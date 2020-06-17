package com.koitt.tim.dto.basket;

import com.koitt.tim.dto.product.ProductDto;

//비회원 장바구니 출력용 빈.
public class CartViewDto {
	private BasketMemberDto bmdto;
	private ProductDto pdto;

	public BasketMemberDto getBmdto() {
		return bmdto;
	}

	public void setBmdto(BasketMemberDto bmdto) {
		this.bmdto = bmdto;
	}

	public ProductDto getPdto() {
		return pdto;
	}

	public void setPdto(ProductDto pdto) {
		this.pdto = pdto;
	}

}
