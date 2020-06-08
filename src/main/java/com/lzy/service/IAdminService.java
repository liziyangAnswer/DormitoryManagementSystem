package com.lzy.service;

import com.lzy.domain.Admin;
import com.lzy.domain.PageBean;
import com.lzy.domain.Student;
import com.lzy.domain.Visitor;

/**
 * @author Answer
 * @description
 * @date 2020/04/09
 */
public interface IAdminService {
    Admin findById(Admin admin);

    void insert(Admin admin);

    PageBean<Student> findUserByPage(String currentPage, String rows, String name, String roomid);

    Admin find(Admin admin);

    void update(Admin admin);

    void delete(String sno);

    void visitor(Visitor visitor);

    PageBean<Visitor> findVisitorByPage(String currentPage, String rows, String name, String roomid);

    void visitorDelete(int visitorid);
}
