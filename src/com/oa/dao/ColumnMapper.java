package com.oa.dao;

import com.oa.model.Column;

public interface ColumnMapper {
    int deleteByPrimaryKey(Integer columnid);

    int insert(Column record);

    int insertSelective(Column record);

    Column selectByPrimaryKey(Integer columnid);

    int updateByPrimaryKeySelective(Column record);

    int updateByPrimaryKey(Column record);
}