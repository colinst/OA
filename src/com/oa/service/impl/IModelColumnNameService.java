package com.oa.service.impl;

import com.oa.model.ModelColumnName;

import java.util.List;

public interface IModelColumnNameService {
    int deleteByPrimaryKey(Integer columnId);

    int insert(ModelColumnName record);

    int insertSelective(ModelColumnName record);

    ModelColumnName selectByPrimaryKey(Integer columnId);

    int updateByPrimaryKeySelective(ModelColumnName record);

    int updateByPrimaryKey(ModelColumnName record);

    int addColumn(List<ModelColumnName> list);

    int selectId();
}