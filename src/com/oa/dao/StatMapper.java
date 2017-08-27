package com.oa.dao;

import com.oa.model.Stat;

public interface StatMapper {
    int deleteByPrimaryKey(Integer statId);

    int insert(Stat record);

    int insertSelective(Stat record);

    Stat selectByPrimaryKey(Integer statId);

    int updateByPrimaryKeySelective(Stat record);

    int updateByPrimaryKey(Stat record);
}