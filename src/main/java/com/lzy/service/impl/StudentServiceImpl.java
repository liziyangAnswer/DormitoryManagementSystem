package com.lzy.service.impl;

import com.lzy.dao.IStudentDao;
import com.lzy.domain.Effects;
import com.lzy.domain.PageBean;
import com.lzy.domain.Student;
import com.lzy.service.IStudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Answer
 * @description 操作学生信息业务层实现类
 * @date 2020/04/04
 */
@Service("studentService")
public class StudentServiceImpl implements IStudentService {
    @Autowired
    private IStudentDao studentDao;

    @Override
    public Student findById(Student student) {
        return studentDao.findById(student);
    }



    @Override
    public PageBean<Student> findUserByPage(String _currentPage, String _rows, String name,String roomid) {
        int currentPage = Integer.parseInt(_currentPage);
        System.out.println("开始查总数");
        int total  = studentDao.findAll(name,roomid);
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
        List<Student> list = studentDao.findByPage(start,rows,name,roomid);
        pb.setList(list);
        return pb;
    }

    @Override
    public Student find(Student student) {
        Student student1 = studentDao.find(student);
        return student1;
    }

    @Override
    public void update(Student student) {
        studentDao.update(student);


    }

    @Override
    public void delete(String sno) {
        studentDao.delete(sno);
    }

    @Override
    public void photo(String phtotpath) {
        studentDao.photo(phtotpath);
    }

    @Override
    public PageBean<Effects> findEffectByPage(String _currentPage, String _rows, String sno) {
        int currentPage = Integer.parseInt(_currentPage);
        System.out.println("开始查总数");
        int total  = studentDao.findEffectAll(sno);
        System.out.println("查询到的总数"+total);
        int rows = Integer.parseInt(_rows);
        int totalPages = total % rows == 0 ? total/rows : total/rows + 1;
        if(currentPage<=1 || currentPage>totalPages)
            currentPage = 1;
        PageBean<Effects> pb = new PageBean<>();
        pb.setCurrentPage(currentPage);
        pb.setRows(rows);

        pb.setTotalCounts(total);

        pb.setTotalPages(totalPages);
        int start = (currentPage - 1)*rows;
        List<Effects> list = studentDao.findEffectByPage(start,rows,sno);
        pb.setList(list);
        return pb;
    }

    @Override
    public void effectDelete(int effectid) {
        studentDao.effectDelete(effectid);
    }

    @Override
    public void effectInsert(Effects effects) {
        studentDao.effectInsert(effects);
    }

    @Override
    public Student findByPhoto(String photopath) {
        Student byPhoto = studentDao.findByPhoto(photopath);
        return byPhoto;
    }

    @Override
    public void insert(Student student) {
        studentDao.insert(student);
    }
}
