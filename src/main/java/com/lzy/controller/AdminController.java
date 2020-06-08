package com.lzy.controller;

import com.lzy.domain.Admin;
import com.lzy.domain.PageBean;
import com.lzy.domain.Student;
import com.lzy.domain.Visitor;
import com.lzy.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

/**
 * @author Answer
 * @description
 * @date 2020/05/09
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private IAdminService adminService;
    @RequestMapping("/insert")
    public ModelAndView insert(MultipartFile photo, HttpServletRequest request) throws IOException {

       Admin admin = new Admin();
        ModelAndView modelAndView = new ModelAndView("super_adm_insert");

        CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        MultipartHttpServletRequest multipartRequest = commonsMultipartResolver.resolveMultipart(request);

        String sno = multipartRequest.getParameter("sno");
        String name = multipartRequest.getParameter("name");
        String roomid = multipartRequest.getParameter("roomid");
        String tel = multipartRequest.getParameter("tel");



        System.out.println(sno);

        String path = request.getSession().getServletContext().getRealPath("adminphotos");
        System.out.println(path);
        File file = new File(path);
        if(!file.exists()){
            file.mkdirs();
        }
        String photoname = photo.getOriginalFilename();
        String photopath = "adminphotos/"+photoname;

        admin.setSno(sno);
        admin.setName(name);
        admin.setTel(tel);
        admin.setRoomid(roomid);
        admin.setPhoto(photopath);
        admin.setPassword("123");

        photo.transferTo(new File(path,photoname));
        //studentService.photo(photopath);


        adminService.insert(admin);
        modelAndView.addObject("admin",admin);
        return modelAndView;
    }

    @RequestMapping("/findAdminByPage")
    public String findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String roomid = request.getParameter("roomid");
        String currentPage = request.getParameter("currentPage");
        request.setAttribute("name",name);
        request.setAttribute("roomid",roomid);
        if(currentPage==null || "".equals(currentPage)){
            currentPage="1";
        }

        String rows = request.getParameter("rows");
        if(rows==null || "".equals(rows)){
            rows="8";
        }




        PageBean<Student> userByPage = adminService.findUserByPage(currentPage, rows,name,roomid);
        // System.out.println(userByPage);
        request.setAttribute("pb",userByPage);
        return "super_adm_info";



    }



    @RequestMapping("/update")
    public ModelAndView update(MultipartFile photo, HttpServletRequest request) throws ServletException, IOException {
        Admin admin = new Admin();
        ModelAndView modelAndView = new ModelAndView("super_adm_update");

        CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        MultipartHttpServletRequest multipartRequest = commonsMultipartResolver.resolveMultipart(request);

        String sno = multipartRequest.getParameter("sno");
        String name = multipartRequest.getParameter("name");
        String roomid = multipartRequest.getParameter("roomid");
        String tel = multipartRequest.getParameter("tel");



        System.out.println(sno);

        String path = request.getSession().getServletContext().getRealPath("adminphotos");
        System.out.println(path);
        File file = new File(path);
        if(!file.exists()){
            file.mkdirs();
        }
        String photoname = photo.getOriginalFilename();
        String photopath = "adminphotos/"+photoname;

        admin.setSno(sno);
        admin.setName(name);
        admin.setTel(tel);
        admin.setRoomid(roomid);
        admin.setPhoto(photopath);
        admin.setPassword("123");


        photo.transferTo(new File(path,photoname));
        //studentService.photo(photopath);


        adminService.update(admin);
        modelAndView.addObject("admin",admin);
        return modelAndView;
    }
    @RequestMapping("/delete")
    public void delete(HttpServletRequest request,HttpServletResponse response) throws IOException {
        String[] admids = request.getParameterValues("admid");
        for (String sno : admids) {
            adminService.delete(sno);
        }
        response.sendRedirect(request.getContextPath()+"/admin/findAdminByPage");

    }
    @RequestMapping("/visitor")
    public void visitor(Visitor visitor,HttpServletResponse response,HttpServletRequest request) throws IOException {
        adminService.visitor(visitor);
        response.sendRedirect(request.getContextPath()+"/admin/findVisitorByPage");
    }
    @RequestMapping("/findVisitorByPage")
    public String findVisitorByPage(HttpServletRequest request) throws ServletException, IOException {
        String name = request.getParameter("name");
        String roomid = request.getParameter("roomid");
        String currentPage = request.getParameter("currentPage");
        request.setAttribute("name",name);
        request.setAttribute("roomid",roomid);
        if(currentPage==null || "".equals(currentPage)){
            currentPage="1";
        }

        String rows = request.getParameter("rows");
        if(rows==null || "".equals(rows)){
            rows="8";
        }




        PageBean<Visitor> userByPage = adminService.findVisitorByPage(currentPage, rows,name,roomid);
        // System.out.println(userByPage);
        request.setAttribute("pb",userByPage);


        return "visitor";
    }
    @RequestMapping("/upload")
    public String upload(MultipartFile photo , HttpServletRequest request) throws IOException {
        String path = request.getSession().getServletContext().getRealPath("weisheng");
        System.out.println(path);
        File file = new File(path);
        if(!file.exists()){
            file.mkdirs();
        }
        String photoname = "weisheng.jpg";
        photo.transferTo(new File(path,photoname));
        return "adm_upload";
    }
    @RequestMapping("/visitorDelete")
    public void visitorDelete(HttpServletRequest request,HttpServletResponse response) throws IOException {
        String[] visitorids = request.getParameterValues("visitorid");
        for (String visitorid : visitorids) {
            int vis = Integer.parseInt(visitorid);
            adminService.visitorDelete(vis);
        }
        response.sendRedirect(request.getContextPath()+"/admin/findVisitorByPage");

    }
}
