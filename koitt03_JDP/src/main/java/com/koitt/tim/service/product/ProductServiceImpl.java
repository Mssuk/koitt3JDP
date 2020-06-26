//이준희
package com.koitt.tim.service.product;

import com.koitt.tim.dao.order.OrderDao;
import com.koitt.tim.dao.product.ProductDao;
import com.koitt.tim.dao.product.ProductQuestionDao;
import com.koitt.tim.dao.product.RelatedProductDao;
import com.koitt.tim.dao.review.ReviewDao;
import com.koitt.tim.dto.product.ProductDto;
import com.koitt.tim.dto.product.ProductQuestionDto;
import com.koitt.tim.dto.product.RelatedProductDto;
import com.koitt.tim.dto.review.ReviewDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductDao pDao;
    @Autowired
    private ReviewDao rDao;
    @Autowired
    private RelatedProductDao rpDao;
    @Autowired
    private OrderDao oDao;
    @Autowired
    private ProductQuestionDao pqDao;


    //REVIEW
    private static final int ROW_LIMIT = 5; // 밑에 몇개씩 보여줄건지
    private static final int PAGE_LIMIT = 5; // 한 페이지당 몇개 보여줄건지

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
    public List<ReviewDto> getReviewList(String pro_num, int pageNum) {  //상품번호로 리뷰리스트 불러오기

        int startNum = (pageNum -1)* PAGE_LIMIT+1;
        int endNum = startNum + PAGE_LIMIT -1;

        return rDao.selectReviewList(pro_num, startNum, endNum);
    }

    //밑에 페이지 나타나는거 (리뷰)
    @Override
    public List<Integer> getPageList(String pro_num, int pageNum) {
        List<Integer> pageList = new ArrayList<>();
        // 총 게시글 갯수
        double totalCnt = this.getBoardCount(pro_num);
        // 마지막 페이지 번호 계산
        int lastPageNum = getlastNum(totalCnt);
        // 시작 페이지 번호 설정
        int startPageNum = ((int) (Math.ceil((double) pageNum / ROW_LIMIT) - 1) * ROW_LIMIT) + 1;
        // 현재 페이지를 기준으로 마지막 페이지 번호 조정
        lastPageNum = Math.min(lastPageNum, startPageNum + ROW_LIMIT - 1);
        // 페이지 번호 할당
        for (int val = startPageNum; val <= lastPageNum; val++) {
            pageList.add(val);
        }
        System.out.println(pageList.size());
        return pageList;
    }
    // 마지막 페이지 번호 계산
    public int getlastNum(double cnt) {
        return (int) (Math.ceil(cnt / PAGE_LIMIT));
    }
    // 전체 게시글 카운트
    public int getBoardCount(String pro_num) {
        return rDao.selectCountReview(pro_num);
    }
    //페이징 마지막 번호 호출
    @Override
    public int LastpageNum(String pro_num) {
        return getlastNum(this.getBoardCount(pro_num));
    }



    @Override
    public List<ReviewDto> getReviewPhotoList(String pro_num, int pageNum) {    // 포토리뷰 불러오기
        int startNum = (pageNum -1)* PAGE_LIMIT+1;
        int endNum = startNum + PAGE_LIMIT -1;

        return rDao.selectReviewPhotoList(pro_num, startNum, endNum);
    }
    //포토리뷰 페이징
    public List<Integer> getPageListPhoto(String pro_num,int pageNum){
        List<Integer> pageList = new ArrayList<>();
        //총 게시글 갯수
        double totalCnt = this.getBoardCountPhoto(pro_num);
        //마지막 페이지 번호 계산
        int lastPageNum = getlastNumPhoto(totalCnt);
        //시작 페이지 번호 설정
        int startPageNum = ((int)(Math.ceil((double)pageNum / ROW_LIMIT)-1)*ROW_LIMIT)+1;
        //현재 페이지를 기준으로 마지막 페이지 번호 조정
        lastPageNum = Math.min(lastPageNum,startPageNum+ROW_LIMIT-1);
        //페이지 번호 할당
        for(int val=startPageNum; val<=lastPageNum;val++){
            pageList.add(val);
        }
        return pageList;
    }
    // 마지막 페이지 번호 계산
    public int getlastNumPhoto(double cnt) {
        return (int) (Math.ceil(cnt / PAGE_LIMIT));
    }
    // 전체 게시글 카운트
    public int getBoardCountPhoto(String pro_num) {
        return rDao.selectCountReviewPhoto(pro_num);
    }
    //페이징 마지막 번호 호출
    @Override
    public int LastpageNumPhoto(String pro_num) {
        return getlastNumPhoto(this.getBoardCountPhoto(pro_num));
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
    public void addReview(String id,String key,String title,String stars,String content,String image1,String proNum) {
        rDao.insertReview(id,key,title,stars,content,image1,proNum);
    }

//    @Override
//    public List<ProductQuestionDto> getPQuestion(String pro_num) {      //해당 상품 문의 불러오기
//        return pqDao.selectPQuestion(pro_num);
//    }

    @Override
    public int getQuestionCount(String pro_num) {       //해당 상품 문의 카운트
        return pqDao.selectQuestionCount(pro_num);
    }

    @Override
    public List<HashMap<String, Object>> getQAList(String pro_num, int pageNum) {      //해당 상품 문의/질의 불러오기

        int startNum = (pageNum -1)* PAGE_LIMIT+1;
        int endNum = startNum + PAGE_LIMIT -1;

        return pqDao.selectQAList(pro_num,startNum, endNum);
    }
    //밑에 페이지 나타나는거 (질문문의)
    @Override
    public List<Integer> getPageListQA(String pro_num, int pageNum) {
        List<Integer> pageListQA = new ArrayList<>();
        // 총 게시글 갯수
        double totalCnt = this.getBoardCountQA(pro_num);
        // 마지막 페이지 번호 계산
        int lastPageNum = getlastNumQA(totalCnt);
        // 시작 페이지 번호 설정
        int startPageNumQA = ((int) (Math.ceil((double) pageNum / ROW_LIMIT) - 1) * ROW_LIMIT) + 1;
        // 현재 페이지를 기준으로 마지막 페이지 번호 조정
        lastPageNum = Math.min(lastPageNum, startPageNumQA + ROW_LIMIT - 1);
        // 페이지 번호 할당
        for (int val = startPageNumQA; val <= lastPageNum; val++) {
            pageListQA.add(val);
        }
        System.out.println(pageListQA.size());
        return pageListQA;
    }
    // 마지막 페이지 번호 계산
    public int getlastNumQA(double cnt) {
        return (int) (Math.ceil(cnt / PAGE_LIMIT));
    }
    // 전체 질문/문의 글 카운트
    public int getBoardCountQA(String pro_num) {
        return pqDao.selectQuestionCount(pro_num);
    }

    //페이징 마지막 번호 호출
    @Override
    public int LastpageNumQA(String pro_num) {
        return getlastNumQA(this.getBoardCountQA(pro_num));
    }





}
