package com.koitt.tim.dto.order;

import java.sql.Timestamp;

public class PaymentDto {

    private String o_num;
    private String o_way;
    private Timestamp o_date;
    private int o_sum;

    public String getO_num() {
        return o_num;
    }

    public void setO_num(String o_num) {
        this.o_num = o_num;
    }

    public String getO_way() {
        return o_way;
    }

    public void setO_way(String o_way) {
        this.o_way = o_way;
    }

    public Timestamp getO_date() {
        return o_date;
    }

    public void setO_date(Timestamp o_date) {
        this.o_date = o_date;
    }

    public int getO_sum() {
        return o_sum;
    }

    public void setO_sum(int o_sum) {
        this.o_sum = o_sum;
    }
}
