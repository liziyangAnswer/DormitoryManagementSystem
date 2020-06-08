package com.lzy.controller;

import com.lzy.domain.Announcement;
import com.lzy.domain.PageBean;
import com.lzy.domain.Student;
import com.lzy.service.IAnnouncementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author Answer
 * @description
 * @date 2020/05/09
 */
@Controller
@RequestMapping("/anno")
public class AnnouncementController {
    @Autowired
    private IAnnouncementService announcementService;
    @RequestMapping("/insert")
    public void insert(Announcement announcement,HttpServletResponse response,HttpServletRequest request) throws IOException {
        announcementService.insert(announcement);
        response.sendRedirect(request.getContextPath()+"/anno/findAnnoByPage");

    }
    @RequestMapping("/findAnnoByPage")
    public String findAnnoByPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String currentPage = request.getParameter("currentPage");
        request.setAttribute("title",title);
        request.setAttribute("author",author);
        if(currentPage==null || "".equals(currentPage)){
            currentPage="1";
        }

        String rows = request.getParameter("rows");
        if(rows==null || "".equals(rows)){
            rows="8";
        }




        PageBean<Announcement> annoByPage = announcementService.findUserByPage(currentPage, rows,title,author);
        // System.out.println(userByPage);
        request.setAttribute("pb",annoByPage);
        return "super_anno";


    }
    @RequestMapping("/findAnno")
    public void findAnno(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String currentPage = request.getParameter("currentPage");
        request.setAttribute("title",title);
        request.setAttribute("author",author);
        if(currentPage==null || "".equals(currentPage)){
            currentPage="1";
        }

        String rows = request.getParameter("rows");
        if(rows==null || "".equals(rows)){
            rows="8";
        }




        PageBean<Announcement> annoByPage = announcementService.findUserByPage(currentPage, rows,title,author);
        // System.out.println(userByPage);
        request.setAttribute("pb",annoByPage);
        request.getRequestDispatcher("/index.jsp").forward(request,response);


    }
}
