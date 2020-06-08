package com.lzy.dao;

import com.lzy.domain.Admin;
import com.lzy.domain.Student;
import com.lzy.domain.Visitor;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author Answer
 * @description
 * @date 2020/04/09
 */
@Repository
public interface IAdminDao {
    @Select("select * from admin_info where sno = #{sno} and password = #{password}")
     Admin findById(Admin admin);
    @Insert("insert into admin_info (sno,name,password,tel,roomid,inroom,photo) values (#{sno},#{name},#{password},#{tel},#{roomid},#{inroom},#{photo})")
    void insert(Admin admin);

    @Select("<script>"+
            "select count(*) from admin_info where 1 = 1 " +
            "<if test='name!=null and name!= \"\"'>" +
            " and name like '%${name}%' " +
            " </if>" +
            "<if test='roomid!=null and roomid!= \"\"'> " +
            " and roomid like '%${roomid}%' " +
            "</if> " +
            "</script>")
    int findAll(@Param("name") String name, @Param("roomid") String roomid);

    @Select("<script>" +
            "select * from admin_info where 1 =1 " +
            "<if test='name!=null and name!= \"\"'>" +
            " and name like '%${name}%' " +
            "</if>" +
            "<if test='roomid!=null and roomid!= \"\"'>" +
            " and roomid like '%${roomid}%' " +
            "</if>" +
            " limit ${start},${rows}" +
            "</script>")
    List<Student> findByPage(@Param("start") int start, @Param("rows") int rows, @Param("name") String name, @Param("roomid") String roomid);

    @Select("select * from admin_info where sno = #{sno}")
    Admin find(Admin admin);
    @Update("update admin_info set name=#{name},tel=#{tel},roomid=#{roomid},photo=#{photo}  where sno=#{sno}")
    void update(Admin admin);
    @Delete("delete from admin_info where sno = #{sno}")
    void delete(String sno);
    @Insert("insert into visitor_info (name,tel,roomid,date) values (#{name},#{tel},#{roomid},#{date})")
    void visitor(Visitor visitor);




    @Select("<script>" +
            "select * from visitor_info where 1 =1 " +
            "<if test='name!=null and name!= \"\"'>" +
            " and name like '%${name}%' " +
            "</if>" +
            "<if test='roomid!=null and roomid!= \"\"'>" +
            " and roomid like '%${roomid}%' " +
            "</if>" +
            " limit ${start},${rows}" +
            "</script>")
    List<Visitor> findVisitorByPage(@Param("start") int start, @Param("rows") int rows, @Param("name") String name, @Param("roomid") String roomid);
    @Select("<script>"+
            "select count(*) from visitor_info where 1 = 1 " +
            "<if test='name!=null and name!= \"\"'>" +
            " and name like '%${name}%' " +
            " </if>" +
            "<if test='roomid!=null and roomid!= \"\"'> " +
            " and roomid like '%${roomid}%' " +
            "</if> " +
            "</script>")
    int findVisitorAll(@Param("name") String name, @Param("roomid") String roomid);
    @Delete("delete from visitor_info where id = #{visitorid}")
    void visitorDelete(int visitorid);
}
