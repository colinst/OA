package com.oa.service.impl;

import com.oa.model.Model;
import com.oa.model.Page;

import java.util.List;

public interface IModelService {
    int deleteByPrimaryKey(Integer modelId);

    int insert(Model record);

    int insertSelective(Model record);

    Model selectByPrimaryKey(Integer modelId);

    int updateByPrimaryKeySelective(Model record);

    int updateByPrimaryKey(Model record);

    int selectCount();

    List<Model> selectPageSplit(Page page);

    int selectId();

    int updateType(Model record);

    List<Model> selectStatPageSplit(Page page);

    int selectStatCount(Model record);

    int insertOne(Model record);
}
