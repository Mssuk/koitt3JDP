package com.koitt.tim.dao.admin;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.koitt.tim.dto.admin.BannerDto;

@Repository
public interface BannerDao {

	// 모든 배너 가져오기
	List<BannerDto> selectAllBanner();

	List<BannerDto> selectBanner();
}
