package com.koitt.tim.dto.order;

import java.sql.Timestamp;

public class OrderDto {

    private String o_num;
    private String id;
    private String o_point;
    private String o_state;
    private String o_name;
    private String o_tel;
    private String o_cost;
    private Timestamp o_date;

    public String getO_num() {
        return o_num;
    }

    public void setO_num(String o_num) {
        this.o_num = o_num;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getO_point() {
        return o_point;
    }

    public void setO_point(String o_point) {
        this.o_point = o_point;
    }

    public String getO_state() {
        return o_state;
    }

    public void setO_state(String o_state) {
        this.o_state = o_state;
    }

    public String getO_name() {
        return o_name;
    }

    public void setO_name(String o_name) {
        this.o_name = o_name;
    }

    public String getO_tel() {
        return o_tel;
    }

    public void setO_tel(String o_tel) {
        this.o_tel = o_tel;
    }

    public String getO_cost() {
        return o_cost;
    }

    public void setO_cost(String o_cost) {
        this.o_cost = o_cost;
    }

    public Timestamp getO_date() {
        return o_date;
    }

    public void setO_date(Timestamp o_date) {
        this.o_date = o_date;
    }
}
