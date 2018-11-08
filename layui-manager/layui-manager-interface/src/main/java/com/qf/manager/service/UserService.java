package com.qf.manager.service;

import com.qf.common.pojo.dto.PageInfo;
import com.qf.common.pojo.dto.UserResult;
import com.qf.manager.pojo.po.User;
import com.qf.manager.pojo.vo.UserCustom;
import com.qf.manager.pojo.vo.UserQuery;

import java.util.List;
import java.util.Map;

/**
 * 处理用户的业务逻辑层接口
 */
public interface UserService {
    /**
     * (搜索)分页
     * @param pageInfo
     * @param query
     * @return
     */
    UserResult<UserCustom> listUserByPageAndSearch(PageInfo pageInfo, UserQuery query);

    /**
     * 批量删除(更新)
     * @param ids
     * @return
     */
    int batchUsers(List<Integer> ids);

    /**
     * 添加
     * @param map
     * @return
     */
    void add(Map<String, Object> map);

    /**
     * 编辑
     * @param map
     */
    void edit(Map<String, Object> map);
}
