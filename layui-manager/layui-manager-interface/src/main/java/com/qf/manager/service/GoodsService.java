package com.qf.manager.service;

import com.qf.common.pojo.dto.GoodsResult;
import com.qf.common.pojo.dto.PageInfo;
import com.qf.manager.pojo.po.Goods;
import com.qf.manager.pojo.vo.GoodsCustom;
import com.qf.manager.pojo.vo.GoodsQuery;
import com.qf.manager.pojo.vo.TbItemQuery;

import java.util.List;

public interface GoodsService {

    GoodsResult<GoodsCustom> findAll(PageInfo pageInfo, GoodsQuery query);

    int batchGoods(List<Integer> ids);

    void addGoods(GoodsCustom goods);


    void delGoods(Integer id);

    List<GoodsCustom> editback(Integer id);

    void modifyGoods(GoodsCustom goods);
}
