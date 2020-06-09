//송민석
package com.koitt.tim.dao.member;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.koitt.tim.dto.member.MemberDto;

@Repository
public interface MemberDao {

	// 멤버 전체 가져옴
	List<MemberDto> selectAllMember();

	// 멤버 한 명 가져옴
	MemberDto selectOneMember(String id);

	// 멤버 등록
	MemberDto insertMember(String name, String id, String pw, String email1, String email2, String email_check,
			String address1, String address2, String address3, String phone, String sms, String tel, Timestamp birth,
			String calender_check, int point, Timestamp join_date);
}
