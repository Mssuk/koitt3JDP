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

	// 관련상품 등록
	void insertRProductEach(@Param("p3") String targetId, @Param("p2") String additionId, @Param("p1") String idx);

	// 관련상품 field null로 설정
	void updateRProduct(@Param("p2") String targetId, @Param("p1") String idx);

	// 상품 삭제시 관련상품에서 삭제
	void deleteRProduct(String code);
}
