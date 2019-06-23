package com.changyou.activity.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.changyou.activity.bean.InviteGiftEntity;
import com.changyou.activity.dao.InviteGiftMapper;
import com.cyou.common.datasource.service.SuperService;

@Service
public class InviteGiftService extends SuperService<InviteGiftMapper, InviteGiftEntity> {
	
	public List<InviteGiftEntity> findAll() {
		return baseMapper.selectAll();
	}
}
