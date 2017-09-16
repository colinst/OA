package com.oa.util;


import com.oa.model.SysUser;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by 39805 on 2017/9/15.
 */

public class RequestFilter implements Filter {


    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) arg0;
        HttpServletResponse response = (HttpServletResponse) arg1;

        if (request.getSession().getAttribute("user") != null) {
            arg2.doFilter(arg0, arg1);//放行
        } else {
            //获得请求路径的方法
            String uri = request.getRequestURI(); //

            if ("/OA/".equals(uri) || "/OA/login.html".equals(uri) || "/OA/user/login.do".equals(uri) || uri.endsWith(".css") || uri.endsWith(".js") || uri.endsWith(".jpg") || uri.endsWith(".png") || uri.endsWith(".svg")) {
                arg2.doFilter(arg0, arg1);//放行
            } else {
                response.sendRedirect(request.getContextPath() + "/login.html");
            }
        }
    }

    @Override
    public void destroy() {

    }
}
