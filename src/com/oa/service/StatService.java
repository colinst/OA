package com.oa.service;

import com.oa.dao.StatMapper;
import com.oa.model.Stat;
import com.oa.service.impl.IStatService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 39805 on 2017/8/30.
 */
@Service
public class StatService implements IStatService {
    @Resource
    private StatMapper statMapper;

    @Override
    public int deleteByPrimaryKey(Integer statId) {
        return 0;
    }

    @Override
    public int insert(Stat record) {
        return 0;
    }

    @Override
    public int insertSelective(Stat record) {
        return 0;
    }

    @Override
    public Stat selectByPrimaryKey(Integer statId) {
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(Stat record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(Stat record) {
        return statMapper.updateByPrimaryKey(record);
    }

    @Override
    public int addStats(List<Stat> stats) {
        int i = statMapper.addStats(stats);
        return i;
    }

    @Override
    public List<Stat> selectByStatId(Integer statId) {
        return statMapper.selectByStatId(statId);
    }

    @Override
    public List<Stat> selectByUserId(Integer userId) {
        return statMapper.selectByUserId(userId);
    }

    public StatMapper getStatMapper() {
        return statMapper;
    }

    public void setStatMapper(StatMapper statMapper) {
        this.statMapper = statMapper;
    }
}
