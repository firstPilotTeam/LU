package com.qf.manager.service.impl;



import com.qf.common.pojo.dto.GoodsResult;
import com.qf.common.pojo.dto.PageInfo;
import com.qf.manager.dao.GoodsMapper;
import com.qf.manager.dao.IGoodsMapper;
import com.qf.manager.pojo.po.Goods;
import com.qf.manager.pojo.po.GoodsExample;
import com.qf.manager.pojo.vo.GoodsCustom;
import com.qf.manager.pojo.vo.GoodsQuery;
import com.qf.manager.service.GoodsService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GoodsServiceImpl implements GoodsService {

    //使用接口
    Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private GoodsMapper sm;
    @Autowired
    private IGoodsMapper mapper;

    @Override
    public GoodsResult<GoodsCustom> findAll(PageInfo pageInfo, GoodsQuery query) {



        GoodsResult<GoodsCustom> result = new GoodsResult<GoodsCustom>();
        //查询成功时
        result.setCode(0);
        result.setMsg("success");
        //System.out.println(pageInfo.getLimit());
        System.out.println("--------------"+query.getGname());
        try {
            Long count = mapper.countGoods(query);
            result.setCount(count);
            List<GoodsCustom> all = mapper.selectAll(pageInfo,query);
            result.setData(all);
        }catch (Exception e){
            e.printStackTrace();
            //查询出现异常
            result.setCode(1);
            result.setMsg("failed");
            //查询发生异常时将进行日志输出(输出到控制台还是到日志文件,由logback.xml决定)
            logger.error(e.getMessage(), e);
        }

        return result;
    }

    @Override
    public int batchGoods(List<Integer> ids) {
       int i = 0;
        try {
            //封装一个携带状态 的商品对象
            Goods record = new Goods();
            record.setState("3");
            //创建模板
            GoodsExample example = new GoodsExample();
            GoodsExample.Criteria criteria = example.createCriteria();
            criteria.andIdIn(ids);
            //update tb_item set status=3 where id in (xxx,yyy,zzz);
            i = sm.updateByExampleSelective(record, example);
        } catch (Exception e) {
            //查询发生异常时将进行日志输出(输出到控制台还是到日志文件,由logback.xml决定)
            logger.error(e.getMessage(), e);
        }
        return i;
    }

    @Override
    public void addGoods(GoodsCustom goods) {
        mapper.saveGoods(goods);
    }

    @Override
    public void delGoods(Integer id) {
        mapper.remove(id);
    }

    @Override
    public List<GoodsCustom> editback(Integer id) {
        List<GoodsCustom> goods = mapper.modifyback(id);
        return goods;
    }

    @Override
    public void modifyGoods(GoodsCustom goods) {
        mapper.update(goods);
    }
}
