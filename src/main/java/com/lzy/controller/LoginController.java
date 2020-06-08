package com.lzy.controller;

import com.lzy.domain.*;
import com.lzy.service.IAdminService;
import com.lzy.service.IStudentService;
import com.lzy.service.ISuperAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @author Answer
 * @description 登录控制器
 * @date 2020/04/08
 */
@Controller
@RequestMapping("/login")
public class LoginController {

    @Autowired
    private IStudentService studentService;
    @Autowired
    private IAdminService adminService;
    @Autowired
    private ISuperAdminService superAdminService;
    private ResoutInfo resoutInfo;
    private Student student;
    private Admin admin;
    private SuperAdmin superAdmin;
    @RequestMapping("/login")
    @ResponseBody
    public ResoutInfo login(HttpServletRequest request)  {

        String status = request.getParameter("status");
        String id = request.getParameter("id");
        String password = request.getParameter("password");
       if("1".equals(status)){
            student = new Student();
            resoutInfo = new ResoutInfo();
            student.setSno(id);
            student.setPassword(password);
           Student stu = studentService.findById(student);
           if (stu==null){
               resoutInfo.setFlag(false);
               resoutInfo.setError_msg("用户名或密码错误");
           }else {
               resoutInfo.setStatus(1);
               resoutInfo.setFlag(true);
               HttpSession session = request.getSession();
               session.setAttribute("user",stu);
               session.setAttribute("resoultinfo",resoutInfo);
           }
       }
       if("2".equals(status)){
            admin = new Admin();
           resoutInfo = new ResoutInfo();
            admin.setSno(id);
            admin.setPassword(password);
           Admin adm = adminService.findById(admin);
           if (adm==null){
               resoutInfo.setFlag(false);
               resoutInfo.setError_msg("用户名或密码错误");
           }else {
               resoutInfo.setStatus(2);
               resoutInfo.setFlag(true);
               HttpSession session = request.getSession();
               session.setAttribute("user",adm);
               session.setAttribute("resoultinfo",resoutInfo);
           }
       }
        if("3".equals(status)){
            superAdmin = new SuperAdmin();
            resoutInfo = new ResoutInfo();
            superAdmin.setId(id);
            superAdmin.setPassword(password);
            SuperAdmin supadm = superAdminService.findById(superAdmin);
            if (supadm==null){
                resoutInfo.setFlag(false);
                resoutInfo.setError_msg("用户名或密码错误");
            }else {
                resoutInfo.setStatus(3);
                resoutInfo.setFlag(true);
                HttpSession session = request.getSession();
                session.setAttribute("user",supadm);
                session.setAttribute("resoultinfo",resoutInfo);
            }
        }


       return resoutInfo;
}
    @RequestMapping("success")
    public void loginSuccess(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("登录成功");

        request.getRequestDispatcher("/WEB-INF/jsp/main.jsp").forward(request,response);
        }


    @RequestMapping("/check")
    @ResponseBody
    public FaceResult check(HttpServletRequest request){
        FaceResult faceResult = new FaceResult();



        String status = request.getParameter("status");
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        if("1".equals(status)){
            student = new Student();
            resoutInfo = new ResoutInfo();
            student.setSno(id);
            student.setPassword(password);
            Student stu = studentService.findById(student);
            if (stu==null){
                faceResult.setFlag(false);
                faceResult.setMsg("用户名或密码错误");
            }else {

                faceResult.setFlag(true);
                faceResult.setMsg("验证成功");
                faceResult.setName(stu.getName());
                System.out.println(faceResult.getName());
                faceResult.setRoomId(stu.getRoomid());
                faceResult.setInRoom(stu.getInroom());
                System.out.println(faceResult.getRoomId());
                System.out.println(faceResult.getInRoom());
            }
        }
        if("2".equals(status)){
            admin = new Admin();
            resoutInfo = new ResoutInfo();
            admin.setSno(id);
            admin.setPassword(password);
            Admin adm = adminService.findById(admin);
            if (adm==null){
                faceResult.setFlag(false);
                faceResult.setMsg("用户名或密码错误");
            }else {

                faceResult.setFlag(true);
                faceResult.setMsg("验证成功");
                faceResult.setName(adm.getName());
                faceResult.setRoomId(adm.getRoomid());
                faceResult.setInRoom(adm.getInroom());
            }
        }




        return faceResult;
        }
}
