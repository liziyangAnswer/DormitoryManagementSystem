package com.lzy.dao;

import com.lzy.domain.Admin;
import com.lzy.domain.SuperAdmin;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

/**
 * @author Answer
 * @description
 * @date 2020/05/05
 */
@Repository
public interface ISuperAdminDao {
    @Select("select * from sup_adm where id = #{id} and password = #{password}")
    SuperAdmin findById(SuperAdmin superAdmin);
    @Update("update sup_adm set name=#{name},tel=#{tel},position=#{position},password=#{password} where id=#{id}")
    void update(SuperAdmin superAdmin);
}
