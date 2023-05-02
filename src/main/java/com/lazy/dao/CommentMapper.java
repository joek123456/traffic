package com.lazy.dao;

import com.lazy.entity.Comment;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Joe_Lazy
 * Date: 2023/3/28 14:47:48
 */
@Repository
public interface CommentMapper {

    @Select("select c.*,u.name from t_comment c,t_user u where c.uid = u.id and cid = #{cid} order by date desc")
    @Results({
            @Result(property = "id", column = "id"),
            @Result(property = "cid", column = "cid"),
            @Result(property = "uid", column = "uid"),
            @Result(property = "content", column = "content"),
            @Result(property = "date", column = "date"),
            @Result(property = "user.name", column = "name"),
    })
    List<Comment> findByCid(Integer cid);

    @Insert("insert into t_comment values(null,#{uid},#{cid},#{content},#{date})")
    int addComment(Comment comment);

    // 根据用户id删除评论
    @Delete("delete from t_comment where uid = #{uid}")
    int deleteByUid(int uid);

    // 根据路况id删除评论
    @Delete("delete from t_comment where cid = #{cid}")
    void deleteByCid(int cid);
}
