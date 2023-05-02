package com.lazy.interceptor;

import com.lazy.entity.Admin;
import com.lazy.entity.User;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by IntelliJ IDEA.
 * User: Joe_Lazy
 * Date: 2023/4/16 6:14:09
 */
@Component
public class LoginCheckInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        User nowUser = (User) session.getAttribute("nowUser");
        Admin nowAdmin = (Admin) session.getAttribute("nowAdmin");
        int localPort = request.getLocalPort();
        String loginUrl = "http://localhost:"+localPort;
        if (nowUser == null && nowAdmin == null) {
            response.getWriter().print("<script language='JavaScript'>window.location.href='"+loginUrl+"';</script>");
            return false;
        }
        return true;
    }
}
