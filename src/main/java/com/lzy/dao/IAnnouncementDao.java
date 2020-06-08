package com.lzy.dao;

import com.lzy.domain.Announcement;
import com.lzy.domain.Student;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author Answer
 * @description
 * @date 2020/05/09
 */
@Repository
public interface IAnnouncementDao {
    @Insert("insert into announcement (title,date,author,position,body) values (#{title},#{date},#{author},#{position},#{body})")
    void insert(Announcement announcement);
    @Select("<script>"+
            "select count(*) from announcement where 1 = 1 " +
            "<if test='title!=null and title!= \"\"'>" +
            " and title like '%${title}%' " +
            " </if>" +
            "<if test='author!=null and author!= \"\"'> " +
            " and author like '%${author}%' " +
            "</if> " +
            "</script>")
    int findAll(@Param("title") String title, @Param("author") String author);
    @Select("<script>" +
            "select * from announcement where 1 =1 " +
            "<if test='title!=null and title!= \"\"'>" +
            " and title like '%${title}%' " +
            "</if>" +
            "<if test='author!=null and author!= \"\"'>" +
            " and author like '%${author}%' " +
            "</if>" +
            " limit ${start},${rows}" +
            "</script>")
    List<Announcement> findByPage(@Param("start") int start, @Param("rows") int rows, @Param("title") String title, @Param("author") String author);
    @Select("select * from announcement where id = #{id}")
    Announcement findById(Announcement announcement);
}
