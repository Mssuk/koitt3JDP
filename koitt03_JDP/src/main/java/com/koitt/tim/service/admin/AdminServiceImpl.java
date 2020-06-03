package com.koitt.tim.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koitt.tim.dao.admin.MallDao;
import com.koitt.tim.dao.member.MemberDao;
import com.koitt.tim.dto.admin.MallDto;
import com.koitt.tim.dto.member.MemberDto;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private MallDao mallDao;
	@Autowired
	private MemberDao memberDao;

	@Override
	public MallDto getMallInfo() {
		return null;
	}

	@Override
	public List<MemberDto> getAllMembers() {
		return memberDao.selectAllMember();
	}

}
