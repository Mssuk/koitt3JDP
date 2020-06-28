package com.koitt.tim.dao.admin;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.koitt.tim.dto.admin.BannerDto;

@Repository
public interface BannerDao {

	// 모든 배너 가져오기
	List<BannerDto> selectAllBanner();

	List<BannerDto> selectBanner();

	// 배너 시퀀스 가져오기
	String selectBannerSeq();

	// 배너 insert
	void insertBanner(BannerDto bDto);

	// 배너 업데이트
	void updateBanner(String key, String val);

	// 배너 삭제
	void deleteBanner(String key);
}
