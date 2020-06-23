package com.koitt.tim.dto.review;

import java.sql.Timestamp;

public class ReviewDto {
	private String review_num;
	private String id;
	private String key;
	private String title;
	private Timestamp regist_review;
	private int hit;
	private int score;
	private String content;
	private String image;
	private String admin_answer;
	private String pro_num;

	public String getReview_num() {
		return review_num;
	}

	public void setReview_num(String review_num) {
		this.review_num = review_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Timestamp getRegist_review() {
		return regist_review;
	}

	public void setRegist_review(Timestamp regist_review) {
		this.regist_review = regist_review;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getAdmin_answer() {
		return admin_answer;
	}

	public void setAdmin_answer(String admin_answer) {
		this.admin_answer = admin_answer;
	}

	public String getPro_num() {
		return pro_num;
	}

	public void setPro_num(String pro_num) {
		this.pro_num = pro_num;
	}

}
