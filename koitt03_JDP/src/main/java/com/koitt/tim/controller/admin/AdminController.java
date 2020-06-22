//송민석

package com.koitt.tim.controller.admin;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.koitt.tim.dto.admin.AnswerDto;
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
import com.koitt.tim.service.admin.AdminService;
import com.koitt.tim.utils.CommonUtils;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("admin")
public class AdminController {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private AdminService adminService;

	@Autowired
	CommonUtils utils;

	// memberList 갖고옴
	@GetMapping("mlist")
	public List<MemberDto> mlist() {
		return adminService.getAllMembers();
	}

	// eventList 갖고 옴
	@GetMapping("elist/{start}/{end}")
	public List<EventDto> elist(@PathVariable("start") int startPage, @PathVariable("end") int endPage) {

		return adminService.getAllEvents(startPage, endPage);
	}

	// couponList 갖고옴
	@GetMapping("couplist")
	public List<CouponDto> couplist() {
		return adminService.getAllCoupons();

	}

	// event file upload
	@PostMapping(value = "/elist", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public ResponseEntity<?> uploadFile(MultipartFile thumbnailImg, MultipartFile contextImg, String startDate,
			String endDate, String startTime, String endTime, String eventTitle, String editorHtml, String coupon)
			throws IOException {

		Timestamp startT = utils.timeConcat(startDate, startTime);
		Timestamp endT = utils.timeConcat(endDate, endTime);

		EventDto eDto = new EventDto();
		eDto.setCoupon_num(coupon);
		eDto.setEvent_start(startT);
		eDto.setEvent_end(endT);
		eDto.setEvent_title(eventTitle);
		eDto.setEvent_content(editorHtml);
		eDto.setEvent_image1(utils.FileUploaderCDN(thumbnailImg, "event/"));
		eDto.setEvent_image2(utils.FileUploaderCDN(contextImg, "event/"));

		adminService.insertEvent(eDto);

		return ResponseEntity.ok().build();
	}

	// notice 가져옴
	@GetMapping("nlist")
	public List<NoticeDto> nlist() {
		return adminService.getAllNotices();
	}

	// notice 저장
	@PostMapping("nlist")
	public ResponseEntity<?> nlist(@RequestBody NoticeDto nDto) {
		adminService.insertNotice(nDto);
		return ResponseEntity.ok().build();
	}

	// product 가져옴
	@GetMapping("plist")
	public List<ProductDto> pList() {
		return adminService.getAllProducts();
	}

	// Category 1 가져옴
	@GetMapping("plist/category/1")
	public List<CategoryDept1Dto> pC1List() {
		return adminService.getAllCate1();
	}

	// Category 2 가져옴
	@GetMapping("plist/category/2")
	public List<CategoryDept2Dto> pC2List() {
		return adminService.getAllCate2();
	}

	// Product 저장
	@PostMapping(value = "plist")
	public ResponseEntity<?> plist(String cate_code_d1, String cate_code_d2, ProductDto pDto, MultipartFile file1,
			MultipartFile file2, MultipartFile file3, MultipartFile file4) throws IOException {

		try {
			logger.info("{}", cate_code_d1);
			logger.info("{}", cate_code_d2);

			ProductSerialDto psDto = new ProductSerialDto();
			psDto.setCate_code_d1(cate_code_d1);
			psDto.setCate_code_d2(cate_code_d2);

			if (file1 != null) {
				pDto.setBack_image(utils.FileUploaderCDN(file1, "product/"));
			}
			if (file2 != null) {
				pDto.setFront_image1(utils.FileUploaderCDN(file2, "product/"));
			}
			if (file3 != null) {
				pDto.setFront_image2(utils.FileUploaderCDN(file3, "product/"));
			}
			if (file4 != null) {
				pDto.setFront_image3(utils.FileUploaderCDN(file4, "product/"));
			}
			adminService.insertProduct(psDto, pDto);

			return ResponseEntity.ok().build();
		} catch (Exception e) {
			System.out.println(e);
			return new ResponseEntity<>(e.toString(), HttpStatus.BAD_REQUEST);
		}
	}

	// 연관상품 불러오기
	@GetMapping("rplist")
	public List<RelatedProductDto> rpList() {
		return adminService.getAllRelatedProducts();
	}

	// 연관상품 등록
	@PostMapping("rplist")
	public ResponseEntity<?> rpList(@RequestBody HashMap<String, String> map) {

		logger.info("{}", map);
		adminService.insertRelatedProduct(map.get("targetId"), map.get("additionId"), map.get("index"));
		return ResponseEntity.ok().build();
	}

	// 연관 상품 삭제시 null값으로 필드 업데이트
	@PutMapping("rplist")
	public ResponseEntity<Object> rpListPut(@RequestBody HashMap<String, String> map) {
		logger.info("{}", map);
		adminService.updateRelateProduct(map.get("targetId"), map.get("index"));
		return ResponseEntity.ok("update OK");

	}

	// 카테고리 등록
	@PostMapping("plist/category/{flag}")
	public ResponseEntity<String> pCList(@PathVariable("flag") int flag, @RequestBody HashMap<String, String> map) {

		try {
			if (flag == 1) {
				logger.info("{}", map);
				CategoryDept1Dto cDto = new CategoryDept1Dto();
				cDto.setCate_code_d1(map.get("cate_code_d1"));
				cDto.setCate_name_d1(map.get("cate_name_d1"));
				adminService.insertCate1(cDto);
			}
			if (flag == 2) {
				logger.info("{}", map);
				CategoryDept2Dto cDto = new CategoryDept2Dto();
				cDto.setCate_code_d1(map.get("cate_code_d1"));
				cDto.setCate_code_d2(map.get("cate_code_d2"));
				cDto.setCate_name_d2(map.get("cate_name_d2"));
				adminService.insertCate2(cDto);

			}
			return ResponseEntity.ok("category added");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(e.toString(), HttpStatus.BAD_REQUEST);
		}
	}

	// 카테고리 삭제
	@DeleteMapping("plist/category/{flag}/{data}")
	public ResponseEntity<String> pCList(@PathVariable("flag") int flag, @PathVariable("data") String code) {

		try {
			if (flag == 1) {
				logger.info("{}", code);
				adminService.deleteCate1(code);
			} else if (flag == 2) {
				logger.info("{}", code);
				adminService.deleteCate2(code);

			}
			return ResponseEntity.ok("category deleted");
		} catch (Exception e) {
			return new ResponseEntity<>(e.toString(), HttpStatus.BAD_REQUEST);
		}

	}

	// 모든 씨리얼 넘버
	@GetMapping("plist/serial")
	public List<ProductSerialDto> serialList() {
		return adminService.getAllSerialNumber();
	}

	// 상품 삭제
	@DeleteMapping("plist/{data}")
	public ResponseEntity<String> pList(@PathVariable("data") String code) {
		try {
			adminService.deleteProduct(code);
			return ResponseEntity.ok("product deleted");
		} catch (Exception e) {
			return new ResponseEntity<>(e.toString(), HttpStatus.BAD_REQUEST);
		}

	}

	// 상품 수정
	@PostMapping("plistp")
	public ResponseEntity<?> plistP(String cate_code_d1, String cate_code_d2, MultipartFile newBackImg,
			MultipartFile newfront_image1, MultipartFile newfront_image2, MultipartFile newfront_image3,
			ProductDto pDto) throws IOException {

		try {

			// 일단 pDto로 조회
			ProductSerialDto nsDto = adminService.getSerialOne(pDto.getPro_num());

			if (nsDto != null) {

				nsDto.setCate_code_d1(cate_code_d1);
				nsDto.setCate_code_d2(cate_code_d2);

				if (newBackImg != null) {
					pDto.setBack_image(utils.FileUploaderCDN(newBackImg, "product/"));
				}
				if (newfront_image1 != null) {
					pDto.setFront_image1(utils.FileUploaderCDN(newfront_image1, "product/"));
				}
				if (newfront_image2 != null) {
					pDto.setFront_image2(utils.FileUploaderCDN(newfront_image2, "product/"));
				}
				if (newfront_image3 != null) {
					pDto.setFront_image3(utils.FileUploaderCDN(newfront_image3, "product/"));
				}

				// 상품카테고리 업데이트
				// 상품 업데이트
				adminService.updateProduct(pDto, nsDto);

			} else

			{
				throw new Exception("존재하지 않는 상품: 수정시도");
			}

			return ResponseEntity.ok().build();

		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>(e.toString(), HttpStatus.BAD_REQUEST);
		}
	}

	// 메인상품 데이터 가져오기
	@GetMapping("mplist")
	public List<MainProductDto> mpList() {
		return adminService.getAllMProduct();
	}

	// 메인 상품 상태 업데이트
	@PutMapping("mplist")
	public ResponseEntity<?> mpList(@RequestBody HashMap<String, String> map) {

		logger.info("{}", map);
		adminService.updateMProduct(map.get("pro_num"), map.get("idx"), Integer.parseInt((map.get("val"))));

		return ResponseEntity.ok().build();
	}

	// 상품문의글 가져오기
	@GetMapping("pqlist")
	public List<ProductQuestionDto> pqList() {

		return adminService.getAllPQuestion();
	}

	// 상품답변글 가져오기
	@GetMapping("pqalist")
	public List<ProductAnswerDto> pqaList() {
		return adminService.getAllPAnswer();
	}

	// 상품답변글 달기
	@PostMapping("pqalist")
	public void pqaList(@RequestBody HashMap<String, String> map) {
		logger.info("{}", map);
		ProductAnswerDto paDto = new ProductAnswerDto();
		paDto.setQ_num(map.get("key"));
		paDto.setA_content(map.get("text"));
		adminService.insertPAnswer(paDto);

	}

	// 상품답변글 수정
	@PutMapping("pqalist")
	public void pqaListP(@RequestBody HashMap<String, String> map) {

		adminService.updatePAnswer(map.get("key"), map.get("text"));
	}

	// 상품답변글 삭제
	@DeleteMapping("pqalist/{key}")
	public void pqaListD(@PathVariable("key") String a_num) {

		adminService.deletePAnswer(a_num);
	}

	// 1:1문의글 불러오기
	@GetMapping("qlist")
	public List<QuestionDto> qList() {
		return adminService.getAllQuestion();
	}

	// 1:1문의 답변글 불러오기
	@GetMapping("alist")
	public List<AnswerDto> aList() {
		return adminService.getAllAnswer();
	}

	// 1:1문의답변글 등록
	@PostMapping("alist")
	public void alist(@RequestBody HashMap<String, String> map) {
		logger.info("{}", map);
		AnswerDto aDto = new AnswerDto();
		aDto.setQ_num(map.get("key"));
		aDto.setA_content(map.get("text"));
		adminService.addAnswer(aDto);

	}

	// 1:1문의답변글 삭제
	@DeleteMapping("alist/{key}")
	public void aList(@PathVariable("key") String a_num) {
		adminService.deleteAnswer(a_num);
	}

	// 1:1문의답변글 수정
	@PutMapping("alist")
	public void aListU(@RequestBody HashMap<String, String> map) {
		logger.info("{}", map);
		AnswerDto aDto = new AnswerDto();
		aDto.setA_num(map.get("key"));
		aDto.setA_content(map.get("text"));
		adminService.updateAnswer(aDto);
	}

	// 1:1문의글 분류가져오기
	@GetMapping("aqlist")
	public List<String> aqList() {
		return adminService.getAllQType();
	}

	// 리뷰 목록 가져오기
	@GetMapping("rlist")
	public List<ReviewDto> rList() {
		return adminService.getAllReview();
	}

	// 리뷰답변 등록
	@PatchMapping("rlist")
	public void rListu(@RequestBody HashMap<String, String> map) {
		logger.info("{}", map);
		adminService.updateReviewAnswerA(map.get("key"), map.get("text"));
	}

	// 리뷰답변 삭제
	@PatchMapping("rlist/{key}")
	public void rListu(@PathVariable("key") String key) {
		adminService.updateReviewAnswerD(key);
	}

	// 리뷰 상품정보 가져오기
	@GetMapping("rlistp/{key}")
	public HashMap<String, Object> rListp(@PathVariable("key") String key) {
		System.out.println(adminService.getReviewPro(key));
		return adminService.getReviewPro(key);
	}

	// faq 불러오기
	@GetMapping("faqlist")
	public List<FaqDto> faqList() {
		return adminService.getAllFaq();
	}

}
