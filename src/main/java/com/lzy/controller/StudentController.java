package com.lzy.controller;

import com.lzy.domain.*;
import com.lzy.service.IStudentService;
import org.bytedeco.javacpp.presets.opencv_core;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
/**
 * @author Answer
 * @description 学生信息操作表现层控制器
 * @date 2020/04/04
 */
@Controller
@RequestMapping("/student")
public class StudentController {
    @Autowired
    private IStudentService studentService;

    @RequestMapping("/findStudentByPage")
    public String findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String roomid = request.getParameter("roomid");
        String currentPage = request.getParameter("currentPage");
        request.setAttribute("name", name);
        request.setAttribute("roomid", roomid);
        if (currentPage == null || "".equals(currentPage)) {
            currentPage = "1";
        }

        String rows = request.getParameter("rows");
        if (rows == null || "".equals(rows)) {
            rows = "8";
        }


        PageBean<Student> userByPage = studentService.findUserByPage(currentPage, rows, name, roomid);
        // System.out.println(userByPage);
        request.setAttribute("pb", userByPage);
        return "super_stu_info";


    }


    @RequestMapping("/update")
    public ModelAndView update(MultipartFile photo, HttpServletRequest request) throws ServletException, IOException {
        Student student = new Student();
        ModelAndView modelAndView = new ModelAndView("super_stu_update");

        CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        MultipartHttpServletRequest multipartRequest = commonsMultipartResolver.resolveMultipart(request);

        String sno = multipartRequest.getParameter("sno");
        String gender = multipartRequest.getParameter("gender");
        String name = multipartRequest.getParameter("name");
        String clase = multipartRequest.getParameter("clase");
        String college = multipartRequest.getParameter("college");
        String roomid = multipartRequest.getParameter("roomid");
        String tel = multipartRequest.getParameter("tel");


        System.out.println(sno);

        String path = request.getSession().getServletContext().getRealPath("photos");
        System.out.println(path);
        File file = new File(path);
        if (!file.exists()) {
            file.mkdirs();
        }
        String photoname = photo.getOriginalFilename();
        String photopath = "photos/" + photoname;

        student.setSno(sno);
        student.setName(name);
        student.setGender(gender);
        student.setClase(clase);
        student.setCollege(college);
        student.setTel(tel);
        student.setRoomid(roomid);
        student.setPhoto(photopath);


        photo.transferTo(new File(path, photoname));
        //studentService.photo(photopath);


        studentService.update(student);
        modelAndView.addObject("student", student);
        return modelAndView;
    }

    @RequestMapping("/delete")
    public void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String[] stuids = request.getParameterValues("stuid");
        for (String sno : stuids) {
            studentService.delete(sno);
        }
        response.sendRedirect(request.getContextPath() + "/student/findStudentByPage");

    }

    @RequestMapping("/insert")
    public ModelAndView insert(MultipartFile photo, HttpServletRequest request) throws IOException {

        Student student = new Student();
        ModelAndView modelAndView = new ModelAndView("super_stu_insert");

        CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        MultipartHttpServletRequest multipartRequest = commonsMultipartResolver.resolveMultipart(request);

        String sno = multipartRequest.getParameter("sno");
        String gender = multipartRequest.getParameter("gender");
        String name = multipartRequest.getParameter("name");
        String clase = multipartRequest.getParameter("clase");
        String college = multipartRequest.getParameter("college");
        String roomid = multipartRequest.getParameter("roomid");
        String major = multipartRequest.getParameter("major");
        String tel = multipartRequest.getParameter("tel");


        System.out.println(sno);

        String path = request.getSession().getServletContext().getRealPath("photos");
        System.out.println(path);
        File file = new File(path);
        if (!file.exists()) {
            file.mkdirs();
        }
        String photoname = photo.getOriginalFilename();
        String photopath = "photos/" + photoname;

        student.setSno(sno);
        student.setName(name);
        student.setGender(gender);
        student.setClase(clase);
        student.setCollege(college);
        student.setTel(tel);
        student.setMajor(major);
        student.setRoomid(roomid);
        student.setPhoto(photopath);
        student.setPassword("123");

        photo.transferTo(new File(path, photoname));
        //studentService.photo(photopath);


        studentService.insert(student);
        modelAndView.addObject("student", student);
        return modelAndView;
    }

    @RequestMapping("/findEffectByPage")
    public String findEffectByPage(HttpServletRequest request) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Student user = (Student)session.getAttribute("user");
        String sno = user.getSno();
        String currentPage = request.getParameter("currentPage");
        if (currentPage == null || "".equals(currentPage)) {
            currentPage = "1";
        }

        String rows = request.getParameter("rows");
        if (rows == null || "".equals(rows)) {
            rows = "8";
        }


        PageBean<Effects> userByPage = studentService.findEffectByPage(currentPage, rows, sno);
        // System.out.println(userByPage);
        request.setAttribute("pb", userByPage);


        return "stu_effect";
    }
    @RequestMapping("/effectDelete")
    public void effectDelete(HttpServletRequest request,HttpServletResponse response) throws IOException {
        String[] effectids = request.getParameterValues("effectid");
        for (String effectid : effectids) {
            int eff = Integer.parseInt(effectid);
            studentService.effectDelete(eff);
        }
        response.sendRedirect(request.getContextPath()+"/student/findEffectByPage");

    }
    @RequestMapping("/effectInsert")
    public void effectInsert(HttpServletRequest request,HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        HttpSession session = request.getSession(false);
        Student user = (Student)session.getAttribute("user");
        String sno = user.getSno();
        Effects effects = new Effects();
        effects.setName(name);
        effects.setSno(sno);
        studentService.effectInsert(effects);
        response.sendRedirect(request.getContextPath()+"/student/findEffectByPage");
    }
}