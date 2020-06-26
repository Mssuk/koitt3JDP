package com.koitt.tim.service.main;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koitt.tim.dao.admin.BannerDao;
import com.koitt.tim.dao.product.MainProductDao;
import com.koitt.tim.dto.admin.BannerDto;
import com.koitt.tim.dto.product.ProductDto;

@Service
public class MainServiceImpl implements MainService {

	@Autowired
	MainProductDao mainProductDao;

	@Autowired
	BannerDao bannerDao;

	@Override
	public List<List<ProductDto>> hitProduct() {
		ArrayList<String> proNum = mainProductDao.selectHitPro();
		List<List<ProductDto>> list = new ArrayList<List<ProductDto>>();
		for (int i = 0; i < proNum.size(); i++) {
			System.out.println(proNum.get(i));
			list.add(mainProductDao.selectHit(proNum.get(i)));
		}
		return list;
	}

	@Override
	public List<List<ProductDto>> saleProduct() {
		ArrayList<String> proNum = mainProductDao.selectSalesPro();
		List<List<ProductDto>> list = new ArrayList<List<ProductDto>>();
		for (int i = 0; i < proNum.size(); i++) {
			list.add(mainProductDao.selectSale(proNum.get(i)));
		}
		return list;
	}

	@Override
	public List<BannerDto> banner() {
		List<BannerDto> banner = bannerDao.selectBanner();
		return banner;
	}

}
