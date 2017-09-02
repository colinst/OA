package com.oa.service.impl;

import com.oa.model.StatCount;

import java.util.List;

public interface IStatCountService {
    int deleteByPrimaryKey(Integer modelId);

    int insert(StatCount record);

    int insertSelective(StatCount record);

    StatCount selectByPrimaryKey(Integer modelId);

    int updateByPrimaryKeySelective(StatCount record);

    int updateByPrimaryKey(StatCount record);

    int addStatCount(List<StatCount> list);

    List<StatCount> selectByUser(StatCount record);
}