package com.koitt.tim.service.membership;

import com.koitt.tim.dto.member.MemberDto;

public interface MembershipService {

	int loginCheck(String id, String pw);

	void signUp(MemberDto dto);

	int idCheck(String id);

	MemberDto getMemInfo(String id);

	int getNonMemInfo(String o_num, String orderTel);

	String searchId(String name, String email);

	String searchPw(String id, String email);

	void modifyMember(MemberDto mDto);
}
