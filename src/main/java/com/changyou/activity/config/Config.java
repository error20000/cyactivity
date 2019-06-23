package com.changyou.activity.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class Config {
	
	@Value("${wb.redis.prefix}")
	public String redis_prefix;
	
}
