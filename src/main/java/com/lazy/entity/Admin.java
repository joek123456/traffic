package com.lazy.entity;

import lombok.Data;

/**
 * Created by IntelliJ IDEA.
 * User: Joe_Lazy
 * Date: 2023/3/28 19:38:48
 */

@Data
public class Admin {
    private Integer id;
    private String name;
    private String password;
    private String trueName;
    private String phone;
}
