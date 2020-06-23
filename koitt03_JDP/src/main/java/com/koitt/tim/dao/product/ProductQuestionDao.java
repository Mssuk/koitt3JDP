package com.koitt.tim.dao.product;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.koitt.tim.dto.product.ProductQuestionDto;

@Repository
public interface ProductQuestionDao {

	List<ProductQuestionDto> selectProductQuestions();

	//List<ProductQuestionDto> selectPQuestion(String pro_num);	// 해당 상품 문의 불러오기 - 이준희
	int selectQuestionCount(String pro_num);	//해당 상품 문의 카운트
	List<HashMap<String,Object>> selectQAList(String pro_num);	//해당 상품 문의/질의 불러오기 - 이준희


}
