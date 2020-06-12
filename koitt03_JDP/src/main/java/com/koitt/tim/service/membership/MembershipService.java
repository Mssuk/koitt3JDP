package com.koitt.tim.service.membership;

import com.koitt.tim.dto.member.MemberDto;

public interface MembershipService {

	int loginCheck(MemberDto mdto);

	int signUp(MemberDto mdto);

	String searchId(String name, String email);

	String searchPw(String id, String email);
}
