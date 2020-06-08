package com.lzy.dao;

import com.lzy.domain.Effects;
import com.lzy.domain.Student;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @author Answer
 * @description 操作学生信息的持久层接口
 * @date 2020/04/04
 */
@Repository
public interface IStudentDao {
    /**
     *查询所有学生信息
     * @return
     * @param
     */
    @Select("<script>"+
            "select count(*) from stu_info where 1 = 1 " +
            "<if test='name!=null and name!= \"\"'>" +
            " and name like '%${name}%' " +
            " </if>" +
            "<if test='roomid!=null and roomid!= \"\"'> " +
            " and roomid like '%${roomid}%' " +
            "</if> " +
            "</script>")
    int findAll(@Param("name") String name, @Param("roomid") String roomid);

    /**
     * 根据id查询学生信息登录
     * @return
     */
    @Select("select * from stu_info where sno = #{sno} and password = #{password}")
    Student findById(Student student);
    @Select("select * from stu_info where sno = #{sno}")
    Student find(Student student);

    /**
     *保存学生信息
     * @param student
     */
    @Insert("insert into stu_info (sno,name,password,tel,roomid,inroom,college,major,clase,gender,photo) values (#{sno},#{name},#{password},#{tel},#{roomid},#{inroom},#{college},#{major},#{clase},#{gender},#{photo})")
    void insert(Student student);

    /**
     * 分页查找
     * @param
     * @param start
     * @param rows
     * @param
     * @return
     */
    @Select("<script>" +
            "select * from stu_info where 1 =1 " +
            "<if test='name!=null and name!= \"\"'>" +
            " and name like '%${name}%' " +
            "</if>" +
            "<if test='roomid!=null and roomid!= \"\"'>" +
            " and roomid like '%${roomid}%' " +
            "</if>" +
            " limit ${start},${rows}" +
            "</script>")
    List<Student> findByPage(@Param("start") int start, @Param("rows") int rows, @Param("name") String name,@Param("roomid") String roomid);

    /**
     * 修改信息
     * @param student
     * @return
     */
    @Update("update stu_info set name=#{name},tel=#{tel},gender=#{gender},roomid=#{roomid},college=#{college},clase=#{clase},photo=#{photo}  where sno=#{sno}")
     void update(Student student);
    @Delete("delete from stu_info where sno = #{sno}")
    void delete(String sno);
    @Update("update stu_info set photo=#{photopath} where sno=#{sno}")
    void photo(String phtotpath);



    @Select("select count(*) from effects_info where sno = #{sno} ")
    int findEffectAll(String sno);
    @Select("select * from effects_info where sno = #{sno} limit ${start},${rows}" )
    List<Effects> findEffectByPage(@Param("start") int start, @Param("rows") int rows, @Param("sno") String sno);
    @Delete("delete from effects_info where id = #{effectid}")
    void effectDelete(int effectid);
    @Insert("insert into effects_info (sno,name) values (#{sno},#{name})")
    void effectInsert(Effects effects);
    @Select("select * from stu_info where photo = #{photopath} ")
    Student findByPhoto(String photopath);
}
