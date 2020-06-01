package com.koitt.tim.dao.admin;

import org.apache.ibatis.annotations.Mapper;

import com.koitt.tim.dto.admin.MallDto;

@Mapper
public interface MallDao {

	MallDto selectMallInfo();

}
