package com.qf.manager.service.impl;



import com.qf.common.pojo.dto.GoodsResult;
import com.qf.common.pojo.dto.PageInfo;
import com.qf.manager.dao.GoodsMapper;
import com.qf.manager.dao.IGoodsMapper;
import com.qf.manager.pojo.po.Goods;
import com.qf.manager.pojo.vo.TbItemQuery;
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
    public GoodsResult<Goods> findAll(PageInfo pageInfo, TbItemQuery query) {



        GoodsResult<Goods> result = new GoodsResult<>();
        //查询成功时
        result.setCode(0);
        result.setMsg("success");
        System.out.println(pageInfo.getLimit());
        try {
            Long count = mapper.countGoods(query);
            result.setCount(count);
            List<Goods> all = mapper.selectAll(pageInfo,query);
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
    public int batchGoods(List<Long> ids) {
       /* int i = 0;
        try {
            //封装一个携带状态的商品对象
            Goods record = new Goods();
            record.setState((byte)3);
            //创建模板
            GoodsExample example = new GoodsExample();
            GoodsExample.Criteria criteria = example.createCriteria();
            criteria.andIdIn(ids);
            //update tb_item set status=3 where id in (xxx,yyy,zzz);
            i = sm.updateByExampleSelective(record, example);
        } catch (Exception e) {
            //查询发生异常时将进行日志输出(输出到控制台还是到日志文件,由logback.xml决定)
            logger.error(e.getMessage(), e);
        }*/
        return 0;
    }

    @Override
    public void addGoods(Goods goods) {
        mapper.saveGoods(goods);
    }

    @Override
    public void delGoods(Integer id) {
        mapper.remove(id);
    }

    @Override
    public List<Goods> editback(Integer id) {
        List<Goods> goods = mapper.modifyback(id);
        return goods;
    }

    @Override
    public void modifyGoods(Goods goods) {
        mapper.update(goods);
    }
}
