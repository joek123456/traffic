package com.lazy.entity;

import com.github.pagehelper.PageInfo;
import lombok.Data;

import java.util.Date;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Joe_Lazy
 * Date: 2023/3/27 22:05:37
 */
@Data
public class RoadCondition {
    private Integer id;
    private String city;
    private String address;
    private Short status;
    private String publishDate;
    private Integer uid;

    private User user;
    private List<Comment> commentList;
}
