package com.changyou.activity.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.UpdateProvider;

import com.changyou.activity.bean.ActiveOffsetEntity;
import com.cyou.common.datasource.mapper.SuperMapper;

@Mapper
public interface ActiveOffsetMapper extends SuperMapper<ActiveOffsetEntity> {

	
	@UpdateProvider(type = ActiveOffsetProvider.class, method = "update")
	int update(ActiveOffsetEntity obj);
	

	@SelectProvider(type = ActiveOffsetProvider.class, method = "find")
	ActiveOffsetEntity find();
	
}
