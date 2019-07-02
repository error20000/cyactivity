package com.changyou.activity.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.changyou.activity.bean.GiftItemEntity;
import com.cyou.common.datasource.mapper.SuperMapper;

@Mapper
public interface GiftItemMapper extends SuperMapper<GiftItemEntity> {

	@Select("select * from ds_gift_item")
	public List<GiftItemEntity> findAll();
}
