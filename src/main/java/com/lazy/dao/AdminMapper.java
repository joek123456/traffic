package com.lazy.dao;

import com.lazy.entity.Admin;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Joe_Lazy
 * Date: 2023/3/28 19:36:40
 */
@Component
public interface AdminMapper {

    // 登录判断
    @Select("select * from t_admin where name = #{name} and password = #{password}")
    Admin login(String name,String password);

    @Select("select * from t_admin")
    List<Admin> findAll();

    @Select("select count(*) from t_admin")
    int countNum();

    // 根据 id 查询管理员
    @Select("select * from t_admin where id = #{id}")
    Admin findById(int id);


}
