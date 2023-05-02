package com.lazy.service;

import com.lazy.entity.Admin;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Joe_Lazy
 * Date: 2023/3/28 19:46:59
 */
public interface AdminService {

    Admin login(String name,String password);

    Admin findById(int id);

    int count();

    List<Admin> findAll();

    Admin selectById(int id);
}
