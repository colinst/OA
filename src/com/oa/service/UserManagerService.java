package com.oa.service;


import com.oa.dao.SysUserMapper;
import com.oa.model.SysUser;
import com.oa.service.impl.IUserManagerService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @author 郭宏禧
 * @createTime 2017/8/16
 * @context **
 */
@Service
public class UserManagerService  implements IUserManagerService {

    @Resource
    private SysUserMapper sysUserMapper;

    @Override
    public int deleteByPrimaryKey(Integer userId) {
        return 0;
    }

    @Override
    public int insert(SysUser record) {
        return 0;
    }

    @Override
    public int insertSelective(SysUser record) {
        return sysUserMapper.insertSelective(record);
    }

    @Override
    public SysUser selectByPrimaryKey(Integer userId) {
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(SysUser record) {
        return sysUserMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(SysUser record) {
        return 0;
    }

    @Override
    public List selectAll() {
        return sysUserMapper.selectAll();
    }

    @Override
    public int getCount() {
        return sysUserMapper.getCount();
    }

    @Override
    public List getUsers(Map map) {
        return sysUserMapper.getUsers(map);
    }

    //Mapper调用
    public SysUserMapper getSysUserMapper() {
        return sysUserMapper;
    }

    public void setSysUserMapper(SysUserMapper sysUserMapper) {
        this.sysUserMapper = sysUserMapper;
    }
}
