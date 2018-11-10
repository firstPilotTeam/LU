package com.qf.common.pojo.dto;

public class selectInfo {
    private int page;
    private int limit;
    private String receiver;

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }
    public int getOffset(){
        return (page-1)*limit;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }
}
