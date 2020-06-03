package com.koitt.tim.service.membership;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

public interface MembershipService {

	public void execute(Model model, SqlSession sqlSession);

}
