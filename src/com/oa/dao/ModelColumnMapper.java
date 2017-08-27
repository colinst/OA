package com.oa.dao;

import com.oa.model.ModelColumn;

public interface ModelColumnMapper {
    int deleteByPrimaryKey(Integer modelId);

    int insert(ModelColumn record);

    int insertSelective(ModelColumn record);

    ModelColumn selectByPrimaryKey(Integer modelId);

    int updateByPrimaryKeySelective(ModelColumn record);

    int updateByPrimaryKey(ModelColumn record);
}