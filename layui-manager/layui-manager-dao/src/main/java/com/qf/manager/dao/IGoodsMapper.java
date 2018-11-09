package com.qf.manager.dao;

import com.qf.common.pojo.dto.GoodsResult;
import com.qf.common.pojo.dto.PageInfo;
import com.qf.manager.pojo.po.Goods;
import com.qf.manager.pojo.vo.TbItemQuery;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IGoodsMapper {

    long countGoods(@Param("query")TbItemQuery query);

    public List<Goods> selectAll(@Param("pageInfo") PageInfo pageInfo, @Param("query")TbItemQuery query);

    void saveGoods(Goods goods);

    void remove(@Param("id")Integer id);


    List<Goods> modifyback(@Param("id") Integer id);

    void update(Goods goods);
}
