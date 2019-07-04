package com.changyou.activity.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.changyou.activity.bean.InviteConfigEntity;
import com.cyou.common.datasource.mapper.SuperMapper;

@Mapper
public interface InviteConfigMapper extends SuperMapper<InviteConfigEntity> {

	@Select("select * from ds_invite_config")
	public InviteConfigEntity findOne();
}
