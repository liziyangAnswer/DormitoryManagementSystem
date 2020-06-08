package com.lzy;

import com.lzy.dao.IStudentDao;
import com.lzy.domain.Student;
import com.lzy.service.IStudentService;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * @author Answer
 * @description
 * @date 2020/04/04
 */

public class Test1 {
/*    @Autowired
    private IStudentDao studentDao;
    @Test
    public void test(){
        Map map = new HashMap();
        map.put("name","李子杨");
        map.put("roomid","澄园2号205");
        int all = studentDao.findAll(map);
        System.out.println(all);

    }*/
    /* @Test
    public void test1(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
        IStudentService studentService = (IStudentService) ac.getBean("studentService");
        Student student = studentService.findById("162146140109");
        System.out.println(student);

    }

    @Test
    public void test2() throws IOException {
        InputStream resourceAsFile = Resources.getResourceAsStream("SqlMaoConfig.xml");
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(resourceAsFile);
        SqlSession session = sqlSessionFactory.openSession();
        IStudentDao studentDao = session.getMapper(IStudentDao.class);
        List<Student> list = studentDao.findAll();
        for (Student student : list) {
            System.out.println(student);
        }
    }
    @Test
    public void test3() throws IOException {
        InputStream resourceAsFile = Resources.getResourceAsStream("SqlMaoConfig.xml");
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(resourceAsFile);
        SqlSession session = sqlSessionFactory.openSession();
        IStudentDao studentDao = session.getMapper(IStudentDao.class);
        Student student = new Student();
        student.setSno("162146140101");
        student.setName("邓雷");
        student.setPassword("123456");
        student.setClase("软件工程161401");
        student.setCollege("信息工程");
        student.setMajor("软件工程");
        student.setRoomid(205);
        student.setTel("18361555187");
        studentDao.saveStudent(student);
        session.commit();
        session.close();
        resourceAsFile.close();
    }*/


}
