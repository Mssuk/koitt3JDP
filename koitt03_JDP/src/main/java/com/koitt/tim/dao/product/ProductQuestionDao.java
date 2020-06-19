package com.koitt.tim.dao.product;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.koitt.tim.dto.product.ProductQuestionDto;

@Repository
public interface ProductQuestionDao {

	List<ProductQuestionDto> selectProductQuestions();

}
