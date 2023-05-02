package com.lazy.service.impl;

import com.lazy.dao.CommentMapper;
import com.lazy.entity.Comment;
import com.lazy.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;

/**
 * Created by IntelliJ IDEA.
 * User: Joe_Lazy
 * Date: 2023/3/28 15:54:04
 */
@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentMapper commentMapper;

    @Override
    public int addComment(Comment comment) {
        comment.setDate(LocalDateTime.now().toString().replaceAll("T"," "));
        commentMapper.addComment(comment);
        return 0;
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    @Override
    public int deleteByUid(int uid) {
        int i = commentMapper.deleteByUid(uid);
        return i;
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    @Override
    public void deleteByCid(int cid) {
        commentMapper.deleteByCid(cid);
    }
}
