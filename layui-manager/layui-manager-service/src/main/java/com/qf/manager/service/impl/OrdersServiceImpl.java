package com.qf.manager.service.impl;

import com.qf.common.pojo.dto.OrdersResult;
import com.qf.common.pojo.dto.PageInfo;
import com.qf.manager.dao.OrdersMapper;
import com.qf.manager.pojo.po.Orders;
import com.qf.manager.service.OrdersService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrdersServiceImpl implements OrdersService {
    //使用接口，不需要使用具体实现
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private OrdersMapper dao;

    @Override
    public OrdersResult listOrdersByPage(PageInfo pageInfo) {
        OrdersResult result = new OrdersResult();
        //查询成功
        result.setCode(0);
        result.setMsg("success");
        try {
            int count = dao.countOrders();
            result.setCount(count);
            List<Orders> data = dao.listOrdersByPage(pageInfo);
            result.setData(data);
        } catch (Exception e) {
            //查询发生异常时
            result.setCode(-1);
            result.setMsg("查询失败");
            //查询发生异常时，进行日志输出，输出到控制台还是日志文件，有logback.xml决定
            logger.error(e.getMessage(), e);
        }
        return result;
    }

    @Override
    public int deleteOrders(List<Integer> ids) {
        int i = 0;
        try {
            i = dao.deleteOrders(ids);
        } catch (Exception e) {
            //查询发生异常时，进行日志输出，输出到控制台还是日志文件，有logback.xml决定
            logger.error(e.getMessage(), e);
        }
        return i;
    }

    @Override
    public void addOrder(Orders orders) {
        try {
            dao.addOrder(orders);
        } catch (Exception e) {
            //查询发生异常时，进行日志输出，输出到控制台还是日志文件，有logback.xml决定
            logger.error(e.getMessage(), e);
        }

    }

    @Override
    public OrdersResult selectByReceiver(String receiver,PageInfo pageInfo) {
        OrdersResult ordersResult = new OrdersResult();
        ordersResult.setCode(0);
        ordersResult.setMsg("success");
        int offset = pageInfo.getOffset();
        int limit = pageInfo.getLimit();
        try {
            ordersResult.setCount(dao.countOrders2(receiver));
            ordersResult.setData(dao.selectByReceiver(receiver,offset,limit));
        } catch (Exception e) {
            //查询发生异常时，进行日志输出，输出到控制台还是日志文件，有logback.xml决定
            logger.error(e.getMessage(), e);
        }
        return ordersResult;
    }

    @Override
    public void editOrder(Orders orders) {
        try {
            dao.editOrder(orders);
        } catch (Exception e) {
            //查询发生异常时，进行日志输出，输出到控制台还是日志文件，有logback.xml决定
            logger.error(e.getMessage(), e);
        }


    }

    @Override
    public int deleteOrder(int id) {
            int count = 0;
        try {
            count = dao.deleteOrder(id);
        } catch (Exception e) {
            e.printStackTrace();
            //查询发生异常时，进行日志输出，输出到控制台还是日志文件，有logback.xml决定
            logger.error(e.getMessage(), e);
        }finally {
            return count;
        }

    }

}
