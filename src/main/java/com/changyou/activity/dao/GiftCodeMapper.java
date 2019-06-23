package com.changyou.activity.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.SelectProvider;

import com.changyou.activity.bean.GiftCodeEntity;
import com.cyou.common.datasource.mapper.SuperMapper;

@Mapper
public interface GiftCodeMapper extends SuperMapper<GiftCodeEntity> {

	@SelectProvider(type = GiftCodeProvider.class, method = "unused")
	GiftCodeEntity unused();
	
	@SelectProvider(type = GiftCodeProvider.class, method = "used")
	int used(String code);
}
