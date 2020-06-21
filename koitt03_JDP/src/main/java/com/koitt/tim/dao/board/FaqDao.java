package com.koitt.tim.dao.board;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.koitt.tim.dto.board.FaqDto;

@Repository
public interface FaqDao {
	// FAQ불러오기
	List<FaqDto> selectFaqList(@Param("p1") int startNum, @Param("p2") int endNum, @Param("faq_type") String faq_type,
			@Param("opt") String search, @Param("key") String text);

	// FAQ글 개수카운트
	int selectFaqListCount(@Param("faq_type") String faq_type, @Param("opt") String search, @Param("key") String text);

	// admin - 모든 FAQ
	List<FaqDto> selectAllFaq();

	// admin - FAQ 등록
	void insertFaq(FaqDto faqDto);

	// admin - FAQ 삭제
	void deleteFaq(String key);
}
