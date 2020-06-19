//이준희
package com.koitt.tim.service.product;

import com.koitt.tim.dao.product.ProductDao;
import com.koitt.tim.dao.product.RelatedProductDao;
import com.koitt.tim.dao.review.ReviewDao;
import com.koitt.tim.dto.product.ProductDto;
import com.koitt.tim.dto.product.RelatedProductDto;
import com.koitt.tim.dto.review.ReviewDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductDao pDao;
    @Autowired
    private ReviewDao rDao;
    @Autowired
    private RelatedProductDao rpDao;


    @Override
    public List<ProductDto> relatedProduct(String pro_num) { //상품번호로 상품과 관련된 상품 리스트를 불러옴.

        RelatedProductDto rpDto = rpDao.selectRelatedList(pro_num);
        ArrayList<ProductDto> pjList = new ArrayList<>();
        //RelateProduct 찾은걸로 product
        if(rpDto.getRec_pro_num1() != null){
            pjList.add(pDao.selectProductOne(rpDto.getRec_pro_num1()));
        }
        if(rpDto.getRec_pro_num2() != null){
            pjList.add(pDao.selectProductOne(rpDto.getRec_pro_num2()));
        }
        if(rpDto.getRec_pro_num3() != null){
            pjList.add(pDao.selectProductOne(rpDto.getRec_pro_num3()));
        }
        if(rpDto.getRec_pro_num4() != null){
            pjList.add(pDao.selectProductOne(rpDto.getRec_pro_num4()));
        }
        if(rpDto.getRec_pro_num5() != null){
            pjList.add(pDao.selectProductOne(rpDto.getRec_pro_num5()));
        }
        return pjList;
    }

    @Override
    public List<ReviewDto> getReviewList(String pro_num) {  //상품번호로 리뷰리스트 불러오기
        return rDao.selectReviewList(pro_num);
    }

    @Override
    public List<ProductDto> getProductList() {
        return pDao.selectProduct();
    }   //상품 리스트 불러오기

    @Override
    public ProductDto getProductChoice(String pro_num) {        //선택한 상품정보 불러오기
        ProductDto pDto = pDao.selectProductOne(pro_num);
        pDto.setPoint();
        return pDto;
    }

    @Override
    public void addReview(String id,String type, int star, String title, String content,String pro_num) {
        rDao.insertReview(id,type,star,title,content,pro_num);

    }

    @Override
    public void addPhotoReview(ReviewDto rDto) {
        rDao.insertPhotoReview(rDto);
    }


}
