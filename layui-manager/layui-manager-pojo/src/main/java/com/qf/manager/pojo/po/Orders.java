package com.qf.manager.pojo.po;


import java.sql.Date;

public class Orders {
    private int id;
    private int order_number;
    private int gnumber;
    private String receiver;
    private String phone;
    private double total;
    private double pay;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrder_number() {
        return order_number;
    }

    public void setOrder_number(int order_number) {
        this.order_number = order_number;
    }

    public int getGnumber() {
        return gnumber;
    }

    public void setGnumber(int gnumber) {
        this.gnumber = gnumber;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public double getPay() {
        return pay;
    }

    public void setPay(double pay) {
        this.pay = pay;
    }

}
