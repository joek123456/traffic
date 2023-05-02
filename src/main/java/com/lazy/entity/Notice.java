package com.lazy.entity;

import lombok.Data;

/**
 * Created by IntelliJ IDEA.
 * User: Joe_Lazy
 * Date: 2023/3/28 22:15:02
 */
@Data
public class Notice {

    private int id;
    private String title;
    private int author;
    private String content;
    private String date;

    private Admin admin;

}
