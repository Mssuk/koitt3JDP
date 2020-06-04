//이준희
package com.koitt.tim.dto.product;

import java.sql.Timestamp;

public class ProductDto {

    private String pro_num;
    private String product_name;
    private int supply_price;
    private int product_price;
    private int sales_price;
    private int amount;
    private String product_state;
    private String manufacturer;
    private String nutrient;
    private int product_kcal;
    private String shelf_life;
    private String packing;
    private String capacity;
    private String front_image1;
    private String front_image2;
    private String front_image3;
    private String back_image;
    private Timestamp registration_date;
    private Timestamp update_date;
    private int point;

    public int getPoint() {
        return point;
    }

    public void setPoint() {
        this.point = product_price/100;
    }

    public String getPro_num() {
        return pro_num;
    }

    public void setPro_num(String pro_num) {
        this.pro_num = pro_num;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public int getSupply_price() {
        return supply_price;
    }

    public void setSupply_price(int supply_price) {
        this.supply_price = supply_price;
    }

    public int getProduct_price() {
        return product_price;
    }

    public void setProduct_price(int product_price) {
        this.product_price = product_price;
    }

    public int getSales_price() {
        return sales_price;
    }

    public void setSales_price(int sales_price) {
        this.sales_price = sales_price;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getProduct_state() {
        return product_state;
    }

    public void setProduct_state(String product_state) {
        this.product_state = product_state;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public String getNutrient() {
        return nutrient;
    }

    public void setNutrient(String nutrient) {
        this.nutrient = nutrient;
    }

    public int getProduct_kcal() {
        return product_kcal;
    }

    public void setProduct_kcal(int product_kcal) {
        this.product_kcal = product_kcal;
    }

    public String getShelf_life() {
        return shelf_life;
    }

    public void setShelf_life(String shelf_life) {
        this.shelf_life = shelf_life;
    }

    public String getPacking() {
        return packing;
    }

    public void setPacking(String packing) {
        this.packing = packing;
    }

    public String getCapacity() {
        return capacity;
    }

    public void setCapacity(String capacity) {
        this.capacity = capacity;
    }

    public String getFront_image1() {
        return front_image1;
    }

    public void setFront_image1(String front_image1) {
        this.front_image1 = front_image1;
    }

    public String getFront_image2() {
        return front_image2;
    }

    public void setFront_image2(String front_image2) {
        this.front_image2 = front_image2;
    }

    public String getFront_image3() {
        return front_image3;
    }

    public void setFront_image3(String front_image3) {
        this.front_image3 = front_image3;
    }

    public String getBack_image() {
        return back_image;
    }

    public void setBack_image(String back_image) {
        this.back_image = back_image;
    }

    public Timestamp getRegistration_date() {
        return registration_date;
    }

    public void setRegistration_date(Timestamp registration_date) {
        this.registration_date = registration_date;
    }

    public Timestamp getUpdate_date() {
        return update_date;
    }

    public void setUpdate_date(Timestamp update_date) {
        this.update_date = update_date;
    }
}
