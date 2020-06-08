package com.lzy.interceptor;

import com.lzy.domain.Student;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author Answer
 * @description
 * @date 2020/04/11
 */
public class LoginInterceptor implements HandlerInterceptor {



    public boolean preHandle(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("进入拦截器-----------------------");
                 //获取session
                 HttpSession session = request.getSession();
                   Object o =  session.getAttribute("user");
                 //判断session中是否有用户数据，如果有，则返回true，继续向下执行
                 if (o != null) {
                     System.out.println("有用户数据");
                         return true;
                     }
                 //不符合条件的给出提示信息，并转发到登录页面
                 request.setAttribute("msg", "您还没有登录，请先登录！");
        System.out.println("重定向登录页");
        response.sendRedirect(request.getContextPath()+"/login.html");

                 return false;
            }

}
