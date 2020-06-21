package com.koitt.tim.dao.question;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.koitt.tim.dto.question.QuestionDto;

@Repository
public interface QuestionDao {

	void insertQuestion(QuestionDto qDto);

	// admin
	List<QuestionDto> selectAllQuestion();

	// admin- type
	List<String> selectAllQType();
}
