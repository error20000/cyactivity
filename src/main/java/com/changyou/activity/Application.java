package com.changyou.activity;

import com.cyou.common.datasource.DynamicDataSourceRegister;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Import;
import org.springframework.scheduling.annotation.EnableAsync;

@SpringBootApplication
@Import({DynamicDataSourceRegister.class})//处理多数据源切换
@ComponentScan(basePackages={"com.changyou", "com.cyou"})
@MapperScan(basePackages={"com.changyou.activity.dao", "com.cyou.activity.dao"})
@EnableAsync
public class Application {
    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}
