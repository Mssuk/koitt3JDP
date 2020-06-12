package com.koitt.tim.dao.product;

import org.springframework.stereotype.Repository;

import com.koitt.tim.dto.product.ProductSerialDto;

@Repository
public interface ProductSerialDao {

	// insert serial with product num
	void insertProductSerial(ProductSerialDto psDto);
}
