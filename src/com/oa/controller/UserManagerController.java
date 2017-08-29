package com.oa.controller;

import com.alibaba.fastjson.JSONArray;
import com.oa.model.SysUser;
import com.oa.service.UserManagerService;
import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

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

    @RequestMapping("/insert.do")
    public String addUser(SysUser user) {
        System.out.println(user + "_" + service.insert(user));
        return "done.jsp";
    }

    @ResponseBody
    @RequestMapping(value = "/selectall.do", produces = "text/plain;charset=utf8")
    public String getUsers() {

        List list = service.selectAll();
        System.out.println(list);
        String str = JSONArray.toJSONString(list);
        return str;
    }

    @RequestMapping("/insertSelective.do")
    public String insertUser(SysUser user) {
        System.out.println(user + "_" + service.insertSelective(user));
        return "done.jsp";
    }

    @ResponseBody
    @RequestMapping(value = "/getcount.do", produces = "text/plain;charset=utf8")
    public String getCount() {
        String str = JSONArray.toJSONString(service.getCount());
        return str;
    }


    public UserManagerService getService() {
        return service;
    }

    public void setService(UserManagerService service) {
        this.service = service;
    }
}
