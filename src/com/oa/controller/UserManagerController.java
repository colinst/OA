package com.oa.controller;

import com.oa.model.User;
import com.oa.service.UserManagerService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * @author 郭宏禧
 * @createTime 2017/8/16
 * @context **
 */
@Controller
@RequestMapping("/user")
public class UserManagerController {

    @Resource
    private UserManagerService service;

    @RequestMapping("adduser.do")
    public String addUser(User user){
        System.out.println(user + "_" + service.insert(user));
        return "done.jsp";
    }

    @RequestMapping("insert.do")
    public String insertUser(User user) {
        System.out.println(user + "_" + service.insertSelective(user));
        return "done.jsp";
    }



    public UserManagerService getService() {
        return service;
    }

    public void setService(UserManagerService service) {
        this.service = service;
    }
}
