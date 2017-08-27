package com.oa.dao;

import com.oa.model.StatCount;

public interface StatCountMapper {
    int deleteByPrimaryKey(Integer modelId);

    int insert(StatCount record);

    int insertSelective(StatCount record);

    StatCount selectByPrimaryKey(Integer modelId);

    int updateByPrimaryKeySelective(StatCount record);

    int updateByPrimaryKey(StatCount record);
}