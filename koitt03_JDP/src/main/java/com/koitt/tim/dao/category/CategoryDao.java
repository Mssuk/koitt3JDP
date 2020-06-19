package com.koitt.tim.dao.category;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.koitt.tim.dto.category.CategoryDept1Dto;
import com.koitt.tim.dto.category.CategoryDept2Dto;

@Repository
public interface CategoryDao {

	// Dept1 all
	List<CategoryDept1Dto> selectAllDept1();

	// Dept2 all
	List<CategoryDept2Dto> selectAllDept2();

	// insert Dept1
	void insertDept1(CategoryDept1Dto cDto);

	// insert Dept2
	void insertDept2(CategoryDept2Dto cDto);

	// delete Dept1
	void deleteDept1(String code);

	// delete Dept2
	void deleteDept2(String code);
}
