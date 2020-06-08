package com.lzy.service;

import com.lzy.domain.Effects;
import com.lzy.domain.PageBean;
import com.lzy.domain.Student;

/**
 * @author Answer
 * @description 操作学生信息的业务层接口
 * @date 2020/04/04
 */
public interface IStudentService {
    /**
     * 根据id查询学生信息
     * @param student
     * @return
     */
    Student findById(Student student);


    /**
     *保存学生信息
     * @param student
     */
    void insert(Student student);

    /**
     * 分页查询方法
     * @param
     * @param _currentPage
     * @param _rows
     * @param
     * @return
     */
    PageBean<Student> findUserByPage(String _currentPage, String _rows, String name,String roomid);

    Student find(Student student);

     void update(Student student);
     void delete(String sno);

    void photo(String phtotpath);


    PageBean<Effects> findEffectByPage(String currentPage, String rows, String sno);

    void effectDelete(int effectid);

    void effectInsert(Effects effects);

    Student findByPhoto(String photopath);
}
