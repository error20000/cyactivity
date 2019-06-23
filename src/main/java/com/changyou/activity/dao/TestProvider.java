package com.changyou.activity.dao;

import com.changyou.activity.bean.TestEntity;

public class TestProvider {
    public String test1(TestEntity attend){
        StringBuilder sb = new StringBuilder(200);
        sb.append("select * from LOB_LEVEL_LOG where id=#{id}");
        return sb.toString();
    }
}
