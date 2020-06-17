//이준희
package com.koitt.tim.service.product;

import com.koitt.tim.dto.product.ProductDto;
import com.koitt.tim.dto.product.RelatedProductDto;
import com.koitt.tim.dto.review.ReviewDto;

import java.util.List;

public interface ProductService {

    List<ProductDto> relatedProduct(String pro_num);
    List<ReviewDto> getReviewList(String pro_num);
    List<ProductDto> getProductList();
    ProductDto getProductChoice(String pro_num);
}
