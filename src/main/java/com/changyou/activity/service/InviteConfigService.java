package com.changyou.activity.service;

import org.springframework.stereotype.Service;

import com.changyou.activity.bean.InviteConfigEntity;
import com.changyou.activity.dao.InviteConfigMapper;
import com.cyou.common.datasource.service.SuperService;

@Service
public class InviteConfigService extends SuperService<InviteConfigMapper, InviteConfigEntity> {
	
	public InviteConfigEntity findOne() {
		return baseMapper.findOne();
	}
}
