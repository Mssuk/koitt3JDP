package com.koitt.tim.dao.question;

import org.springframework.stereotype.Repository;

import com.koitt.tim.dto.question.QuestionDto;

@Repository
public interface QuestionDao {

	void insertQuestion(QuestionDto qDto);

}
