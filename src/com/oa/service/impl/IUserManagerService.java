package com.oa.service.impl;


import com.oa.model.User;

/**
 * @author 郭宏禧
 * @createTime 2017/8/16
 * @context **
 */
public interface IUserManagerService {

    int deleteByPrimaryKey(Integer userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

}
