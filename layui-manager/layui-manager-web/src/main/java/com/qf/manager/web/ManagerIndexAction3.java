package com.qf.manager.web;

import com.qf.common.pojo.dto.PageInfo;
import com.qf.common.pojo.dto.UserResult;
import com.qf.manager.pojo.po.User;
import com.qf.manager.pojo.vo.UserCustom;
import com.qf.manager.pojo.vo.UserQuery;
import com.qf.manager.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * User: DHC
 * Date: 2018/10/25
 * Time: 15:28
 * Version:V1.0
 */
@Controller
public class ManagerIndexAction3 {
    @Autowired
    private UserService userService;
/*
    @GetMapping("/{path}")
    public String index1(@PathVariable String path) {
        return path;
    }

    @GetMapping("/pages/{path}")
    public String index2(@PathVariable String path) {
        return "pages/" + path;
    }

    @GetMapping("/pages/{path1}/{path2}")
    public String index3(@PathVariable String path1, @PathVariable String path2) {
        return "pages/" + path1 + "/" + path2;
    }*/

    @ResponseBody
    @GetMapping("/users")
    public UserResult<UserCustom> listUserByPageAndSearch(PageInfo pageInfo, UserQuery query){
        return userService.listUserByPageAndSearch(pageInfo,query);
    }

    @ResponseBody
    @PostMapping("/users/batch")
    public int batchUsers(@RequestParam("ids[]")List<Integer> ids){
        return userService.batchUsers(ids);
    }

    @ResponseBody
    @PostMapping("/users/add")
    public void add(@RequestBody Map<String,Object> map){
        userService.add(map);
    }

    @ResponseBody
    @PostMapping("/users/edit")
    public void edit(@RequestBody Map<String,Object> map){
        userService.edit(map);
    }
}
