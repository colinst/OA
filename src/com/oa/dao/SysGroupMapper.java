package com.oa.dao;

import com.oa.model.SysGroup;

public interface SysGroupMapper {
    int deleteByPrimaryKey(Integer groupId);

    int insert(SysGroup record);

    int insertSelective(SysGroup record);

    SysGroup selectByPrimaryKey(Integer groupId);

    int updateByPrimaryKeySelective(SysGroup record);

    int updateByPrimaryKey(SysGroup record);
}