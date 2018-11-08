package com.qf.manager.dao;

import com.qf.common.pojo.dto.PageInfo;
import com.qf.manager.pojo.vo.UserCustom;
import com.qf.manager.pojo.vo.UserQuery;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserCustomMapper {

    long countUsers(@Param("query") UserQuery query);

    List<UserCustom> listUsersByPageAndSearch(@Param("pageInfo") PageInfo pageInfo, @Param("query") UserQuery query);

    void add(Map<String, Object> map);

    void edit(Map<String, Object> map);
}
