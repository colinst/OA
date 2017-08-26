package com.oa.service;


import com.oa.dao.UserMapper;
import com.oa.model.User;
import com.oa.service.impl.IUserManagerService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author 郭宏禧
 * @createTime 2017/8/16
 * @context **
 */
@Service
public class UserManagerService  implements IUserManagerService {

    @Resource
    private UserMapper userMapper;

    @Override
    public int deleteByPrimaryKey(Integer userId) {
        int i = userMapper.deleteByPrimaryKey(userId);
        return 0;
    }

    @Override
    public int insert(User record) {
        int i = userMapper.insert(record);
        return 0;
    }

    @Override
    public int insertSelective(User record) {
        int i = userMapper.insertSelective(record);
        return 0;
    }

    @Override
    public User selectByPrimaryKey(Integer userId) {
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(User record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(User record) {
        return 0;
    }

    //Mapper调用
    public UserMapper getUserMapper() {
        return userMapper;
    }

    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }
}
