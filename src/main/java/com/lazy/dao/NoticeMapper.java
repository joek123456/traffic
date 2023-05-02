package com.lazy.dao;

import com.lazy.entity.Notice;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Joe_Lazy
 * Date: 2023/3/28 22:16:51
 */
@Repository
public interface NoticeMapper {

    @Insert("insert into t_notice values(null,#{title},#{author},#{content},now())")
    int addNotice(Notice notice);

    // 查询所有公告
    @Select("select * from t_notice order by date desc")
    List<Notice> findAll();

    // 根据id查询
    @Select("select n.*,a.name from t_notice n,t_admin a where n.author = a.id and n.id = #{id}")
    @Results({
            @Result(column = "id", property = "id"),
            @Result(column = "title", property = "title"),
            @Result(column = "author", property = "author"),
            @Result(column = "content", property = "content"),
            @Result(column = "date", property = "date"),
            @Result(column = "name", property = "admin.name"),
    })
    Notice findById(int id);

    // 删除公告
    @Delete("delete from t_notice where id = #{id}")
    void deleteById(int id);
}
