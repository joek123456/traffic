package com.lazy.controller;

import com.lazy.entity.Comment;
import com.lazy.entity.RoadCondition;
import com.lazy.service.CommentService;
import com.lazy.service.RoadConditionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by IntelliJ IDEA.
 * User: Joe_Lazy
 * Date: 2023/3/28 14:34:12
 */
@Controller
@RequestMapping("comment")
public class CommentController {

    @Autowired
    private RoadConditionService roadConditionService;
    @Autowired
    private CommentService commentService;

    @RequestMapping("add")
    public ModelAndView addComment(Comment comment) {
        commentService.addComment(comment);
        ModelAndView modelAndView = new ModelAndView();
        RoadCondition roadCondition = roadConditionService.findById(comment.getCid());
        modelAndView.setViewName("/pages/user/show_condition_detail");
        modelAndView.addObject("roadCondition",roadCondition);
        return modelAndView;
    }
}
