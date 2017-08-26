package com.oa.dao;

import com.oa.model.TableUserModel;

public interface TableUserModelMapper {
    int insert(TableUserModel record);

    int insertSelective(TableUserModel record);
}