package com.lazy.dao;

import com.lazy.entity.RoadCondition;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Joe_Lazy
 * Date: 2023/3/27 22:21:41
 */
@Repository
public interface RoadConditionMapper {
    // 查询所有 路况信息
    @Select("select rc.*,u.name from t_road_condition rc,t_user u where u.id = rc.uid order by id desc")
    @Results({
            @Result(property = "id", column = "id"),
            @Result(property = "city", column = "city"),
            @Result(property = "address", column = "address"),
            @Result(property = "status", column = "status"),
            @Result(property = "publishDate", column = "publishDate"),
            @Result(property = "uid", column = "uid"),
            @Result(property = "user.name", column = "name"),
    })
    List<RoadCondition> findAll();

    // 根据用户查找路况信息
    @Select("select * from t_road_condition where uid = #{uid} order by publishDate desc")
    List<RoadCondition> findByUid(Integer uid);

    // 统计某用户的发表数量
    @Select("select count(*) from t_road_condition where uid = #{uid}")
    int countNum(Integer uid);

    // 删除路况信息
    @Delete("delete from t_road_condition where id = #{id}")
    int deleteById(Integer id);

    // 添加路况信息
    @Insert("insert into t_road_condition values(null, #{city},#{address},#{status},#{publishDate},#{uid})")
    void addCondition(RoadCondition roadCondition);

    // 根据路况信息id查找
    @Select("select rc.*,u.name,u.id userId from t_road_condition rc,t_user u where u.id = rc.uid and rc.id = #{id}")
    @Results({
            @Result(property = "id", column = "id"),
            @Result(property = "city", column = "city"),
            @Result(property = "address", column = "address"),
            @Result(property = "status", column = "status"),
            @Result(property = "publishDate", column = "publishDate"),
            @Result(property = "user.name",column = "name"),
            @Result(property = "user.id",column = "userId"),
            @Result(
                    property = "commentList",
                    column = "id",
                    javaType = List.class,
                    many = @Many(select = "com.lazy.dao.CommentMapper.findByCid")
            )
    })
    RoadCondition findById(Integer id);



    // 计算一共多少条路况信息
    @Select("select count(*) from t_road_condition")
    int count();

    // 删除通过uid删除路况信息
    @Delete("delete from t_road_condition where uid = #{uid}")
    int deleteByUid(int uid);
}
