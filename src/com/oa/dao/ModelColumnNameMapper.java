package com.oa.dao;

import com.oa.model.ModelColumnName;

public interface ModelColumnNameMapper {
    int deleteByPrimaryKey(Integer columnId);

    int insert(ModelColumnName record);

    int insertSelective(ModelColumnName record);

    ModelColumnName selectByPrimaryKey(Integer columnId);

    int updateByPrimaryKeySelective(ModelColumnName record);

    int updateByPrimaryKey(ModelColumnName record);
}