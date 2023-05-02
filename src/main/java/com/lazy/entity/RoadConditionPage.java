package com.lazy.entity;

import com.github.pagehelper.PageInfo;
import lombok.Data;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Joe_Lazy
 * Date: 2023/3/30 16:53:44
 */
@Data
@Component
public class RoadConditionPage {

    private List<RoadCondition> conditionList;

    private PageInfo<RoadCondition> pageInfo;
}
