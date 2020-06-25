package com.koitt.tim.dao.admin;

import com.koitt.tim.dto.admin.BannerDto;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BannerDao {

    //모든 배너 가져오기
    List<BannerDto> selectAllBanner();
}
