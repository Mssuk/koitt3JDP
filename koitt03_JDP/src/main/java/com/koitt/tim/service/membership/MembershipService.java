package com.koitt.tim.service.membership;

import org.springframework.ui.Model;

public interface MembershipService {

	int loginCheck(String id, String pw);
	String signUp(Model model);

}
