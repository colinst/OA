package com.oa.service;

import com.oa.dao.ModelColumnMapper;
import com.oa.dao.ModelColumnNameMapper;
import com.oa.dao.ModelMapper;
import com.oa.model.Model;
import com.oa.model.ModelColumn;
import com.oa.model.ModelColumnName;
import com.oa.model.Page;
import com.oa.service.impl.IModelService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 39805 on 2017/8/28.
 */
@Service
public class ModelService implements IModelService {
    @Resource
    private ModelMapper modelMapper;
    @Resource
    private ModelColumnMapper modelColumnMapper;
    @Resource
    private ModelColumnNameMapper modelColumnNameMapper;

    @Override
    public int deleteByPrimaryKey(Integer modelId) {
        return 0;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public int insert(Model record) {
        int j = modelMapper.insert(record);
        ;//添加用户
        int modelId = selectId();

        List<ModelColumnName> mcn = record.getList();
        int o = mcn.size();
        for (int p = o - 1; p >= 0; p--) {
            if (mcn.get(p).getColumnName() == "") {
                mcn.remove(p);
            }
        }

        int k = modelColumnNameMapper.addColumn(record.getList());
        int q = modelColumnNameMapper.selectId();
        for (int r = mcn.size() - 1; r >= 0; r--) {
            mcn.get(r).setColumnId(q);
            q--;
        }
        record.setList(mcn);
        List<ModelColumn> lmc = new ArrayList<ModelColumn>();
        for (int i = 0; i < mcn.size(); i++) {
            ModelColumn mc = new ModelColumn();
            mc.setModelId(modelId);
            mc.setColumnId(mcn.get(i).getColumnId());
            lmc.add(mc);
        }
        int t = modelColumnMapper.addModelAndColumn(lmc);
        return j + t;
    }

    @Override
    public int insertSelective(Model record) {
        return 0;
    }

    @Override
    public Model selectByPrimaryKey(Integer modelId) {
        return modelMapper.selectByPrimaryKey(modelId);
    }

    @Override
    public int updateByPrimaryKeySelective(Model record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(Model record) {

        return 0;
    }

    @Override
    public int selectCount() {
        return modelMapper.selectCount();
    }

    @Override
    public List<Model> selectPageSplit(Page page) {
        List<Model> list = modelMapper.selectPageSplit(page);
        return list;
    }

    @Override
    public int selectId() {
        return modelMapper.selectId();
    }

    @Override
    public int updateType(Model record) {
        return modelMapper.updateType(record);
    }

    @Override
    public List<Model> selectStatPageSplit(Page page) {
        List<Model> list = modelMapper.selectStatPageSplit(page);
        return list;
    }

    @Override
    public int selectStatCount(Model record) {
        return modelMapper.selectStatCount(record);
    }

    public ModelMapper getModelMapper() {
        return modelMapper;
    }

    public void setModelMapper(ModelMapper modelMapper) {
        this.modelMapper = modelMapper;
    }

    public ModelColumnMapper getModelColumnMapper() {
        return modelColumnMapper;
    }

    public void setModelColumnMapper(ModelColumnMapper modelColumnMapper) {
        this.modelColumnMapper = modelColumnMapper;
    }

    public ModelColumnNameMapper getModelColumnNameMapper() {
        return modelColumnNameMapper;
    }

    public void setModelColumnNameMapper(ModelColumnNameMapper modelColumnNameMapper) {
        this.modelColumnNameMapper = modelColumnNameMapper;
    }
}
