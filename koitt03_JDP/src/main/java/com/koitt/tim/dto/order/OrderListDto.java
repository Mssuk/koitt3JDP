package com.koitt.tim.dto.order;

public class OrderListDto {
    private String key;
    private String o_num;
    private String pro_num;
    private String o_quant;
    private String price;
    private String product_name;

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getO_num() {
        return o_num;
    }

    public void setO_num(String o_num) {
        this.o_num = o_num;
    }

    public String getPro_num() {
        return pro_num;
    }

    public void setPro_num(String pro_num) {
        this.pro_num = pro_num;
    }

    public String getO_quant() {
        return o_quant;
    }

    public void setO_quant(String o_quant) {
        this.o_quant = o_quant;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }
}
