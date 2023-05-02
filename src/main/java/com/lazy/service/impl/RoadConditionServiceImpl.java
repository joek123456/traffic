package com.lazy.service.impl;

import com.github.pagehelper.Constant;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lazy.dao.RoadConditionMapper;
import com.lazy.entity.Comment;
import com.lazy.entity.RoadCondition;
import com.lazy.entity.RoadConditionPage;
import com.lazy.service.CommentService;
import com.lazy.service.RoadConditionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Joe_Lazy
 * Date: 2023/3/27 22:23:06
 */
@Service
public class RoadConditionServiceImpl implements RoadConditionService {

   @Autowired
   private RoadConditionMapper roadConditionMapper;
   @Autowired
   private RoadConditionPage roadConditionPage;
   @Autowired
   private CommentService commentService;


    @Override
    public RoadConditionPage findAll() {
        // 设置分页
        PageHelper.startPage(1,10);

        return getRoadConditionPage();
    }

    @Override
    public RoadConditionPage findAll_P(int pageNum) {

        // 设置分页
        PageHelper.startPage(--pageNum,10);

        return getRoadConditionPage();
    }


    @Override
    public RoadConditionPage findAll_N(int pageNum) {

        // 设置分页
        PageHelper.startPage(++pageNum,10);

        return getRoadConditionPage();
    }

    private RoadConditionPage getRoadConditionPage() {
        List<RoadCondition> list = roadConditionMapper.findAll();
        System.out.println(list);
        for (RoadCondition roadCondition : list) {
            // 处理内容过长的数据
            String str = roadCondition.getAddress();
            if (str.length() > 25) {
                roadCondition.setAddress(str.substring(0, 25) + "...");
            }
        }
        System.out.println(list);
        roadConditionPage.setConditionList(list);
        roadConditionPage.setPageInfo(new PageInfo<RoadCondition>(list));
        return roadConditionPage;
    }

    @Override
    public List<RoadCondition> findByUid(Integer uid) {
        List<RoadCondition> list = roadConditionMapper.findByUid(uid);
        return list;
    }

    @Override
    public RoadCondition findById(Integer id) {
        RoadCondition roadCondition = roadConditionMapper.findById(id);
/*        List<Comment> commentList = roadCondition.getCommentList();
        for (Comment comment : commentList) {
            LocalDateTime
            comment.getDate()
        }*/
        return roadCondition;
    }

    @Override
    public int countNum(Integer uid) {
        int countNum = roadConditionMapper.countNum(uid);
        return countNum;
    }

    @Override
    public void deleteById(int id) {
        roadConditionMapper.deleteById(id);
    }

    @Override
    public void addCondition(RoadCondition roadCondition) {
        roadCondition.setPublishDate(LocalDateTime.now().toString().replaceAll("T"," "));
        roadConditionMapper.addCondition(roadCondition);
    }

    @Override
    public int count() {
        int count = roadConditionMapper.count();
        return count;
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    @Override
    public int deleteByUid(int uid) {
        // 通过用户id获取到发布的所有路况信息
        List<RoadCondition> conditions = roadConditionMapper.findByUid(uid);
        for (RoadCondition condition : conditions) {
            // 根据 路况 id 删除所有属于某路况的所有评论
            commentService.deleteByCid(condition.getId());
        }
        // 再删除用户发布的路况信息
        int i = roadConditionMapper.deleteByUid(uid);
        return i;
    }


}
