package com.koitt.tim.dto.review;

import java.sql.Timestamp;

public class ReviewDto {
    private String review_num;
    private String id;
    private String key;
    private String title;
    private Timestamp regist_review;
    private String hit;
    private String score;
    private String content;
    private String image_small;
    private String buy_check;
    private String group_num;
    private String image;
    private String board_type;
    private String write_check;
    private String admin_answer;


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

    public String getHit() {
        return hit;
    }

    public void setHit(String hit) {
        this.hit = hit;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImage_small() {
        return image_small;
    }

    public void setImage_small(String image_small) {
        this.image_small = image_small;
    }

    public String getBuy_check() {
        return buy_check;
    }

    public void setBuy_check(String buy_check) {
        this.buy_check = buy_check;
    }

    public String getGroup_num() {
        return group_num;
    }

    public void setGroup_num(String group_num) {
        this.group_num = group_num;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getBoard_type() {
        return board_type;
    }

    public void setBoard_type(String board_type) {
        this.board_type = board_type;
    }

    public String getWrite_check() {
        return write_check;
    }

    public void setWrite_check(String write_check) {
        this.write_check = write_check;
    }

    public String getAdmin_answer() {
        return admin_answer;
    }

    public void setAdmin_answer(String admin_answer) {
        this.admin_answer = admin_answer;
    }




}
