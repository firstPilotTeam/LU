package com.qf.manager.service;

import com.qf.common.pojo.dto.OrdersResult;
import com.qf.common.pojo.dto.PageInfo;
import com.qf.manager.pojo.po.Orders;

import java.util.List;

public interface OrdersService {

    public OrdersResult listOrdersByPage(PageInfo pageInfo);

    int deleteOrders(List<Integer> ids);

    void addOrder(Orders orders);


    OrdersResult<Orders> selectByReceiver(String receiver, PageInfo pageInfo);

    void editOrder(Orders orders);

    int deleteOrder(int id);
}
