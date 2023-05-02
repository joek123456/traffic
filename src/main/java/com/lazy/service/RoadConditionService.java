package com.lazy.service;

import com.lazy.entity.RoadCondition;
import com.lazy.entity.RoadConditionPage;
import org.apache.ibatis.annotations.Insert;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Joe_Lazy
 * Date: 2023/3/27 22:22:22
 */
public interface RoadConditionService {
    RoadConditionPage findAll();

    RoadConditionPage findAll_P(int pageNum);

    RoadConditionPage findAll_N(int pageNum);

    List<RoadCondition> findByUid(Integer uid);

    RoadCondition findById(Integer id);

    int countNum(Integer uid);

    void deleteById(int id);

    void addCondition(RoadCondition roadCondition);

    int count();

    int deleteByUid(int id);
}
