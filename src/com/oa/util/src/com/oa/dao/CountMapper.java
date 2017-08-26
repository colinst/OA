package com.oa.util.src.com.oa.dao;

import com.oa.model.Count;
import com.oa.model.CountKey;

public interface CountMapper {
    int deleteByPrimaryKey(CountKey key);

    int insert(Count record);

    int insertSelective(Count record);

    Count selectByPrimaryKey(CountKey key);

    int updateByPrimaryKeySelective(Count record);

    int updateByPrimaryKey(Count record);
}