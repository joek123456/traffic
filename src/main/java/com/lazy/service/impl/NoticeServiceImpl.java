package com.lazy.service.impl;

import com.lazy.dao.NoticeMapper;
import com.lazy.entity.Notice;
import com.lazy.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Joe_Lazy
 * Date: 2023/3/28 22:13:39
 */
@Service
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    private NoticeMapper noticeMapper;

    @Override
    public int addNotice(Notice notice) {

        noticeMapper.addNotice(notice);
        return 0;
    }

    @Override
    public List<Notice> findAll() {
        List<Notice> list = noticeMapper.findAll();
        return list;
    }

    @Override
    public Notice findById(int id) {
        Notice notice = noticeMapper.findById(id);

        String content = notice.getContent().replaceAll("\\r\\n", "</p><p>");
        notice.setContent(content);
        return notice;
    }

    @Override
    public void deleteById(int id) {
        noticeMapper.deleteById(id);
    }
}
