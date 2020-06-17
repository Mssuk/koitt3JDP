package com.koitt.tim.dao.review;

import com.koitt.tim.dto.review.ReviewDto;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReviewDao {
    List<ReviewDto> selectReviewList(String pro_num);

}
