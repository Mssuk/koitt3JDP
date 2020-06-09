package com.koitt.tim.service.membership;

import com.koitt.tim.dto.member.MemberDto;

public interface MembershipService {

	int loginCheck(String id, String pw);

	int signUp(MemberDto dto);

}
