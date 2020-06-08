package com.lzy.service.impl;

import com.lzy.dao.IAdminDao;
import com.lzy.domain.Admin;
import com.lzy.domain.PageBean;
import com.lzy.domain.Student;
import com.lzy.domain.Visitor;
import com.lzy.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Answer
 * @description
 * @date 2020/04/09
 */
@Service("adminService")
public class AdminServiceImpl implements IAdminService {
    @Autowired
    private IAdminDao adminDao;
    @Override
    public Admin findById(Admin admin) {
        Admin adm = adminDao.findById(admin);
        return adm;
    }

    @Override
    public void insert(Admin admin) {
        adminDao.insert(admin);
    }

    @Override
    public PageBean<Student> findUserByPage(String _currentPage, String _rows, String name, String roomid) {
        int currentPage = Integer.parseInt(_currentPage);
        System.out.println("开始查总数");
        int total  = adminDao.findAll(name,roomid);
        System.out.println("查询到的总数"+total);
        int rows = Integer.parseInt(_rows);
        int totalPages = total % rows == 0 ? total/rows : total/rows + 1;
        if(currentPage<=1 || currentPage>totalPages)
            currentPage = 1;
        PageBean<Student> pb = new PageBean<>();
        pb.setCurrentPage(currentPage);
        pb.setRows(rows);

        pb.setTotalCounts(total);

        pb.setTotalPages(totalPages);
        int start = (currentPage - 1)*rows;
        List<Student> list = adminDao.findByPage(start,rows,name,roomid);
        pb.setList(list);
        return pb;
    }

    @Override
    public Admin find(Admin admin) {
        Admin admin1 = adminDao.find(admin);
        return admin1;
    }

    @Override
    public void update(Admin admin) {
        adminDao.update(admin);
    }

    @Override
    public void delete(String sno) {
        adminDao.delete(sno);
    }

    @Override
    public void visitor(Visitor visitor) {
        adminDao.visitor(visitor);
    }

    @Override
    public PageBean<Visitor> findVisitorByPage(String _currentPage, String _rows, String name, String roomid) {
        int currentPage = Integer.parseInt(_currentPage);
        System.out.println("开始查总数");
        int total  = adminDao.findVisitorAll(name,roomid);
        System.out.println("查询到的总数"+total);
        int rows = Integer.parseInt(_rows);
        int totalPages = total % rows == 0 ? total/rows : total/rows + 1;
        if(currentPage<=1 || currentPage>totalPages)
            currentPage = 1;
        PageBean<Visitor> pb = new PageBean<>();
        pb.setCurrentPage(currentPage);
        pb.setRows(rows);

        pb.setTotalCounts(total);

        pb.setTotalPages(totalPages);
        int start = (currentPage - 1)*rows;
        List<Visitor> list = adminDao.findVisitorByPage(start,rows,name,roomid);
        pb.setList(list);
        return pb;
    }

    @Override
    public void visitorDelete(int visitorid) {
        adminDao.visitorDelete(visitorid);
    }
}
