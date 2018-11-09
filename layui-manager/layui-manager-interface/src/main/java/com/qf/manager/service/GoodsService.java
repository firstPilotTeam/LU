package com.qf.manager.service;

import com.qf.common.pojo.dto.GoodsResult;
import com.qf.common.pojo.dto.PageInfo;
import com.qf.manager.pojo.po.Goods;
import com.qf.manager.pojo.vo.TbItemQuery;

import java.util.List;

public interface GoodsService {

    GoodsResult<Goods> findAll(PageInfo pageInfo, TbItemQuery query);

    int batchGoods(List<Long> ids);

    void addGoods(Goods goods);


    void delGoods(Integer id);

    List<Goods> editback(Integer id);

    void modifyGoods(Goods goods);
}
