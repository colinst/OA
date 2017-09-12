package com.oa.controller;

import com.alibaba.fastjson.JSONArray;
import com.oa.dao.ModelColumnMapper;
import com.oa.model.*;
import com.oa.service.ModelColumnNameService;
import com.oa.service.ModelService;
import com.oa.service.impl.*;
import com.oa.util.ClassUtil;
import com.oa.util.DateFormatUtil;
import com.oa.util.GetClassUtil;
import com.oa.util.PageControlUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

    //模板管理
    @RequestMapping("/selectModel.do")
    public String selectModel(String currentPage, String jumpPage, HttpServletRequest request, HttpSession session) {
        SysUser user = (SysUser) session.getAttribute("user");
        request.setAttribute("user", user);
        Model model = new Model();
        model.setCreateUserId(user.getUserId());
        Page page = new Page(modelService.selectCount());
        page.setModel(model);
        PageControlUtil.setCurrentpage(page, currentPage, jumpPage);

        List<Model> list = modelService.selectPageSplit(page);
        for (int a = 0; a < list.size(); a++) {
            list.get(a).setUser(userManagerService.selectByPrimaryKey(list.get(a).getCreateUserId()));
        }
        page.setPageMessage(list);
        request.setAttribute("page", page);
        return "/model/model.jsp";
    }

    //自定义模板
    @RequestMapping("/insertModel.do")
    public String insertModel(Model model, HttpServletRequest request, HttpSession session) {
        //if()
        //session.getAttribute("username");List<ModelColumnName> list,
        if (model.getModelName() == "") {
            request.setAttribute("message", "表名为空不能使用！");
            return "selectModel.do";
        }

        if (model.getList() == null) {
            request.setAttribute("message", "表内容为空不能使用！");
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
        SysUser user = (SysUser) session.getAttribute("user");
        request.setAttribute("user", user);
        model.setCreateUserId(user.getUserId());
        modelService.insert(model);
        model.setModelId(modelService.selectId());
        /*request.setAttribute("modelName", model.getModelName());
        request.setAttribute("model", model);
        // List<SysUser> su = userManagerService.selectAll();
        request.setAttribute("length", model.getList().size() + 1);
        request.setAttribute("users", userManagerService.selectAll());
        return "/model/use.jsp";*/
        return "selectModel.do";
    }

    //使用表格
    @RequestMapping("/useModel.do")
    public String useModel(Model model, HttpServletRequest request, HttpSession session) {

        SysUser user = (SysUser) session.getAttribute("user");
        request.setAttribute("user", user);
        SysUser sysUser = userManagerService.selectByPrimaryKey(user.getUserId());
        List<ModelColumn> mc = modelColumnService.selectAll(model.getModelId());
        List<ModelColumnName> mcn = new ArrayList<ModelColumnName>();
        for (ModelColumn modelColumn : mc) {
            mcn.add(modelColumnNameService.selectByPrimaryKey(modelColumn.getColumnId()));
        }
        request.setAttribute("flag", new GetClassUtil().getFlag(mcn));
        model.setMc(mc);

        Model m = modelService.selectByPrimaryKey(model.getModelId());
        List<ClassUtil> cus = new GetClassUtil().getClassUtil(mcn);
        new GetClassUtil().setMcnsName(mcn);
        model.setList(mcn);
        request.setAttribute("cus", cus);

        request.setAttribute("m", m);
        request.setAttribute("modelName", model.getModelName());
        request.setAttribute("model", model);
        request.setAttribute("users", userManagerService.selectAll());
        request.setAttribute("length", mcn.size() + 1);
        request.setAttribute("sysuser", sysUser);

        return "/model/use.jsp";
        //return "/model/used.jsp";
    }

    // 删除表格
    @RequestMapping("/delModel.do")
    public String delModel(Model model, HttpServletRequest request, HttpSession session) {
        Model model1 = modelService.selectByPrimaryKey(model.getModelId());
        SysUser user = (SysUser) session.getAttribute("user");
        if (user.getUserId().intValue() != model1.getCreateUserId().intValue()) {
            request.setAttribute("message", "不能删除其他人创建的表格！");
            return "selectModel.do";
        } else if (model1.getType() == 1) {
            request.setAttribute("message", "已发起统计不能删除！");
            return "selectModel.do";
        } else {
            modelService.deleteByPrimaryKey(model.getModelId());
            request.setAttribute("message", "删除成功！");
            return "selectModel.do";
        }

    }

    //发起统计
    @RequestMapping("/statModel.do")
    public String statModel(Model model, HttpServletRequest request, HttpSession session) {
        SysUser user = (SysUser) session.getAttribute("user");
        request.setAttribute("user", user);
        String str = model.getTemp();
        model = modelService.selectByPrimaryKey(model.getModelId());
        model.setTemp(str);
        if (model.getTemp() == "") {
            request.setAttribute("message", "表名不能为空");
            return "selectModel.do";
        }
        String[] sub = request.getParameterValues("subBox");
        if (sub == null) {
            request.setAttribute("message", "未选择人员请重新发布！");
            return "selectModel.do";
        }

        List<ModelColumn> mc = modelColumnService.selectAll(model.getModelId());
        /*List<ModelColumnName> mcn = new ArrayList<ModelColumnName>();
        for (ModelColumn modelColumn : mc) {
            mcn.add(modelColumnNameService.selectByPrimaryKey(modelColumn.getColumnId()));
        }*/
        boolean flag = model.getModelName().equals(model.getTemp());
        if (!model.getModelName().equals(model.getTemp()) || model.getType() == 1) {
            model.setModelName(model.getTemp());
            model.setCreateUserId(user.getUserId());
            int a = modelService.insertOne(model);

            model.setModelId(modelService.selectId());
            for (int i = 0; i < mc.size(); i++) {
                mc.get(i).setModelId(model.getModelId());

            }
            modelColumnService.addModelAndColumn(mc);
           /* modelColumnNameService.addColumn(mcn);*/

        }
        List<ModelColumnName> mcn = new ArrayList<ModelColumnName>();
        for (ModelColumn modelColumn : mc) {
            mcn.add(modelColumnNameService.selectByPrimaryKey(modelColumn.getColumnId()));
        }
        model.setMc(mc);
        model.setList(mcn);
        List<Stat> stats = new ArrayList<Stat>();

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
        SysUser user = (SysUser) session.getAttribute("user");
        request.setAttribute("user", user);
        model.setCreateUserId(user.getUserId());
        Page page = new Page(modelService.selectStatCount(model));
        PageControlUtil.setCurrentpage(page, currentPage, jumpPage);
        page.setModel(model);
        List<Model> list = modelService.selectStatPageSplit(page);
        for (int a = 0; a < list.size(); a++) {
            list.get(a).setUser(userManagerService.selectByPrimaryKey(list.get(a).getCreateUserId()));
        }
        page.setPageMessage(list);
        request.setAttribute("page", page);
        return "/model/statmodel.jsp";
    }

    //查看统计情况
    @RequestMapping("/statistics.do")
    public String statMessage(Model model, HttpServletRequest request, HttpSession session) {
        SysUser user = (SysUser) session.getAttribute("user");
        request.setAttribute("user", user);
        List<ModelColumn> mc = modelColumnService.selectAll(model.getModelId());
        List<ModelColumnName> mcn = new ArrayList<ModelColumnName>();
        for (ModelColumn modelColumn : mc) {
            mcn.add(modelColumnNameService.selectByPrimaryKey(modelColumn.getColumnId()));
        }
        Boolean flag = new GetClassUtil().getFlag(mcn);
        request.setAttribute("flag", new GetClassUtil().getFlag(mcn));
        model.setMc(mc);

        List<ClassUtil> cus = new GetClassUtil().getClassUtil(mcn);
        new GetClassUtil().setMcnsName(mcn);
        model.setList(mcn);
        request.setAttribute("cus", cus);

        List<SysUser> users = new ArrayList<SysUser>();
        List<Stat> stats = statService.selectByStatId(model.getModelId());
        for (Stat stat : stats) {
            users.add(userManagerService.selectByPrimaryKey(stat.getUserId()));
        }
        for (int i = 0; i < users.size(); i++) {
            StatCount sc = new StatCount();
            sc.setModelId(model.getModelId());
            sc.setUserId(users.get(i).getUserId());
            List<StatCount> scs = statCountService.selectByUser(sc);
            if (scs.size() == 0) {
                for (int j = 0; j < mcn.size(); j++) {
                    sc.setCount("");
                    scs.add(sc);
                }
            }
            users.get(i).setSc(scs);

        }

        request.setAttribute("modelName", model.getModelName());
        request.setAttribute("model", model);
        request.setAttribute("users", users);
        request.setAttribute("length", mcn.size() + 1);
        return "/model/statistics.jsp";
    }

    //参与统计
    @RequestMapping("/selectInstat.do")
    public String selectInstat(String currentPage, String jumpPage, HttpServletRequest request, HttpSession session) {

        Model model = new Model();
        SysUser user = (SysUser) session.getAttribute("user");
        request.setAttribute("user", user);

        List<Stat> stats = statService.selectByUserId(user.getUserId());
        List<Model> models = new ArrayList<Model>();
        for (int i = stats.size() - 1; i >= 0; i--) {
            models.add(modelService.selectByPrimaryKey(stats.get(i).getStatId()));
        }
        Page page = new Page(stats.size());
        PageControlUtil.setCurrentpage(page, currentPage, jumpPage);
        page.setModel(model);
        for (int a = 0; a < models.size(); a++) {
            models.get(a).setUser(userManagerService.selectByPrimaryKey(models.get(a).getCreateUserId()));
        }
        page.setPageMessage(models);
        request.setAttribute("page", page);
        return "/model/instatmodel.jsp";
    }

    //提交统计
    @RequestMapping("/writeInstat.do")
    public String writeInstat(Model model, HttpServletRequest request, HttpSession session) {
        SysUser user = (SysUser) session.getAttribute("user");
        request.setAttribute("user", user);

        List<ModelColumn> mc = modelColumnService.selectAll(model.getModelId());
        List<ModelColumnName> mcn = new ArrayList<ModelColumnName>();
        for (ModelColumn modelColumn : mc) {
            mcn.add(modelColumnNameService.selectByPrimaryKey(modelColumn.getColumnId()));
        }
        request.setAttribute("flag", new GetClassUtil().getFlag(mcn));
        model.setMc(mc);

        List<ClassUtil> cus = new GetClassUtil().getClassUtil(mcn);
        new GetClassUtil().setMcnsName(mcn);
        model.setList(mcn);
        request.setAttribute("cus", cus);

        request.setAttribute("modelName", model.getModelName());
        request.setAttribute("model", model);
        request.setAttribute("length", mcn.size() + 1);

        return "/model/writeinstat.jsp";
    }


    @RequestMapping("/writeSubmit.do")
    public String writeSubmit(Model model, HttpServletRequest request, HttpSession session) {

        SysUser user = (SysUser) session.getAttribute("user");
        request.setAttribute("user", user);

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

    @RequestMapping(value = "/ajax.do", produces = "text/plain;charset=utf8")
    @ResponseBody  //返回ajax数据
    public String ajax(SysUser user) {

        List<SysUser> list = userManagerService.selectByRole(user);
        //数据转换成JSON格式的字符串
        String u = JSONArray.toJSONString(list);
        return u;
    }




}
