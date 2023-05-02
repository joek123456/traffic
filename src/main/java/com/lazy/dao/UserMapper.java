package com.lazy.dao;

import com.lazy.entity.EveryDayUserCount;
import com.lazy.entity.User;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Joe_Lazy
 * Date: 2023/3/27 16:46:39
 */
@Repository
public interface UserMapper {

    @Insert("insert into t_user values(null,#{name},#{password},#{trueName}," +
            "#{gender},#{email},#{phoneNumber},now(),now(),#{updateDate})")
    int addUser(User user);

    @Select("select * from t_user where name = #{name}")
    User findByName(String name);

    @Select("select * from t_user where id = #{id}")
    User findById(int id);

    @Update("update t_user set trueName = #{trueName}, gender = #{gender},email = #{email},phoneNumber = #{phoneNumber}, updateDate = now() where id = #{id}")
    int update(User pramaUser);

    // 计算有多少用户
    @Select("select count(*) from t_user")
    int count();

    // 查询所有用户
    @Select("select * from t_user order by registerDate desc,registerTime desc")
    List<User> findAll();

    // 查询每天的注注册人数
    @Select("select registerDate date,count(*) count from t_user GROUP BY registerDate")
    List<EveryDayUserCount> userCountByDay();

    @Delete("delete from t_user where id = #{id}")
    int deleteById(int id);

}
