package com.koitt.tim.dao.category;

import com.koitt.tim.dto.category.CategoryDept1Dto;
import com.koitt.tim.dto.category.CategoryDept2Dto;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryDao {

    //Dept1 all
    List<CategoryDept1Dto> selectAllDept1();

    //Dept2 all
    List<CategoryDept2Dto> selectAlLDept2();
}
