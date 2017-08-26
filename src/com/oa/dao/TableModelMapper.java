package com.oa.dao;

import com.oa.model.TableModel;

public interface TableModelMapper {
    int insert(TableModel record);

    int insertSelective(TableModel record);
}