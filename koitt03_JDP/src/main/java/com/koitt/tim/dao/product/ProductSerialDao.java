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

	//delete serial
	void deleteProductSerial(String code);
}
