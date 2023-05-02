package com.lazy.controller;

import com.lazy.entity.Notice;
import com.lazy.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Joe_Lazy
 * Date: 2023/3/28 22:11:18
 */
@Controller
@RequestMapping("notice")
public class NoticeController {

    @Autowired
    private NoticeService noticeService;

    @ResponseBody
    @RequestMapping("publish")
    public String publish(Notice notice) {
        int i = noticeService.addNotice(notice);

        return "ok~";
    }


    // 查看所有公告
    @RequestMapping("findAllByUser")
    public ModelAndView findAll_User() {
        List<Notice> noticeList = noticeService.findAll();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("noticeList",noticeList);
        modelAndView.setViewName("/pages/user/list_notice");
        return modelAndView;
    }

    // 查看所有公告
    @RequestMapping("findAllByAdmin")
    public ModelAndView findAll_Admin() {
        List<Notice> noticeList = noticeService.findAll();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("noticeList",noticeList);
        modelAndView.setViewName("/pages/admin/list_notice");
        return modelAndView;
    }


    // 查看公告的详情
    @RequestMapping("showDetail/{id}")
    public ModelAndView findById(@PathVariable("id") int id) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/pages/user/show_notice_detail");
        modelAndView.addObject("notice",noticeService.findById(id));
        return modelAndView;
    }

    // 删除公告
    @RequestMapping("deleteById")
    public ModelAndView deleteById(int id) {
        noticeService.deleteById(id);
        ModelAndView modelAndView = new ModelAndView();
        List<Notice> noticeList = noticeService.findAll();
        modelAndView.addObject("noticeList",noticeList);
        modelAndView.setViewName("/pages/admin/list_notice");
        return modelAndView;
    }


}
