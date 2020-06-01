package com.koitt.tim.service.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koitt.tim.dao.admin.MallDao;
import com.koitt.tim.dto.admin.MallDto;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private MallDao mallDao;

	@Override
	public MallDto getMallInfo() {
		return mallDao.selectMallInfo();
	}

}
