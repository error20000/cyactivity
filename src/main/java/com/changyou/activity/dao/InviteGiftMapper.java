package com.changyou.activity.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.changyou.activity.bean.InviteGiftEntity;
import com.cyou.common.datasource.mapper.SuperMapper;

@Mapper
public interface InviteGiftMapper extends SuperMapper<InviteGiftEntity> {

	@Select("select * from ds_invite_gift")
	public List<InviteGiftEntity> findAll();
}
