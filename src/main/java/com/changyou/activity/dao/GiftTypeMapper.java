package com.changyou.activity.dao;

import org.apache.ibatis.annotations.Mapper;

import com.changyou.activity.bean.GiftTypeEntity;
import com.cyou.common.datasource.mapper.SuperMapper;

@Mapper
public interface GiftTypeMapper extends SuperMapper<GiftTypeEntity> {

}
