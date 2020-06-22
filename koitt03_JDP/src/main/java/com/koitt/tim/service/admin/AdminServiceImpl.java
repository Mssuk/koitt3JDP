package com.koitt.tim.service.admin;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.koitt.tim.dao.admin.AnswerDao;
import com.koitt.tim.dao.board.FaqDao;
import com.koitt.tim.dao.board.NoticeDao;
import com.koitt.tim.dao.category.CategoryDao;
import com.koitt.tim.dao.coupon.CouponDao;
import com.koitt.tim.dao.event.EventDao;
import com.koitt.tim.dao.member.MemberDao;
import com.koitt.tim.dao.product.MainProductDao;
import com.koitt.tim.dao.product.ProductAnswerDao;
import com.koitt.tim.dao.product.ProductDao;
import com.koitt.tim.dao.product.ProductQuestionDao;
import com.koitt.tim.dao.product.ProductSerialDao;
import com.koitt.tim.dao.product.RelatedProductDao;
import com.koitt.tim.dao.question.QuestionDao;
import com.koitt.tim.dao.review.ReviewDao;
import com.koitt.tim.dto.admin.AnswerDto;
import com.koitt.tim.dto.admin.MallDto;
import com.koitt.tim.dto.board.FaqDto;
import com.koitt.tim.dto.board.NoticeDto;
import com.koitt.tim.dto.category.CategoryDept1Dto;
import com.koitt.tim.dto.category.CategoryDept2Dto;
import com.koitt.tim.dto.coupon.CouponDto;
import com.koitt.tim.dto.event.EventDto;
import com.koitt.tim.dto.member.MemberDto;
import com.koitt.tim.dto.product.MainProductDto;
import com.koitt.tim.dto.product.ProductAnswerDto;
import com.koitt.tim.dto.product.ProductDto;
import com.koitt.tim.dto.product.ProductQuestionDto;
import com.koitt.tim.dto.product.ProductSerialDto;
import com.koitt.tim.dto.product.RelatedProductDto;
import com.koitt.tim.dto.question.QuestionDto;
import com.koitt.tim.dto.review.ReviewDto;

@Service
public class AdminServiceImpl implements AdminService {

//	@Autowired
//	private MallDao mallDao;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private EventDao eventDao;
	@Autowired
	private CouponDao couponDao;
	@Autowired
	private NoticeDao noticeDao;
	@Autowired
	private ProductDao productDao;
	@Autowired
	private CategoryDao categoryDao;
	@Autowired
	private ProductSerialDao psDao;
	@Autowired
	private ProductDao pDao;
	@Autowired
	private RelatedProductDao rpDao;
	@Autowired
	private MainProductDao mpDao;
	@Autowired
	private ProductQuestionDao pqDao;
	@Autowired
	private ProductAnswerDao paDao;
	@Autowired
	private QuestionDao qDao;
	@Autowired
	private AnswerDao aDao;
	@Autowired
	private ReviewDao rDao;
	@Autowired
	private FaqDao faqDao;

	@Override
	public MallDto getMallInfo() {
		return null;
	}

	@Override
	public List<MemberDto> getAllMembers() {
		return memberDao.selectAllMember();
	}

	@Override
	public List<EventDto> getAllEvents(int start, int end) {
		// return eventDao.selectEvent(start, end);
		return eventDao.selectEventforA();
	}

	@Override
	public List<CouponDto> getAllCoupons() {
		return couponDao.selectAllCoupon();
	}

	@Override
	public void insertEvent(EventDto eDto) {
		eventDao.insertEvent(eDto);
	}

	@Override
	public List<NoticeDto> getAllNotices() {
		return noticeDao.selectAllNoticeAdmin();
	}

	@Override
	public void insertNotice(NoticeDto nDto) {
		noticeDao.insertNotice(nDto);
	}

	@Override
	public List<ProductDto> getAllProducts() {
		return productDao.selectProduct();
	}

	@Override
	public List<CategoryDept1Dto> getAllCate1() {
		return categoryDao.selectAllDept1();
	}

	@Override
	public List<CategoryDept2Dto> getAllCate2() {
		return categoryDao.selectAllDept2();
	}

	@Transactional
	@Override
	public void insertProduct(ProductSerialDto psDto, ProductDto pDto) {

		// 상품번호 넣기
		psDao.insertProductSerial(psDto);
		String pro_num = psDto.getPro_num();
		pDto.setPro_num(pro_num);

		// 상품 넣기
		pDao.insertProduct(pDto);
		// 연관상품 넣기
		rpDao.insertRProduct(pro_num);

		// 메인화면 상품 넣기
		mpDao.insertMProduct(pro_num);
	}

	@Override
	public List<RelatedProductDto> getAllRelatedProducts() {
		return rpDao.selectAllRProduct();
	}

	@Override
	public void insertRelatedProduct(String targetId, String additionId, String index) {
		String realIdx = "REC_PRO_NUM" + index;
		rpDao.insertRProductEach(targetId, additionId, realIdx);

	}

	@Override
	public void updateRelateProduct(String targetId, String index) {
		String realIdx = "REC_PRO_NUM" + index;
		rpDao.updateRProduct(targetId, realIdx);

	}

	@Override
	public void insertCate1(CategoryDept1Dto cDto) {
		categoryDao.insertDept1(cDto);

	}

	@Override
	public void insertCate2(CategoryDept2Dto cDto) {
		categoryDao.insertDept2(cDto);
	}

	@Override
	public void deleteCate1(String code) {
		categoryDao.deleteDept1(code);

	}

	@Override
	public void deleteCate2(String code) {
		categoryDao.deleteDept2(code);

	}

	@Override
	public List<ProductSerialDto> getAllSerialNumber() {
		return psDao.selectAllSerial();
	}

	@Transactional
	@Override
	public void deleteProduct(String code) {

		// 메인화면 상품 삭제
		mpDao.deleteMProduct(code);
		// 연관상품 삭제
		rpDao.deleteRProduct(code);
		// 상품 삭제
		pDao.deleteProduct(code);
		// 상품번호 삭제
		psDao.deleteProductSerial(code);
	}

	@Override
	public ProductDto getProduct(String pro_num) {
		return productDao.selectProductOne(pro_num);
	}

	@Transactional
	@Override
	public void updateProduct(ProductDto pDto, ProductSerialDto psDto) {

		// 상품번호업데이트
		psDao.updateProductCategory(psDto);

		// 상품 업데이트
		productDao.updateProduct(pDto);

	}

	@Override
	public ProductSerialDto getSerialOne(String code) {
		return psDao.selectSerial(code);
	}

	@Override
	public List<MainProductDto> getAllMProduct() {
		return mpDao.selectAllMProduct();
	}

	@Override
	public void updateMProduct(String code, String index, int value) {

		String mv = "";
		switch (index) {
		case "1":
			mv = "hit_p";
			break;
		case "2":
			mv = "hot_p";
			break;

		case "3":
			mv = "new_p";
			break;

		case "4":
			mv = "sale_p";
			break;
		}

		mpDao.updateMProduct(code, mv, value);

	}

	@Override
	public List<ProductQuestionDto> getAllPQuestion() {
		return pqDao.selectProductQuestions();
	}

	@Override
	public List<ProductAnswerDto> getAllPAnswer() {
		return paDao.selectAllPAnswer();
	}

	@Override
	public void insertPAnswer(ProductAnswerDto paDto) {
		paDao.insertPAnswer(paDto);

	}

	@Override
	public void updatePAnswer(String key, String content) {
		paDao.updatePAnswer(key, content);
	}

	@Override
	public void deletePAnswer(String key) {
		paDao.deletePAnswer(key);
	}

	@Override
	public List<QuestionDto> getAllQuestion() {
		return qDao.selectAllQuestion();

	}

	@Override
	public List<AnswerDto> getAllAnswer() {

		return aDao.selectAllAnswer();
	}

	@Override
	public void addAnswer(AnswerDto aDto) {
		aDao.insertAnswer(aDto);
	}

	@Override
	public void updateAnswer(AnswerDto aDto) {
		aDao.updateAnswer(aDto);
	}

	@Override
	public void deleteAnswer(String key) {
		aDao.deleteAnswer(key);

	}

	@Override
	public List<String> getAllQType() {
		return qDao.selectAllQType();
	}

	@Override
	public List<ReviewDto> getAllReview() {
		return rDao.selectAllReview();
	}

	@Override
	public void updateReviewAnswerA(String key, String text) {
		rDao.updateReviewAnswerA(key, text);

	}

	@Override
	public void updateReviewAnswerD(String key) {
		rDao.updateReviewAnswerD(key);

	}

	@Override
	public HashMap<String, Object> getReviewPro(String key) {
		return rDao.reviewProductNQ(key);
	}

	@Override
	public List<FaqDto> getAllFaq() {
		return faqDao.selectAllFaq();
	}

	@Override
	public void addFaq(FaqDto faqDto) {
		faqDao.insertFaq(faqDto);
	}

	@Override
	public void deleteFaq(String key) {
		faqDao.deleteFaq(key);
	}

}
