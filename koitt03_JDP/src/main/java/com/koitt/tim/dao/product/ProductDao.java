package com.koitt.tim.dao.product;

import com.koitt.tim.dto.product.ProductDto;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductDao {
    List<ProductDto> selectProduct();
}
