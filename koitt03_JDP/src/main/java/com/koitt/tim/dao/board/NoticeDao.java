package com.koitt.tim.dao.board;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.koitt.tim.dto.board.NoticeDto;

@Repository
public interface NoticeDao {

	// 공지사항 추가
	void insertNotice(NoticeDto nDto);

//	// 모든 공지사항 갖고옴
//	List<NoticeDto> selectAllNotice();

	// 모든 공지사항 갖고옴
	List<NoticeDto> selectAllNotice(@Param("p1") int start, @Param("p2") int end, @Param("opt") String search,
			@Param("key") String txt);

	// 페이지계산
	int selectNoticeListCount(@Param("opt") String search, @Param("key") String txt);

	// 공지사항 글 1개 선택
	NoticeDto selectNotice(@Param("n_num") String n_num);

	// 이전글
	NoticeDto selectPre(@Param("rnum") int rnum);

	// 다음글
	NoticeDto selectNext(@Param("rnum") int rnum);

	// 조회수 1증가
	void updateUpHit(@Param("n_num") String n_num);
}
