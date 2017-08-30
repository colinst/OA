package com.oa.service.impl;

import com.oa.model.ModelColumn;

import java.util.List;

public interface IModelColumnService {
    int deleteByPrimaryKey(Integer modelId);

    int insert(ModelColumn record);

    int insertSelective(ModelColumn record);

    ModelColumn selectByPrimaryKey(Integer modelId);

    int updateByPrimaryKeySelective(ModelColumn record);

    int updateByPrimaryKey(ModelColumn record);

    int addModelAndColumn(List<ModelColumn> list);
}