package com.oa.dao;

import com.oa.model.Assessment;

public interface AssessmentMapper {
    int deleteByPrimaryKey(Integer assessmentid);

    int insert(Assessment record);

    int insertSelective(Assessment record);

    Assessment selectByPrimaryKey(Integer assessmentid);

    int updateByPrimaryKeySelective(Assessment record);

    int updateByPrimaryKey(Assessment record);
}