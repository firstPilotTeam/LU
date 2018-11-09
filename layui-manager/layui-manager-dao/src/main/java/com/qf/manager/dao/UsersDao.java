package com.qf.manager.dao;

import com.qf.manager.pojo.vo.Users;

/**
 * Created by 初秋 on 2018/11/8.
 */
public interface UsersDao {

    int users(Users users);

    int username(Users users);

    int adduser(Users users);
}
