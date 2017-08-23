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


    //添加用户
    public int addUser(User user) {
        int i = userMapper.addUser(user);
        return i;
    }





    //Mapper调用
    public UserMapper getUserMapper() {
        return userMapper;
    }

    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

}
