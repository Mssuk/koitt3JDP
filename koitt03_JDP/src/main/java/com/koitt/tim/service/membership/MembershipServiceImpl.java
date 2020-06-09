package com.koitt.tim.service.membership;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koitt.tim.dao.member.MemberDao;
import com.koitt.tim.dto.member.MemberDto;

@Service
public class MembershipServiceImpl implements MembershipService {

	@Autowired
	private MemberDao memberDao;

	@Override
	public int loginCheck(String id, String pw) {
		// id랑 비번 담겨있는 객체

		// 0이 아이디 없음 1이 아이디 있음 2가 비번 틀림
		int result = 1;
		MemberDto mDto = memberDao.selectOneMember(id);

		// 없는 아이디면 mDto ==null
		if (mDto == null) {
			result = 0;
		} else {
			boolean flag = mDto.getPw().equals(pw);
			if (flag == false) {
				result = 2;
			}
		}
		return result;
	}

	@Override
	public int signUp(MemberDto mdto) {
		memberDao.insertMember(mdto);


		return 0;
	}

}
