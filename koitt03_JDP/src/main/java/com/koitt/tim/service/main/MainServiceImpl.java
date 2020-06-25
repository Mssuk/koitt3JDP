package com.koitt.tim.service.main;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koitt.tim.dao.product.MainProductDao;
import com.koitt.tim.dto.product.ProductDto;

@Service
public class MainServiceImpl implements MainService {

	@Autowired
	MainProductDao mainProductDao;

	@Override
	public List<ProductDto> hitProduct() {
		ArrayList<String> proNum = mainProductDao.selectProNum();
		List<ProductDto> list = new ArrayList<ProductDto>();
		for (int i = 0; i < proNum.size(); i++) {
			System.out.println(proNum.get(i));
			list = mainProductDao.selectHit(proNum.get(i));
		}
		return list;
	}

}
