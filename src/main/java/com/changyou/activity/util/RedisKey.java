package com.changyou.activity.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.changyou.activity.config.Config;
import com.cyou.activity.common.IConstsRedis;

@Component
public class RedisKey implements IConstsRedis {
	

    @Autowired
    private Config config;

	public String activeOffsetNum = config.redis_prefix + ":activeOffsetNum";
	public String activeOffsetTime = config.redis_prefix + ":activeOffsetTime";
	
}
