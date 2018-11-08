package com.qf.manager.pojo.po;

public class Sort {
    private Integer id;

    private String sortnumber;

    private String sname;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSortnumber() {
        return sortnumber;
    }

    public void setSortnumber(String sortnumber) {
        this.sortnumber = sortnumber == null ? null : sortnumber.trim();
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname == null ? null : sname.trim();
    }
}