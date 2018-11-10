package com.qf.manager.service.impl;


import com.qf.common.pojo.dto.PageInfo;
import com.qf.common.pojo.dto.UserResult;
import com.qf.manager.dao.UserCustomMapper;
import com.qf.manager.dao.UserMapper;
import com.qf.manager.pojo.po.User;
import com.qf.manager.pojo.po.UserExample;
import com.qf.manager.pojo.vo.UserCustom;
import com.qf.manager.pojo.vo.UserQuery;
import com.qf.manager.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private UserCustomMapper userCustomMapper;
    @Autowired
    private UserMapper userMapper;
    @Override
    public UserResult<UserCustom> listUserByPageAndSearch(PageInfo pageInfo, UserQuery query) {
        UserResult<UserCustom> result = new UserResult<>();
        result.setCode(0);
        result.setMsg("success");
        try {
            long count = userCustomMapper.countUsers(query);
            result.setCount(count);
            List<UserCustom> data = userCustomMapper.listUsersByPageAndSearch(pageInfo,query);
            result.setData(data);
        }catch (Exception e){
            result.setCode(1);
            result.setMsg("failed");
            logger.error(e.getMessage(),e);
        }
        return result;
    }

    @Override
    public int batchUsers(List<Integer> ids) {
        int i = 0;
        try {
            //封装一个携带状态的用户对象
            User record = new User();
            record.setStatus("3");
            //创建模板
            UserExample example = new UserExample();
            UserExample.Criteria criteria = example.createCriteria();
            criteria.andIdIn(ids);
            //update tb_item set status=3 where id in (xxx,yyy,zzz);
            i = userMapper.updateByExampleSelective(record, example);
        } catch (Exception e) {
            //查询发生异常时将进行日志输出(输出到控制台还是到日志文件,由logback.xml决定)
            logger.error(e.getMessage(), e);
        }
        return i;
    }

    @Override
    public void add(Map<String,Object> map) {
        Object status =map.get("status");
        try {
            if(map.get("status")==null||map.get("status")==""){
                map.put("status","2");
            }else{
                map.put("status","1");
            }
            userCustomMapper.add(map);
        }catch (Exception e){
            logger.error(e.getMessage(), e);
        }
    }

    @Override
    public void edit(Map<String, Object> map) {
        Object status =map.get("status");
        try {
            if(map.get("status")==null||map.get("status")==""){
                map.put("status","2");
            }else{
                map.put("status","1");
            }
            userCustomMapper.edit(map);
        }catch (Exception e){
            logger.error(e.getMessage(), e);
        }
    }

}
