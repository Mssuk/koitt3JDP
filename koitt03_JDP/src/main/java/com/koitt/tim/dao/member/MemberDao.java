//송민석
package com.koitt.tim.dao.member;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.koitt.tim.dto.member.MemberDto;

import javax.servlet.http.HttpSession;

@Repository
public interface MemberDao {

	// 멤버 전체 가져옴
	List<MemberDto> selectAllMember();

	// 멤버 한 명 가져옴
	MemberDto selectOneMember(String id);

	// 멤버 등록
	MemberDto insertMember(MemberDto memberDto);

	// 로그인 멤버 정보 수정
	void modifyMember(@Param("p1") String id, @Param("p2") String name, @Param("p3") String address1, @Param("p4") String address2, @Param("p5") String address3, @Param("p7")String phone, @Param("p8")String tel, @Param("p9")String email);

	// 멤버 한 명 아이디 가져옴
	String selectSearchMemberId(@Param("name") String name, @Param("email") String email);

	// 멤버 한 명 pw 가져옴
	String selectSearchMemberPw(@Param("id") String id, @Param("email") String email);

}
