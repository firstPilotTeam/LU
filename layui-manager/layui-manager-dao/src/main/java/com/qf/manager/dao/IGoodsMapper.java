package com.qf.manager.dao;

import com.qf.common.pojo.dto.GoodsResult;
import com.qf.common.pojo.dto.PageInfo;
import com.qf.manager.pojo.po.Goods;
import com.qf.manager.pojo.vo.GoodsCustom;
import com.qf.manager.pojo.vo.GoodsQuery;
import com.qf.manager.pojo.vo.TbItemQuery;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IGoodsMapper {

    long countGoods(@Param("query")GoodsQuery query);

    public List<GoodsCustom> selectAll(@Param("pageInfo")PageInfo pageInfo,@Param("query")GoodsQuery query);

    void saveGoods(GoodsCustom goods);

    void remove(@Param("id")Integer id);


    List<GoodsCustom> modifyback(@Param("id") Integer id);

    void update(GoodsCustom goods);
}
