package com.oa.service.impl;


import com.oa.model.Stat;
import com.oa.model.SysUser;

import java.util.List;
import java.util.Map;

/**
 * @author 郭宏禧
 * @createTime 2017/8/16
 * @context **
 */
public interface IUserManagerService {

    int deleteByPrimaryKey(Integer userId);

    int insert(SysUser record);

    int insertSelective(SysUser record);

    SysUser selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(SysUser record);

    int updateByPrimaryKey(SysUser record);

    List selectAll();

    List selectByRole(SysUser record);

    List getUsers(Map map);

    SysUser getUser(Map map);

    int getCount();

    SysUser selectBykey(Stat stat);//一对多查询


}
