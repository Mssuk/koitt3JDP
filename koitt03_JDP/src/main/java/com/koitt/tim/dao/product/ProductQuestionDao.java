package com.koitt.tim.dao.product;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.koitt.tim.dto.product.ProductQuestionDto;

@Repository
public interface ProductQuestionDao {

	List<ProductQuestionDto> selectProductQuestions();

	//List<ProductQuestionDto> selectPQuestion(String pro_num);	// 해당 상품 문의 불러오기 - 이준희
	int selectQuestionCount(String pro_num);	//해당 상품 문의 카운트
	List<HashMap<String,Object>> selectQAList(@Param("p1") String pro_num,@Param("p2") int startNum,@Param("p3") int endNum);	//해당 상품 문의/질의 불러오기 - 이준희


}
