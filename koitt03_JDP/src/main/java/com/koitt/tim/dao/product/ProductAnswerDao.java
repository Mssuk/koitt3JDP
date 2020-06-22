package com.koitt.tim.dao.product;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.koitt.tim.dto.product.ProductAnswerDto;

@Repository
public interface ProductAnswerDao {

	// 모든 답변 갖고옴
	List<ProductAnswerDto> selectAllPAnswer();

	// 답변등록
	void insertPAnswer(ProductAnswerDto paDto);

	// 답변 수정
	void updatePAnswer(@Param("p2") String key, @Param("p1") String content);

	// 답변 삭제
	void deletePAnswer(@Param("p1") String key);
}
