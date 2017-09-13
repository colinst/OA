package com.oa.dao;

import com.oa.model.Stat;

import java.util.List;

public interface StatMapper {
    int deleteByPrimaryKey(Integer statId);

    int insert(Stat record);

    int insertSelective(Stat record);

    Stat selectByPrimaryKey(Integer statId);

    int updateByPrimaryKeySelective(Stat record);

    int updateByPrimaryKey(Stat record);

    int addStats(List<Stat> stats);

    List<Stat> selectByStatId(Integer statId);

    List<Stat> selectByUserId(Integer userId);//未完成

    List<Stat> yselectByUserId(Integer userId);//已完成
}