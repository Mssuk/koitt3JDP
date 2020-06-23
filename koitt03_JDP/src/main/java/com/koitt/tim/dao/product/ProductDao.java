package com.koitt.tim.dao.product;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.koitt.tim.dto.product.ProductDto;

@Repository
public interface ProductDao {
	List<ProductDto> selectProduct();

	ProductDto selectProductOne(String pro_num);

	// insert Product
	void insertProduct(ProductDto pDto);

	// delete Product
	void deleteProduct(String code);

	// update Product
	void updateProduct(ProductDto pDto);
}
