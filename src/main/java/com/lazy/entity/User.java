package com.lazy.entity;

import lombok.Data;

/**
 * Created by IntelliJ IDEA.
 * User: Joe_Lazy
 * Date: 2023/3/27 16:50:13
 */

@Data
public class User {
    private Integer id;
    private String name;
    private String password;
    private String trueName;
    private Integer gender;
    private String email;
    private String phoneNumber;
    private String registerDate;
    private String registerTime;
    private String updateDate;

}