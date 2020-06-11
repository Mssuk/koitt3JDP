package com.koitt.tim.dao.product;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.koitt.tim.dto.product.RelatedProductDto;

@Repository
public interface RelatedProductDao {

	// 모든 관련 상품 리스트
	List<RelatedProductDto> selectAllRProduct();

	// 상품 자동 등록
	void insertRProduct(@Param("p1") String pro_num);

}
