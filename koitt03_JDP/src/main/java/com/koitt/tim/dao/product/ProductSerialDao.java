package com.koitt.tim.dao.product;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.koitt.tim.dto.product.ProductSerialDto;

@Repository
public interface ProductSerialDao {

	// insert serial with product num
	void insertProductSerial(ProductSerialDto psDto);

	// get serial number
	List<ProductSerialDto> selectAllSerial();

	// delete serial
	void deleteProductSerial(String code);

	// update 상품의 카테고리
	void updateProductCategory(ProductSerialDto psDto);

	// 상품 한개의 시리얼 갖고 옴
	ProductSerialDto selectSerial(String code);

}
