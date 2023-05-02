package com.lazy.service;

import com.lazy.entity.EveryDayUserCount;
import com.lazy.entity.RoadCondition;
import com.lazy.entity.User;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Joe_Lazy
 * Date: 2023/3/27 16:45:03
 */
public interface UserService {

    User findByName(String name);

    User findById(int id);

    int update(User pramaUser);

    int count();

    List<User> findAll();

    int addUser(User user);

    List<EveryDayUserCount> userCountByDay();

    int deleteById(int id);
}
