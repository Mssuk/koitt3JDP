package com.koitt.tim.dto.order;

import org.springframework.context.annotation.Bean;

import java.sql.Timestamp;

public class OrderListDto {

    private String key;
    private Timestamp o_date;
    private String o_num;
    private String product_name;
    private String price;
    private int quantity;
    private String status;

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public Timestamp getO_date() {
        return o_date;
    }

    public void setO_date(Timestamp o_date) {
        this.o_date = o_date;
    }

    public String getO_num() {
        return o_num;
    }

    public void setO_num(String o_num) {
        this.o_num = o_num;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
