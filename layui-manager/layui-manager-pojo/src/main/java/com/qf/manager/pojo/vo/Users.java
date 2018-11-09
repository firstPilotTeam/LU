package com.qf.manager.pojo.vo;

import com.qf.manager.pojo.po.TbItem;

/**
 * Created by 初秋 on 2018/11/8.
 */
public class Users  extends TbItem {
    private  String uname;
    private  int  password;
    private  int uid;
    private  int qid;

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getQid() {
        return qid;
    }

    public void setQid(int qid) {
        this.qid = qid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public int getPassword() {
        return password;
    }

    public void setPassword(int password) {
        this.password = password;
    }
}
