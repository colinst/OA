package com.oa.service.impl;

import com.oa.model.Stat;

import java.util.List;

public interface IStatService {
    int deleteByPrimaryKey(Integer statId);

    int insert(Stat record);

    int insertSelective(Stat record);

    Stat selectByPrimaryKey(Integer statId);

    int updateByPrimaryKeySelective(Stat record);

    int updateByPrimaryKey(Stat record);

    int addStats(List<Stat> stats);

    List<Stat> selectByStatId(Integer statId);

    List<Stat> selectByUserId(Integer userId);

}