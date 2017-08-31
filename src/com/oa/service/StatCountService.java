package com.oa.service;

import com.oa.dao.StatCountMapper;
import com.oa.dao.StatMapper;
import com.oa.model.StatCount;
import com.oa.service.impl.IStatCountService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 39805 on 2017/9/1.
 */
@Service
public class StatCountService implements IStatCountService {
    @Resource
    private StatMapper statMapper;
    @Resource
    private StatCountMapper statCountMapper;

    @Override
    public int deleteByPrimaryKey(Integer modelId) {
        return 0;
    }

    @Override
    public int insert(StatCount record) {
        return 0;
    }

    @Override
    public int insertSelective(StatCount record) {
        return 0;
    }

    @Override
    public StatCount selectByPrimaryKey(Integer modelId) {
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(StatCount record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(StatCount record) {
        return 0;
    }

    @Override
    public int addStatCount(List<StatCount> list) {
        return statCountMapper.addStatCount(list);
    }

    public StatMapper getStatMapper() {
        return statMapper;
    }

    public void setStatMapper(StatMapper statMapper) {
        this.statMapper = statMapper;
    }

    public StatCountMapper getStatCountMapper() {
        return statCountMapper;
    }

    public void setStatCountMapper(StatCountMapper statCountMapper) {
        this.statCountMapper = statCountMapper;
    }
}
