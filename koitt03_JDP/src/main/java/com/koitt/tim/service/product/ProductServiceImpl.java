package com.koitt.tim.service.product;

import com.koitt.tim.dao.product.ProductDao;
import com.koitt.tim.dto.product.ProductDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductDao pDao;

    @Override
    public List<ProductDto> getProductList() {
        System.out.println(pDao.selectProduct());
        return pDao.selectProduct();
    }
}
