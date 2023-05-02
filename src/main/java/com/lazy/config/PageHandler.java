package com.lazy.config;

import com.github.pagehelper.PageHelper;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.Properties;

/**
 * Created by IntelliJ IDEA.
 * User: Joe_Lazy
 * Date: 2023/3/30 16:24:55
 */
@Configuration
public class PageHandler {

    @Bean
    public PageHelper pageHelper() {
        PageHelper ph = new PageHelper();
        Properties p = new Properties();
        p.setProperty("dialect","mysql");
        ph.setProperties(p);
        return ph;
    }
}
