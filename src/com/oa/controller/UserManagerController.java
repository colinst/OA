package com.oa.controller;

import com.alibaba.fastjson.JSONArray;
import com.oa.model.SysUser;
import com.oa.service.UserManagerService;
import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 郭宏禧
 * @createTime 2017/8/16
 * @context **
 * java -jar mybatis-generator-core-1.3.5.jar -configfile generator.xml -overwrite
 */
@Controller
@RequestMapping("/user")
public class UserManagerController {

    @Resource
    private UserManagerService service;

    //增加用户
    @RequestMapping("/insert.do")
    public String addUser(SysUser user) {
        System.out.println(user + "_" + service.insert(user));
        return "done.jsp";
    }

    //获得所有用户
    @ResponseBody
    @RequestMapping(value = "/selectall.do", produces = "text/plain;charset=utf8")
    public String selectAll() {

        List list = service.selectAll();
        String str = JSONArray.toJSONString(list);
        return str;
    }

    //增加用户（可选属性）
    @RequestMapping("/insertSelective.do")
    public String insertUser(SysUser user) {

        System.out.println(user + "增加_" + service.insertSelective(user));
        return "done.jsp";
    }

    //更新用户（有变化则更新）
    @RequestMapping("/updateSelective.do")
    public String updateUser(SysUser user) {

        System.out.println(user + "更新_" + service.updateByPrimaryKeySelective(user));
        return "done.jsp";
    }

    //获得用户数量
    @ResponseBody
    @RequestMapping(value = "/getcount.do", produces = "text/plain;charset=utf8")
    public String getCount() {
        String str = JSONArray.toJSONString(service.getCount());
        return str;
    }

    //获得用户列表
    @ResponseBody
    @RequestMapping(value = "/getusers.do", produces = "text/plain;charset=utf8")
    public String getUsers(int start, int limit) {

        Map<String, Integer> page = new HashMap<String, Integer>();
        page.put("start", start);
        page.put("limit", limit);

        List list = service.getUsers(page);
        String str = JSONArray.toJSONString(list);
        return str;
    }

    //删除用户
    @ResponseBody
    @RequestMapping(value = "/delete.do", produces = "text/plain;charset=utf8")
    public String delUser(Integer userId) {
        return JSONArray.toJSONString(service.deleteByPrimaryKey(userId));
    }


    //用户登录
    @RequestMapping(value = "/login.do", produces = "text/plain;charset=utf8")
    public String Login(String account, String password, HttpSession session, HttpServletResponse resp) throws IOException {

        Map<String, String> login = new HashMap<String, String>();
        login.put("account", account);
        login.put("password", password);

        SysUser user = service.getUser(login);

        if (user != null) {
            session.setAttribute("user", user);//成功跳转到首页
            resp.sendRedirect("http://localhost:8080/index.jsp");
        } else {                                    //不然跳转到登录页重新登录
            resp.sendRedirect("http://localhost:8080/login.html");
        }
        return null;
    }

    /*//获得session的ID
    @ResponseBody
    @RequestMapping(value = "/getid.do", produces = "text/plain;charset=utf8")
    public String getId(HttpSession session) {

        Object obj = session.getAttribute("user");
        SysUser user = (SysUser) obj;

        return JSONArray.toJSONString(user);
    }*/


    public UserManagerService getService() {
        return service;
    }

    public void setService(UserManagerService service) {
        this.service = service;
    }
}
