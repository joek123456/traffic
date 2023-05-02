package com.lazy.controller;

import com.lazy.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * Created by IntelliJ IDEA.
 * User: Joe_Lazy
 * Date: 2023/3/28 19:03:30
 */
@Controller
public class LoginController {

    @Autowired
    private UserController userController;

    @RequestMapping("login")
    public void login(String name, String password, int identity, HttpSession session) {
        if(identity == 1){


        }else if (identity == 0){
            userController.login(name,password,session);
        }





    }
}
