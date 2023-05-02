package com.lazy.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.objenesis.instantiator.perc.PercInstantiator;

import java.time.LocalDateTime;
import java.time.Period;

/**
 * Created by IntelliJ IDEA.
 * User: Joe_Lazy
 * Date: 2023/3/28 14:31:55
 */
@Data
public class Comment {
    private int id;
    private int cid;
    private int uid;
    private String content;
    private String date;

    private User user;
}
