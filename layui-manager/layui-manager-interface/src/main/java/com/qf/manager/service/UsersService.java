package com.qf.manager.service;

import com.qf.manager.pojo.vo.Users;

/**
 * Created by 初秋 on 2018/11/8.
 */
public interface UsersService {

    int user(Users users);

   int username(String uname);

    int adduser(Users users);
}
