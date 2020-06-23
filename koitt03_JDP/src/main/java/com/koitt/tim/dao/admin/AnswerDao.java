package com.koitt.tim.dao.admin;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.koitt.tim.dto.admin.AnswerDto;

@Repository
public interface AnswerDao {

	// 모든 answer 갖고 오기
	List<AnswerDto> selectAllAnswer();

	// answer 등록
	void insertAnswer(AnswerDto aDto);

	// answer 수정
	void updateAnswer(AnswerDto aDto);

	// answer 삭제
	void deleteAnswer(String key);
}
