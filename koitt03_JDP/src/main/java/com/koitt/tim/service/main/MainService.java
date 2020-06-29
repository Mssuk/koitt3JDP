package com.koitt.tim.service.main;

import java.util.List;

import com.koitt.tim.dto.admin.BannerDto;
import com.koitt.tim.dto.product.ProductDto;

public interface MainService {
	List<List<ProductDto>> hitProduct();

	List<List<ProductDto>> saleProduct();

	List<BannerDto> banner();
}
