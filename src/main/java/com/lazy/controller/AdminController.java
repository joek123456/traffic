package com.lazy.controller;

import com.lazy.entity.*;
import com.lazy.service.AdminService;
import com.lazy.service.RoadConditionService;
import com.lazy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Created by IntelliJ IDEA.
 * User: Joe_Lazy
 * Date: 2023/3/28 19:29:13
 */
@Controller
@RequestMapping("admin")
public class AdminController {


    @Autowired
    private AdminService adminService;
    @Autowired
    private UserService userService;
    @Autowired
    private RoadConditionService roadConditionService;

    @ResponseBody
    @RequestMapping("login")
    public ModelAndView login(String name, String password, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        // 调用AdminService的login方法
        Admin admin = adminService.login(name, password);
        // 判断查询结构是否为空
        if (admin == null) {
            // 结果为空 返回错误信息
            modelAndView.addObject("msg","账号或密码错误！");
            modelAndView.setViewName("/index");
            return modelAndView;
        }
        // 不为空进入首页
        session.setAttribute("nowAdmin",admin);
        modelAndView.addObject("admin",admin);
        modelAndView.setViewName("/pages/admin/adminIndex");
        return modelAndView;
    }

    @RequestMapping("loadIndex")
    public ModelAndView loadIndex(int id) {
        ModelAndView modelAndView = new ModelAndView();
        Admin admin = adminService.findById(id);
        int adminCount = adminService.count();
        int userCount = userService.count();
        int rcCount = roadConditionService.count();

        List<EveryDayUserCount> list = userService.userCountByDay();
        List<String> dateArr = new ArrayList<>();
        List<Integer> countArr = new ArrayList<>();
        for (EveryDayUserCount everyDayUserCount : list) {
            dateArr.add("'"+everyDayUserCount.getDate()+"'");
            countArr.add(everyDayUserCount.getCount());
        }

        modelAndView.addObject("admin",admin);
        modelAndView.addObject("adminCount",adminCount);
        modelAndView.addObject("userCount",userCount);
        modelAndView.addObject("rcCount",rcCount);
        modelAndView.addObject("dateArr",dateArr);
        modelAndView.addObject("countArr",countArr);
        modelAndView.setViewName("/pages/admin/home");
        return modelAndView;
    }

    @RequestMapping("listCondition")
    public ModelAndView showAllCondition() {
        ModelAndView modelAndView = new ModelAndView();
        RoadConditionPage list = roadConditionService.findAll();
        modelAndView.addObject("list",list);
        modelAndView.setViewName("/pages/admin/list_condition");
        return modelAndView;
    }

    @RequestMapping("listUser")
    public ModelAndView showAllUser() {
        ModelAndView modelAndView = new ModelAndView();
        List<User> list = userService.findAll();
        modelAndView.addObject("list",list);
        modelAndView.setViewName("/pages/admin/list_user");
        return modelAndView;
    }

    @RequestMapping("listAdmin")
    public ModelAndView showAllAdmin() {
        ModelAndView modelAndView = new ModelAndView();
        List<Admin> list = adminService.findAll();
        modelAndView.addObject("list",list);
        modelAndView.setViewName("/pages/admin/list_admin");
        return modelAndView;
    }


    // 根据id查询管理员
    @RequestMapping("selectById")
    public ModelAndView selectById(int id) {
        Admin admin = adminService.selectById(id);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("admin",admin);
        modelAndView.setViewName("/pages/admin/show_admin_detail");
        return modelAndView;
    }
}
