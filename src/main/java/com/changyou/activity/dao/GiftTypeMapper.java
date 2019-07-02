package com.changyou.activity.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.changyou.activity.bean.GiftTypeEntity;
import com.cyou.common.datasource.mapper.SuperMapper;

@Mapper
public interface GiftTypeMapper extends SuperMapper<GiftTypeEntity> {

	@Select("select * from ds_gift_type")
	public List<GiftTypeEntity> findAll();
	
}
