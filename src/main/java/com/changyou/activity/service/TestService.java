package com.changyou.activity.service;

import com.changyou.activity.bean.TestEntity;
import com.changyou.activity.dao.TestMapper;
import com.changyou.activity.util.DateUtil;
import com.cyou.activity.common.Redis;
import com.cyou.activity.service.WbService;
import com.cyou.common.datasource.service.SuperService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicLong;

@Service
@Slf4j
public class TestService extends SuperService<TestMapper, TestEntity> {
    @Autowired
    private Redis redis;
    @Autowired
    private WbService wbService;
    private AtomicLong baseId = new AtomicLong();

    public void batchAdd(long firstId, int num) {
        if (baseId.get() == 0) {
//            synchronized (LevelLogService.class) {
//                if (baseId.get() == 0)
                    baseId.set(firstId);
//            }
        }
        List<TestEntity> datas = new ArrayList<>(num * 2);

        Date now = new Date();
        String f_now = DateUtil.sdf.format(now);
        for (int i = 0; i < num; i++) {
            TestEntity item = new TestEntity();
            item.setId(baseId.getAndAdd(1));
            item.setChannel(item.getId() + "");
            item.setGroupid(item.getId() + "");
            item.setDaytime(f_now);
            item.setLogtime(now);
            item.setRoleid(item.getId() + "");
            item.setRolelevel(1);
            item.setRolename(item.getId() + "");
            item.setUserid(item.getId() + "");

            datas.add(item);
        }
        int i = baseMapper.batchInsert(datas);
        log.warn("type: {}, num: {}", "LevelLogService", i);
    }
    public TestEntity query1(){
        //实体使用@Id的属性
        return baseMapper.selectByPrimaryKey(1);
    }
    public TestEntity query2(){
        TestEntity testEntity = new TestEntity();
        testEntity.setId(1);
        return baseMapper.testProvide(testEntity);
    }
    public Integer query3(){
        // 实际代码redisKey要写到IConstsRedis的子类，参考IConstsRedisPlat
        String redisKey = wbService.getRedisPrefix() + ":" + "test";
        redis.set(redisKey, 1, 60, TimeUnit.SECONDS);
        return (Integer)redis.get(redisKey);
    }
}
