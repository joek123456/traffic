package com.lazy.controller;

import com.lazy.entity.RoadCondition;
import com.lazy.entity.RoadConditionPage;
import com.lazy.entity.User;
import com.lazy.service.RoadConditionService;
import com.lazy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.Banner;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Joe_Lazy
 * Date: 2023/3/27 22:24:47
 */
@Controller
@RequestMapping("condition")
public class RoadConditionController {

    @Autowired
    private RoadConditionService roadConditionService;

    @Autowired
    private UserService userService;

    @RequestMapping("list")
    public ModelAndView findAll() {
        ModelAndView modelAndView = new ModelAndView();
        RoadConditionPage conditionList = roadConditionService.findAll();
        modelAndView.addObject("conditionList",conditionList);
        modelAndView.setViewName("/pages/user/list_all_condition");
        return modelAndView;
    }
    @RequestMapping("list_a")
    public ModelAndView findAll_a() {
        ModelAndView modelAndView = new ModelAndView();
        RoadConditionPage conditionList = roadConditionService.findAll();
        modelAndView.addObject("list",conditionList);
        modelAndView.setViewName("/pages/admin/list_condition");
        return modelAndView;
    }

    // 上一页的数据
    @RequestMapping("listPagePre")
    public ModelAndView findAllPagePre(int pageNum) {
        ModelAndView modelAndView = new ModelAndView();
        RoadConditionPage conditionList = roadConditionService.findAll_P(pageNum);
        modelAndView.addObject("conditionList",conditionList);
        modelAndView.setViewName("/pages/user/list_all_condition");
        return modelAndView;
    }

    // 下一页的数据
    @RequestMapping("listPageNext")
    public ModelAndView findAllPageNext(int pageNum) {
        ModelAndView modelAndView = new ModelAndView();
        RoadConditionPage conditionList = roadConditionService.findAll_N(pageNum);
        modelAndView.addObject("conditionList",conditionList);
        modelAndView.setViewName("/pages/user/list_all_condition");
        return modelAndView;
    }


    // 上一页的数据
    @RequestMapping("listPagePre_a")
    public ModelAndView findAllPagePre_a(int pageNum) {
        ModelAndView modelAndView = new ModelAndView();
        RoadConditionPage conditionList = roadConditionService.findAll_P(pageNum);
        modelAndView.addObject("list",conditionList);
        modelAndView.setViewName("/pages/admin/list_condition");
        return modelAndView;
    }

    // 下一页的数据
    @RequestMapping("listPageNext_a")
    public ModelAndView findAllPageNext_a(int pageNum) {
        ModelAndView modelAndView = new ModelAndView();
        RoadConditionPage conditionList = roadConditionService.findAll_N(pageNum);
        modelAndView.addObject("list",conditionList);
        modelAndView.setViewName("/pages/admin/list_condition");
        return modelAndView;
    }


    @RequestMapping("findByUid")
    public ModelAndView findByUid(Integer id) {
        ModelAndView modelAndView = new ModelAndView();
        List<RoadCondition> conditionList = roadConditionService.findByUid(id);
        modelAndView.addObject("conditionList",conditionList);
        modelAndView.setViewName("/pages/user/list_condition");
        return modelAndView;
    }


    @RequestMapping("{id}/{uid}")
    public ModelAndView deleteById(@PathVariable("id") int id,@PathVariable("uid") int uid) {
        User user = userService.findById(uid);
        List<RoadCondition> conditionList = roadConditionService.findByUid(uid);
        int countNum = roadConditionService.countNum(uid);
        roadConditionService.deleteById(id);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("count",countNum);
        modelAndView.addObject("user",user);
        modelAndView.addObject("conditionList",conditionList);
        modelAndView.setViewName("/pages/user/show_user_detail");
        return modelAndView;
    }


    @RequestMapping("publish")
    public ModelAndView publish(RoadCondition roadCondition) {
        ModelAndView modelAndView = new ModelAndView();
        roadConditionService.addCondition(roadCondition);
        RoadConditionPage conditionList = roadConditionService.findAll();
        modelAndView.addObject("conditionList",conditionList);
        modelAndView.setViewName("/pages/user/list_all_condition");
        return modelAndView;
    }

    // 查看路况信息详情
    @RequestMapping("{id}")
    public ModelAndView showConditionDetail(@PathVariable  int id) {
        ModelAndView modelAndView = new ModelAndView();
        RoadCondition roadCondition = roadConditionService.findById(id);
        modelAndView.setViewName("/pages/user/show_condition_detail");
        modelAndView.addObject("roadCondition",roadCondition);
        return modelAndView;
    }

    @RequestMapping("a/{id}")
    public ModelAndView showConditionDetail_a(@PathVariable  int id) {
        ModelAndView modelAndView = new ModelAndView();
        RoadCondition roadCondition = roadConditionService.findById(id);
        modelAndView.setViewName("/pages/admin/show_condition_detail");
        modelAndView.addObject("roadCondition",roadCondition);
        return modelAndView;
    }


    @RequestMapping("delete/{id}")
    public ModelAndView deleteById_a(@PathVariable("id") int id) {
        roadConditionService.deleteById(id);
        ModelAndView modelAndView = new ModelAndView();
        RoadConditionPage list = roadConditionService.findAll();
        modelAndView.addObject("list",list);
        modelAndView.setViewName("/pages/admin/list_condition");
        return modelAndView;
    }




}
