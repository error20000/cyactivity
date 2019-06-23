package com.changyou.activity.service;

import org.springframework.stereotype.Service;

import com.changyou.activity.bean.ActiveOffsetEntity;
import com.changyou.activity.dao.ActiveOffsetMapper;
import com.cyou.common.datasource.service.SuperService;

@Service
public class ActiveOffsetService extends SuperService<ActiveOffsetMapper, ActiveOffsetEntity> {


	public int update(ActiveOffsetEntity obj) {
		return baseMapper.update(obj);
	}
}
