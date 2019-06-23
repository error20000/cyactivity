package com.changyou.activity.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.SelectProvider;

import com.changyou.activity.bean.ActiveEntity;
import com.cyou.common.datasource.mapper.SuperMapper;

@Mapper
public interface ActiveMapper extends SuperMapper<ActiveEntity> {


	@SelectProvider(type = ActiveProvider.class, method = "findInviteNum")
	public int findInviteNum(String inviteCode);
	
	@SelectProvider(type = ActiveProvider.class, method = "count")
	public int count();
	
	@SelectProvider(type = ActiveProvider.class, method = "findInviteCodeByPhone")
	public ActiveEntity findInviteCodeByPhone(String phone);
	
	@SelectProvider(type = ActiveProvider.class, method = "findInviteCodeByOpenid")
	public ActiveEntity findInviteCodeByOpenid(String openid);
}
