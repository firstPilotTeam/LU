package com.qf.manager.web;


import com.qf.common.pojo.dto.dto.ItemResult;
import com.qf.common.pojo.dto.dto.PageInfo;
import com.qf.manager.pojo.vo.TbItemCustom;
import com.qf.manager.pojo.vo.Users;
import com.qf.manager.service.ItemService;
import com.qf.manager.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * User: DHC
 * Date: 2018/10/25
 * Time: 15:28
 * Version:V1.0
 */
@Controller
public class ManagerIndexAction {
    @Autowired
    private ItemService itemService;

    @Autowired
    private UsersService usersService;
//    @GetMapping("/{path}")
//    public String index1(@PathVariable String path) {
//        return path;
//    }
//
//    @GetMapping("/pages/{path}")
//    public String index2(@PathVariable String path) {
//        return "pages/" + path;
//    }
//
//    @GetMapping("/pages/{path1}/{path2}")
//    public String index3(@PathVariable String path1, @PathVariable String path2) {
//        return "pages/" + path1 + "/" + path2;
//    }

//    @ResponseBody
//    @GetMapping("/items")
//    public ItemResult<TbItemCustom> listItemsByPage(PageInfo pageInfo){
//        return itemService.listItemsByPage(pageInfo);
//    }
//
//    @ResponseBody
//    @PostMapping("/items/batch")
//    public int batchItems(@RequestParam("ids[]") List<Long> ids){
//        return itemService.batchItems(ids);
//    }

    //登入验证
    @ResponseBody
    @GetMapping("/user")
    public int users(Users users){

        int data= usersService.user(users);
        return data;
    }

    //注册校验用户名
    @ResponseBody
    @PostMapping("/username")
    public int username(@RequestParam("uname") String uname){
        return usersService.username(uname);
    }

    //注册信息
    @ResponseBody
    @PostMapping("/adduser")
    public int adduser(Users users){
        return usersService.adduser(users);
    }
}
