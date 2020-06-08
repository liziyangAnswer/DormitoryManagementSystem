package com.lzy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author Answer
 * @description
 * @date 2020/04/11
 */
@Controller
public class ExitController {
    @RequestMapping("/exit")
    public void exit(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.getSession().invalidate();
        response.sendRedirect(request.getContextPath()+"/login.jsp");

    }
}
