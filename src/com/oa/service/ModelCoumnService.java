package com.oa.service;

import com.oa.dao.ModelColumnMapper;
import com.oa.model.ModelColumn;
import com.oa.service.impl.IModelColumnService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 39805 on 2017/8/29.
 */
@Service
public class ModelCoumnService implements IModelColumnService {
    @Resource
    private ModelColumnMapper modelColumnMapper;

    @Override
    public int deleteByPrimaryKey(Integer modelId) {
        return 0;
    }

    @Override
    public int insert(ModelColumn record) {
        return 0;
    }

    @Override
    public int insertSelective(ModelColumn record) {
        return 0;
    }

    @Override
    public ModelColumn selectByPrimaryKey(Integer modelId) {
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(ModelColumn record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(ModelColumn record) {
        return 0;
    }

    @Override
    public int addModelAndColumn(List<ModelColumn> list) {
        return modelColumnMapper.addModelAndColumn(list);
    }

    public ModelColumnMapper getModelColumnMapper() {
        return modelColumnMapper;
    }

    public void setModelColumnMapper(ModelColumnMapper modelColumnMapper) {
        this.modelColumnMapper = modelColumnMapper;
    }
}
