package com.oa.dao;

import com.oa.model.SysSign;

public interface SysSignMapper {
    int deleteByPrimaryKey(Integer userId);

    int insert(SysSign record);

    int insertSelective(SysSign record);

    SysSign selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(SysSign record);

    int updateByPrimaryKey(SysSign record);
}