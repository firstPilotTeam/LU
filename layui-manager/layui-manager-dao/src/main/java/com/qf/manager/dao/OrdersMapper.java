package com.qf.manager.dao;

import com.qf.common.pojo.dto.OrdersResult;
import com.qf.common.pojo.dto.PageInfo;
import com.qf.manager.pojo.po.Orders;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrdersMapper {
   public int countOrders();

   public List<Orders> listOrdersByPage(PageInfo pageInfo);

    int deleteOrders(List<Integer> ids);

    void addOrder(Orders orders);

    public int countOrders2(@Param(value = "receiver") String receiver);
   List<Orders> selectByReceiver(@Param(value = "receiver") String receiver, @Param(value = "offset") int offset, @Param(value = "limit") int limit);

    void editOrder(Orders orders);

    int deleteOrder(@Param("id") int id);
}
