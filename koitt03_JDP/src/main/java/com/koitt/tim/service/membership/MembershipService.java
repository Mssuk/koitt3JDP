package com.koitt.tim.service.membership;

import com.koitt.tim.dto.member.MemberDto;

import java.lang.reflect.Member;

public interface MembershipService {

	int loginCheck(String id, String pw);

	int signUp(MemberDto dto);

	MemberDto getMemInfo(String id);

	String searchId(String name, String email);

	String searchPw(String id, String email);
}
