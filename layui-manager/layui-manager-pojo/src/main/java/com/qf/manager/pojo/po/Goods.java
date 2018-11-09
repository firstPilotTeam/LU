package com.qf.manager.pojo.po;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Goods {
    private Integer id;

    private String goodsnumber;

    private String gname;

    private String features;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date Shelftime;

    private String snumber;

    private Integer stock;

    private String state;

    private String ishot;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getGoodsnumber() {
        return goodsnumber;
    }

    public void setGoodsnumber(String goodsnumber) {
        this.goodsnumber = goodsnumber;
    }

    public String getGname() {
        return gname;
    }

    public void setGname(String gname) {
        this.gname = gname;
    }

    public String getFeatures() {
        return features;
    }

    public void setFeatures(String features) {
        this.features = features;
    }

    public Date getShelftime() {
        return Shelftime;
    }

    public void setShelftime(Date shelftime) {
        Shelftime = shelftime;
    }

    public String getSnumber() {
        return snumber;
    }

    public void setSnumber(String snumber) {
        this.snumber = snumber;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getIshot() {
        return ishot;
    }

    public void setIshot(String ishot) {
        this.ishot = ishot;
    }
}