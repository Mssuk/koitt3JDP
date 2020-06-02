//이준희
package com.koitt.tim.service.product;

import com.koitt.tim.dto.product.ProductDto;

import java.util.List;

public interface ProductService {

    List<ProductDto> getProductList();
    ProductDto getProductChoice(String pro_num);
}
