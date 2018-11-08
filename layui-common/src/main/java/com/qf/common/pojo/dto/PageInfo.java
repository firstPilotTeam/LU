package com.qf.common.pojo.dto;

public class PageInfo {

    private int page;
    private int limit;

    public int getAge() {
        return page;
    }

    public void setAge(int age) {
        this.page = age;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public int getOffset() {
        return (page - 1) * limit;
    }
}
