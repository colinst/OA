package com.oa.service;

import com.oa.dao.ModelColumnNameMapper;
import com.oa.model.ModelColumnName;
import com.oa.service.impl.IModelColumnNameService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Iterator;
import java.util.List;

/**
 * Created by 39805 on 2017/8/29.
 */
@Service
public class ModelColumnNameService implements IModelColumnNameService {
    @Resource
    private ModelColumnNameMapper modelColumnNameMapper;

    @Override
    public int deleteByPrimaryKey(Integer columnId) {
        return 0;
    }

    @Override
    public int insert(ModelColumnName record) {
        return 0;
    }

    @Override
    public int insertSelective(ModelColumnName record) {
        return 0;
    }

    @Override
    public ModelColumnName selectByPrimaryKey(Integer columnId) {
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(ModelColumnName record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(ModelColumnName record) {
        return 0;
    }

    @Override
    public int addColumn(List<ModelColumnName> list) {

        return modelColumnNameMapper.addColumn(list);
    }

    @Override
    public int selectId() {
        return modelColumnNameMapper.selectId();
    }

    public ModelColumnNameMapper getModelColumnNameMapper() {
        return modelColumnNameMapper;
    }

    public void setModelColumnNameMapper(ModelColumnNameMapper modelColumnNameMapper) {
        this.modelColumnNameMapper = modelColumnNameMapper;
    }
}
