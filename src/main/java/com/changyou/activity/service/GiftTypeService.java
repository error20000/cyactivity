package com.changyou.activity.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.changyou.activity.bean.GiftTypeEntity;
import com.changyou.activity.dao.GiftTypeMapper;
import com.cyou.common.datasource.service.SuperService;

@Service
public class GiftTypeService extends SuperService<GiftTypeMapper, GiftTypeEntity> {

	public List<GiftTypeEntity> findAll() {
		return baseMapper.findAll();
	}
}
