package com.lazy.service;

import com.lazy.entity.Comment;

/**
 * Created by IntelliJ IDEA.
 * User: Joe_Lazy
 * Date: 2023/3/28 14:34:28
 */
public interface CommentService {

    int addComment(Comment comment);

    int deleteByUid(int uid);

    void deleteByCid(int cid);
}
