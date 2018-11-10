package com.qf.manager.web;

import com.qf.common.pojo.dto.OrdersResult;
import com.qf.common.pojo.dto.PageInfo;
import com.qf.manager.pojo.po.Orders;
import com.qf.manager.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@Controller
public class ManagerIndexAction2 {
    @Autowired
    private OrdersService service;

   /* @GetMapping("/{path}")
    public String toIndex(@PathVariable String path){
        return path;
    }
    @GetMapping("/pages/{path}")
    public String toIndex2(@PathVariable String path){
        return "pages"+"/"+path;
    }
    @GetMapping("/pages/{path1}/{path2}")
    public String toIndex3(@PathVariable String path1,@PathVariable String path2){
        return "pages"+"/"+path1+"/"+path2;
    }*/
    @ResponseBody
    @GetMapping("/orders")
    public OrdersResult listOrdersByPage(PageInfo pageInfo){
        return service.listOrdersByPage(pageInfo);
    }

    @ResponseBody
    @PostMapping("/delete")
    public int deleteOrders(@RequestParam("ids[]") List<Integer> ids){//把数据接到参数上，数组的方括号必须要加上，并且转为集合类型

        return service.deleteOrders(ids);
    }

    @RequestMapping("/addOrder")
    public void addOrder(Orders orders, HttpServletResponse response) throws IOException {
        service.addOrder(orders);
        response.getWriter().write("添加成功！");
    }

    @ResponseBody
    @PostMapping("/select")
    public OrdersResult<Orders> selectByOname(@RequestParam("name") String receiver,PageInfo pageInfo){
        return service.selectByReceiver(receiver,pageInfo);
    }

    @PostMapping("/editOrder")
    public void editOrder(Orders orders,HttpServletResponse response) throws IOException {
        service.editOrder(orders);
        response.getWriter().write("添加成功！");
    }

    @RequestMapping("/deleteOrder")
    @ResponseBody
    public int deleteOrder(@RequestParam("id") int id) throws IOException {
        return service.deleteOrder(id);
    }
}
