package com.changyou.activity.util;

import org.springframework.stereotype.Component;

import com.cyou.activity.common.IConstsRedis;

@Component
public class RedisKey implements IConstsRedis {
	

	public String activeOffsetNum = "02000:activeOffsetNum";
	public String activeOffsetTime = "02000:activeOffsetTime";
	
}
