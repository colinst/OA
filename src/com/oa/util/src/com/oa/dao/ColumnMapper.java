package com.oa.util.src.com.oa.dao;

import com.oa.model.Column;

public interface ColumnMapper {
    int deleteByPrimaryKey(Integer columnId);

    int insert(Column record);

    int insertSelective(Column record);

    Column selectByPrimaryKey(Integer columnId);

    int updateByPrimaryKeySelective(Column record);

    int updateByPrimaryKey(Column record);
}