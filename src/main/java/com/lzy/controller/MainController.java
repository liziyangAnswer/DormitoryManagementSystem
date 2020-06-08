package com.lzy.controller;

import com.lzy.domain.Admin;
import com.lzy.domain.Announcement;
import com.lzy.domain.Student;
import com.lzy.service.IAnnouncementService;
import com.lzy.service.impl.AdminServiceImpl;
import com.lzy.service.impl.StudentServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * @author Answer
 * @description
 * @date 2020/04/13
 */
@Controller
@RequestMapping("/main")
public class MainController {
    @Autowired
    private StudentServiceImpl studentService;
    @Autowired
    private AdminServiceImpl adminService;
    @Autowired
    private IAnnouncementService announcementService;
    @RequestMapping("/welcome")
    public String welcome(){
        return "welcome";
    }

    /**
     * 学生菜单
     * @return
     */
    @RequestMapping("/stu_info")
    public String info(){
        return "stu_info";
    }
    @RequestMapping("/stu_update")
    public String stu_update(){

        return "stu_update";
    }
    @RequestMapping("/stu_effect")
    public String stu_effect(){
        return "stu_effect";
    }
    @RequestMapping("/stu_effect_insert")
    public String stu_effect_insert(){
        return "stu_effect_insert";
    }
    @RequestMapping("/stu_effect_delete")
    public String stu_effect_delete(){
        return "stu_effect_delete";
    }

    /**
     * 宿管菜单
     * @return
     */
    @RequestMapping("/adm_info")
    public String adm_info(){
        return "adm_info";
    }
    @RequestMapping("/adm_update")
    public String adm_update(){
        return "adm_update";
    }
    @RequestMapping("/adm_stu_info")
    public String adm_stu_info(){
        return "adm_stu_info";
    }
    @RequestMapping("/adm_stu_update")
    public String adm_stu_update(){
        return "adm_stu_update";
    }
    @RequestMapping("/adm_visitor")
    public String adm_visitor(){
        return "adm_visitor";
    }
    @RequestMapping("/adm_upload")
    public String adm_upload(){
        return "adm_upload";
    }
    @RequestMapping("/anno")
    public String anno(){
        return "anno";
    }

    /**
     * 学工处菜单
     * @return
     */
    @RequestMapping("/super_adm_info")
    public String super_adm_info(){
        return "super_adm_info";
    }
    @RequestMapping("/super_update")
    public String super_update(){
        return "super_update";
    }
    @RequestMapping("/super_adm_insert")
    public String super_adm_insert(){
        return "super_adm_insert";
    }
    @RequestMapping("/super_stu_info")
    public String super_stu_info(){
        return "super_stu_info";
    }
   @RequestMapping("/super_stu_update")
    public ModelAndView super_stu_update(Student student, HttpServletRequest request){
       Student byId = studentService.find(student);
       ModelAndView modelAndView = new ModelAndView("super_stu_update");
                modelAndView.addObject("student",byId);
                return modelAndView;
    }
    @RequestMapping("/super_adm_update")
    public ModelAndView super_adm_update(Admin admin, HttpServletRequest request){
        Admin byId = adminService.find(admin);
        ModelAndView modelAndView = new ModelAndView("super_adm_update");
        modelAndView.addObject("admin",byId);
        return modelAndView;
    }
    @RequestMapping("/super_stu_insert")
    public String super_stu_insert(){
        return "super_stu_insert";
    }
    @RequestMapping("/super_anno")
    public String super_anno(){
        return "super_anno";
    }
    @RequestMapping("/anno_insert")
    public String anno_insert(){
        return "super_anno_insert";
    }
    @RequestMapping("/annolook")
    public ModelAndView annolook(Announcement announcement){
        Announcement byId = announcementService.findById(announcement);
        ModelAndView modelAndView = new ModelAndView("annolook");
        modelAndView.addObject("annobyid",byId);

        return modelAndView;
    }

}
