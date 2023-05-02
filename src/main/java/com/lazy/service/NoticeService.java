package com.lazy.service;

import com.lazy.entity.Notice;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Joe_Lazy
 * Date: 2023/3/28 22:13:07
 */
public interface NoticeService {

    int addNotice(Notice notice);

    List<Notice> findAll();

    Notice findById(int id);

    void deleteById(int id);
}
