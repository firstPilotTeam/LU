package com.qf.manager.dao;

import com.qf.manager.pojo.po.Sort;
import com.qf.manager.pojo.po.SortExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SortMapper {
    int countByExample(SortExample example);

    int deleteByExample(SortExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Sort record);

    int insertSelective(Sort record);

    List<Sort> selectByExample(SortExample example);

    Sort selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Sort record, @Param("example") SortExample example);

    int updateByExample(@Param("record") Sort record, @Param("example") SortExample example);

    int updateByPrimaryKeySelective(Sort record);

    int updateByPrimaryKey(Sort record);
}