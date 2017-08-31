package com.oa.controller;

import com.oa.dao.ModelColumnMapper;
import com.oa.model.*;
import com.oa.service.ModelColumnNameService;
import com.oa.service.ModelService;
import com.oa.service.impl.*;
import com.oa.util.DateFormatUtil;
import com.oa.util.PageControlUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
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
    @Resource
    private IStatService statService;
    @Resource
    private IStatCountService statCountService;
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
        //if()
        //session.getAttribute("username");List<ModelColumnName> list,
        if (model.getModelName() == "") {
            request.setAttribute("message", "表名为空不能使用！");
            return "selectModel.do";
        }
        boolean flag = true;
        for (ModelColumnName mcn : model.getList()) {
            if (mcn.getColumnName() != "") {
                flag = false;
                break;
            }
        }
        if (flag) {
            request.setAttribute("message", "表内容为空不能使用！");
            return "selectModel.do";
        }
        model.setCreateUserId(2017);
        modelService.insert(model);
        model.setModelId(modelService.selectId());
        request.setAttribute("modelName", model.getModelName());
        request.setAttribute("model", model);
        // List<SysUser> su = userManagerService.selectAll();
        request.setAttribute("user", userManagerService.selectAll());
        return "/model/use.jsp";
    }

    @RequestMapping("/useModel.do")
    public String useModel(Model model, HttpServletRequest request, HttpSession session) {
        //if()
        //session.getAttribute("username");List<ModelColumnName> list,

        List<ModelColumn> mc = modelColumnService.selectAll(model.getModelId());
        List<ModelColumnName> mcn = new ArrayList<ModelColumnName>();
        for (ModelColumn modelColumn : mc) {
            mcn.add(modelColumnNameService.selectByPrimaryKey(modelColumn.getColumnId()));
        }
        model.setMc(mc);
        model.setList(mcn);
        request.setAttribute("modelName", model.getModelName());
        request.setAttribute("model", model);
        request.setAttribute("user", userManagerService.selectAll());
        return "/model/use.jsp";
    }

    @RequestMapping("/statModel.do")
    public String statModel(Model model, HttpServletRequest request, HttpSession session) {
        //if()
        //session.getAttribute("username");List<ModelColumnName> list,
        model = modelService.selectByPrimaryKey(model.getModelId());
        List<ModelColumn> mc = modelColumnService.selectAll(model.getModelId());
        List<ModelColumnName> mcn = new ArrayList<ModelColumnName>();
        for (ModelColumn modelColumn : mc) {
            mcn.add(modelColumnNameService.selectByPrimaryKey(modelColumn.getColumnId()));
        }
        model.setMc(mc);
        model.setList(mcn);
        List<Stat> stats = new ArrayList<Stat>();
        String[] sub = request.getParameterValues("subBox");
        int[] ints = new int[sub.length];
        for (int i = 0; i < sub.length; i++) {

            ints[i] = Integer.valueOf(sub[i]);
        }
        for (int i = 0; i < sub.length; i++) {
            Stat stat = new Stat();
            stat.setUserId(ints[i]);
            stat.setStatId(model.getModelId());
            stat.setStatName(model.getModelName());
            stat.setCreatetime(new DateFormatUtil().getCreatetime(model.getCreatetime()));
            stat.setCreateUserId(model.getCreateUserId());
            stats.add(stat);
        }
        statService.addStats(stats);
        request.setAttribute("message", "统计发布成功！");
        modelService.updateType(model);
        return "selectModel.do";
    }


    @RequestMapping("/selectStat.do")
    public String selectStat(String currentPage, String jumpPage, HttpServletRequest request, HttpSession session) {

        Model model = new Model();
        // session.getAttribute("username")
        model.setCreateUserId(2017);
        Page page = new Page(modelService.selectStatCount(model));
        PageControlUtil.setCurrentpage(page, currentPage, jumpPage);
        page.setModel(model);
        List<Model> list = modelService.selectStatPageSplit(page);
        page.setPageMessage(list);
        request.setAttribute("page", page);
        return "/model/statmodel.jsp";
    }

    @RequestMapping("/statistics.do")
    public String statMessage(Model model, HttpServletRequest request, HttpSession session) {
        //if()
        //session.getAttribute("username");List<ModelColumnName> list,

        List<ModelColumn> mc = modelColumnService.selectAll(model.getModelId());
        List<ModelColumnName> mcn = new ArrayList<ModelColumnName>();
        for (ModelColumn modelColumn : mc) {
            mcn.add(modelColumnNameService.selectByPrimaryKey(modelColumn.getColumnId()));
        }
        model.setMc(mc);
        model.setList(mcn);
        List<SysUser> users = new ArrayList<SysUser>();
        List<Stat> stats = statService.selectByStatId(model.getModelId());
        for (Stat stat : stats) {
            users.add(userManagerService.selectByPrimaryKey(stat.getUserId()));
        }


        request.setAttribute("modelName", model.getModelName());
        request.setAttribute("model", model);
        request.setAttribute("user", users);
        request.setAttribute("length", mcn.size() + 1);
        return "/model/statistics.jsp";
    }

    @RequestMapping("/selectInstat.do")
    public String selectInstat(String currentPage, String jumpPage, HttpServletRequest request, HttpSession session) {

        Model model = new Model();
        SysUser user = new SysUser();
        //session.getAttribute("username")
        user.setUserId(1000);
        List<Stat> stats = statService.selectByUserId(user.getUserId());
        List<Model> models = new ArrayList<Model>();
        for (Stat stat : stats) {
            models.add(modelService.selectByPrimaryKey(stat.getStatId()));
        }
        Page page = new Page(stats.size());
        PageControlUtil.setCurrentpage(page, currentPage, jumpPage);
        page.setModel(model);
        page.setPageMessage(models);
        request.setAttribute("page", page);
        return "/model/instatmodel.jsp";
    }

    @RequestMapping("/writeInstat.do")
    public String writeInstat(Model model, HttpServletRequest request, HttpSession session) {

        //session.getAttribute("username");List<ModelColumnName> list,

        List<ModelColumn> mc = modelColumnService.selectAll(model.getModelId());
        List<ModelColumnName> mcn = new ArrayList<ModelColumnName>();
        for (ModelColumn modelColumn : mc) {
            mcn.add(modelColumnNameService.selectByPrimaryKey(modelColumn.getColumnId()));
        }
        model.setMc(mc);
        model.setList(mcn);

        request.setAttribute("modelName", model.getModelName());
        request.setAttribute("model", model);
        request.setAttribute("length", mcn.size() + 1);

        return "/model/writeinstat.jsp";
    }


    @RequestMapping("/writeSubmit.do")
    public String writeSubmit(Model model, HttpServletRequest request, HttpSession session) {
        SysUser user = new SysUser();
        //session.getAttribute("username")
        user.setUserId(1000);
        List<ModelColumn> modelColumns = modelColumnService.selectAll(model.getModelId());
        List<StatCount> statCounts = new ArrayList<StatCount>();
        for (int i = 0; i < modelColumns.size(); i++) {
            StatCount statCount = new StatCount();
            statCount.setModelId(model.getModelId());
            statCount.setColumnId(modelColumns.get(i).getColumnId());
            statCount.setUserId(user.getUserId());
            statCount.setCount(model.getList().get(i).getColumnName());
            statCounts.add(statCount);
        }
        Stat stat = new Stat();
        stat.setUserId(user.getUserId());
        stat.setStatId(model.getModelId());
        statCountService.addStatCount(statCounts);
        statService.updateByPrimaryKey(stat);
        request.setAttribute("message", "提交成功！");
        return "selectInstat.do";
    }

}
