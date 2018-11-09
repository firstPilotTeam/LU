package com.qf.manager.service.impl;

import com.qf.manager.dao.UsersDao;
import com.qf.manager.pojo.vo.Users;
import com.qf.manager.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 初秋 on 2018/11/8.
 */
@Service
public class UsersServiceImpl  implements UsersService{
    @Autowired
    UsersDao dao;

    @Override
    public int user(Users users) {
        int a=dao.users(users);
        return a;
    }

    @Override
    public int username(String uname) {
        Users users= new Users();
        users.setUname(uname);

        return dao.username(users);
    }

    @Override
    public int adduser(Users users) {
        users.setQid(1);
        return dao.adduser(users);
    }
}
