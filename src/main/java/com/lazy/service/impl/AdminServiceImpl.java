package com.lazy.service.impl;

import com.lazy.dao.AdminMapper;
import com.lazy.entity.Admin;
import com.lazy.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Joe_Lazy
 * Date: 2023/3/28 19:47:50
 */
@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    @Override
    public Admin login(String name, String password) {
        Admin admin = adminMapper.login(name, password);
        return admin;
    }

    @Override
    public Admin findById(int id) {
        Admin admin = adminMapper.findById(id);
        return admin;
    }

    @Override
    public int count() {
        int countNum = adminMapper.countNum();
        return countNum;
    }

    @Override
    public List<Admin> findAll() {
        List<Admin> list = adminMapper.findAll();
        return list;
    }

    @Override
    public Admin selectById(int id) {
        Admin admin = adminMapper.findById(id);
        return admin;
    }


}
