package com.oa.util.src.com.oa.dao;

import com.oa.model.Assessment;

public interface AssessmentMapper {
    int deleteByPrimaryKey(Integer assessmentId);

    int insert(Assessment record);

    int insertSelective(Assessment record);

    Assessment selectByPrimaryKey(Integer assessmentId);

    int updateByPrimaryKeySelective(Assessment record);

    int updateByPrimaryKey(Assessment record);
}