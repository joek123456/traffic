package com.lazy.service.impl;

import com.lazy.dao.CommentMapper;
import com.lazy.dao.RoadConditionMapper;
import com.lazy.dao.UserMapper;
import com.lazy.entity.EveryDayUserCount;
import com.lazy.entity.User;
import com.lazy.service.CommentService;
import com.lazy.service.RoadConditionService;
import com.lazy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Joe_Lazy
 * Date: 2023/3/27 16:45:32
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private RoadConditionService roadConditionService;
    @Autowired
    private CommentService commentService;


    @Override
    public User findByName(String name) {
        return userMapper.findByName(name);
    }

    @Override
    public User findById(int id) {
        User user = userMapper.findById(id);
        if (user != null && user.getUpdateDate() != null && user.getUpdateDate().contains(".")) {
            user.setUpdateDate(user.getUpdateDate().split("\\.")[0]);
        }
        return user;
    }

    @Override
    public int update(User pramaUser) {
        int i = userMapper.update(pramaUser);
        return i;
    }

    @Override
    public int count() {
        int count = userMapper.count();
        return count;
    }

    @Override
    public List<User> findAll() {
        List<User> list = userMapper.findAll();
        return list;
    }

    @Override
    public int addUser(User user) {
        user.setUpdateDate(LocalDateTime.now().toString());
        int i = userMapper.addUser(user);
        return i;
    }

    @Override
    public List<EveryDayUserCount> userCountByDay() {
        List<EveryDayUserCount> list = userMapper.userCountByDay();
        return list;
    }

    // 删除用户
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    @Override
    public int deleteById(int id) {
        // 先根据用户id删除评论
        commentService.deleteByUid(id);
        // 再删除该用户发布的路况信息
        int j = roadConditionService.deleteByUid(id);
        // 最后删除用户信息
        int i = userMapper.deleteById(id);
        return i;
    }

    public static void main(String[] args) {
        UserServiceImpl userService = new UserServiceImpl();
        userService.userCountByDay();
    }

}
