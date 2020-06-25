package com.koitt.tim.dao.product;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.koitt.tim.dto.product.MainProductDto;
import com.koitt.tim.dto.product.ProductDto;

@Repository
public interface MainProductDao {

	// 메인 상품 자동등록
	void insertMProduct(@Param("p1") String pro_num);

	// 상품 삭제시 메인상품 삭제
	void deleteMProduct(String code);

	// 메인 상품 가져오기
	List<MainProductDto> selectAllMProduct();

	// 메인 상품정보 업데이트
	void updateMProduct(@Param("p1") String code, @Param("p2") String index, @Param("p3") int value);

	ArrayList<String> selectProNum();

	List<ProductDto> selectHit(String proNum);

}
