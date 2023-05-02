package com.lazy.controller;

import com.lazy.dao.NoticeMapper;
import com.lazy.entity.Notice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Joe_Lazy
 * Date: 2023/3/27 15:39:10
 */
@RestController
public class TestController {

    @Autowired
    private NoticeMapper noticeMapper;

    @RequestMapping("test1")
    public List<Notice> test1() {
        List<Notice> list = noticeMapper.findAll();
        return list;
    }
}
