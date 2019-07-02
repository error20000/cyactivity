package com.changyou.activity.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.changyou.activity.bean.GiftItemEntity;
import com.changyou.activity.dao.GiftItemMapper;
import com.cyou.common.datasource.service.SuperService;

@Service
public class GiftItemService extends SuperService<GiftItemMapper, GiftItemEntity> {

	public List<GiftItemEntity> findAll() {
		return baseMapper.findAll();
	}
}
