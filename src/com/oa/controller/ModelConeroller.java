package com.oa.controller;

import com.oa.dao.ModelColumnMapper;
import com.oa.model.Model;
import com.oa.model.ModelColumn;
import com.oa.model.ModelColumnName;
import com.oa.model.Page;
import com.oa.service.impl.IModelColumnNameService;
import com.oa.service.impl.IModelColumnService;
import com.oa.service.impl.IModelService;
import com.oa.service.impl.IUserManagerService;
import com.oa.util.PageControlUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Created by 39805 on 2017/8/28.
 */
@Controller
@RequestMapping("/model")
public class ModelConeroller {
    @Resource
    private IModelService modelService;
    @Resource
    private IModelColumnService modelColumnService;
    @Resource
    private IModelColumnNameService modelColumnNameService;
    @Resource
    private IUserManagerService userManagerService;

    @RequestMapping("/selectModel.do")
    public String selectModel(String currentPage, String jumpPage, HttpServletRequest request, HttpSession session) {
        Page page = new Page(modelService.selectCount());
        PageControlUtil.setCurrentpage(page, currentPage, jumpPage);

        List<Model> list = modelService.selectPageSplit(page);
        page.setPageMessage(list);
        request.setAttribute("page", page);
        return "/model/model.jsp";
    }

    @RequestMapping("/insertModel.do")
    public String insertModel(Model model, HttpServletRequest request, HttpSession session) {

        //session.getAttribute("username");List<ModelColumnName> list,
        model.setCreateUserId(2017);
        modelService.insert(model);
        request.setAttribute("modelName", model.getModelName());
        request.setAttribute("model", model);
        request.setAttribute("user", userManagerService.selectAll());
        return "/model/use.jsp";
    }


}
