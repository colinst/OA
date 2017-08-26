package com.oa.dao;

import com.oa.model.Count;

public interface CountMapper {
    int insert(Count record);

    int insertSelective(Count record);
}