package com.lzy.controller;

import com.lzy.domain.PageBean;
import com.lzy.domain.Student;
import com.lzy.domain.SuperAdmin;
import com.lzy.service.IStudentService;
import com.lzy.service.ISuperAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

/**
 * @author Answer
 * @description
 * @date 2020/05/08
 */
@Controller
@RequestMapping("/super")
public class SuperController {
    @Autowired
    private ISuperAdminService superAdminService;
    @RequestMapping("/update")
    public String update(HttpServletRequest request, HttpServletResponse response,SuperAdmin superAdmin) throws ServletException, IOException {

        SuperAdmin user = (SuperAdmin) request.getSession().getAttribute("user");
        String id = user.getId();
        superAdmin.setId(id);
        superAdminService.update(superAdmin);
        return "super_update";
    }

}
