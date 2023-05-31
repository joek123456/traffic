package com.lazy.controller;

import com.lazy.entity.Notice;
import com.lazy.entity.RoadCondition;
import com.lazy.entity.User;
import com.lazy.service.NoticeService;
import com.lazy.service.RoadConditionService;
import com.lazy.service.UserService;
import org.apache.tomcat.util.security.MD5Encoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Joe_Lazy
 * Date: 2023/3/27 16:20:33
 */
@Controller
@RequestMapping("user")
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private RoadConditionService roadConditionService;
    @Autowired
    private NoticeService noticeService;

    @PostMapping("login")
    public ModelAndView login(String name, String password, HttpSession session) {
        // 调用UserService的findByName()方法
        User user = userService.findByName(name);
        ModelAndView modelAndView = new ModelAndView();
        // 判断User对象是否为null
        if (user == null) {
            // 为 null   直接返回错误信息
            modelAndView.setViewName("/index");
            modelAndView.addObject("msg", "该账号不存在 请注册~");
            return modelAndView;
        }
        // 将客户端传入的密码进行 md5 加密
        password = DigestUtils.md5DigestAsHex(password.getBytes());
        // 判断密码是否相等
        if (!password.equals(user.getPassword())) {
            // 不相等  返回错误信息
            modelAndView.setViewName("/index");
            modelAndView.addObject("msg", "密码输入错误，请重新输入~");
            return modelAndView;
        }
        //modelAndView = new ModelAndView(new RedirectView("/pages/user/home.jsp"));
        session.setAttribute("nowUser", user);  // 为了登录拦截
        modelAndView.addObject("user", user);
        modelAndView.setViewName("/pages/user/home");   // 为了页面跳转

        // 查询用户首页的notice
        List<Notice> all = noticeService.findAll();
        modelAndView.addObject("noticeList", all);

        return modelAndView;
    }


    @GetMapping("show_detail")
    public ModelAndView findById(int id) {
        User user = userService.findById(id);
        List<RoadCondition> conditionList = roadConditionService.findByUid(id);
        int countNum = roadConditionService.countNum(id);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("count", countNum);
        modelAndView.addObject("user", user);
        modelAndView.addObject("conditionList", conditionList);
        modelAndView.setViewName("/pages/user/show_user_detail");
        return modelAndView;
    }

    @GetMapping("show_detail_a")
    public ModelAndView findById_a(int id) {
        User user = userService.findById(id);
        List<RoadCondition> conditionList = roadConditionService.findByUid(id);
        int countNum = roadConditionService.countNum(id);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("count", countNum);
        modelAndView.addObject("user", user);
        modelAndView.addObject("conditionList", conditionList);
        modelAndView.setViewName("/pages/admin/show_user_detail");
        return modelAndView;
    }


    @RequestMapping("updateUI")
    public ModelAndView updateUI(int id) {
        ModelAndView modelAndView = new ModelAndView();
        User user = userService.findById(id);
        modelAndView.addObject("user", user);
        modelAndView.setViewName("/pages/user/update_ui");
        return modelAndView;
    }


    // 更新操作
    @PostMapping("update")
    public ModelAndView update(User pramaUser) {
        System.out.println("-------------------");
        int i = userService.update(pramaUser);
        User user = userService.findById(pramaUser.getId());
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("user", user);
        modelAndView.setViewName("/pages/user/update_ui");
        return modelAndView;
    }

    // 用户注册
    //@RequestMapping("register")
    /*public ModelAndView register(User user, HttpServletResponse response) throws IOException {
        String name = user.getName();
        user.setPassword(DigestUtils.md5DigestAsHex(user.getPassword().getBytes()));
        User u = userService.findByName(name);
        ModelAndView modelAndView = new ModelAndView();
        if (u != null) {
            modelAndView.addObject("msg", "该用户名已经存在，请重新注册");
            modelAndView.setViewName("/pages/user/userRegister");
            return modelAndView;
        }
        int i = userService.addUser(user);
        if (i == 0) {
            modelAndView.addObject("msg", "注册失败，请联系管理员");
            modelAndView.setViewName("/pages/user/userRegister");
            return modelAndView;
        }

        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-Type","text/html;charset=utf-8");
        PrintWriter writer = response.getWriter();
        writer.println("<script language='JavaScript'>alert('注册成功，即将跳转到登录界面')</script>");


        modelAndView.setViewName("/index");
        return modelAndView;
    }*/


    @RequestMapping("register")
    public void register(User user, HttpServletResponse response,HttpServletRequest request) throws IOException {
        // 获取表单中的用户名  根据用户名查询用户
        String name = user.getName();
        User u = userService.findByName(name);
        // 解决响应的中文乱码
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-Type","text/html;charset=utf-8");
        PrintWriter writer = response.getWriter();

        writer.println("<script language='JavaScript'>");
        if (u != null) {    // 若查询结果不为 null 表示用户名已经存在， 不允许注册   跳转至注册页面
            writer.println("alert('该用户名已经存在，请重新注册');location.href='/pages/user/userRegister.jsp';");
            writer.println("</script>");
            return;
        }
        // 将表单数据的 password 值进行md5加密 ，并重新赋值
        user.setPassword(DigestUtils.md5DigestAsHex(user.getPassword().getBytes()));
        int i = userService.addUser(user);  // 调用 添加用户的方法
        // 根据对数据库记录英雌昂的行数进项判断
        if (i == 0) {
            // 注册失败
            writer.println("alert('注册失败，请联系管理员');location.href='/pages/user/userRegister.jsp';");
        } else {
            // 注册成功
            writer.println("alert('注册成功，即将跳转到登录界面');location.href='/index.jsp';");
        }
        writer.println("</script>");
    }





    // 进入首页
    @RequestMapping("toHome")
    public ModelAndView toHome() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/pages/user/home");
        List<Notice> list = noticeService.findAll();
        modelAndView.addObject("noticeList", list);
        return modelAndView;
    }


    //  管理员删除用户
    @RequestMapping("deleteById")
    public ModelAndView deleteById(int id) {
        // 根据id执行删除方法
        int i = userService.deleteById(id);
        ModelAndView modelAndView = new ModelAndView();
        // 调用 findAll 方法  获取最新的数据
        List<User> list = userService.findAll();
        modelAndView.addObject("list", list);
        modelAndView.setViewName("/pages/admin/list_user");
        return modelAndView;
    }


}
