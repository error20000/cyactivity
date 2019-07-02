package com.changyou.activity.dao;

import com.changyou.activity.bean.ActiveEntity;

public class ActiveProvider {
	
	
	
	public String findInviteNum(String inviteCode) {
		StringBuilder sb = new StringBuilder();
		sb.append("select count(*) from ds_active where used_code = #{inviteCode}");
		return sb.toString();
	}
	
	public String count() {
		StringBuilder sb = new StringBuilder();
		sb.append("select count(*) from ds_active ");
		return sb.toString();
	}
	
	public String findInviteCodeByPhone(String phone) {
		StringBuilder sb = new StringBuilder();
		sb.append("select * from ds_active where phone = #{phone}");
		return sb.toString();
	}
	
	public String findInviteCodeByOpenid(String openid) {
		StringBuilder sb = new StringBuilder();
		sb.append("select * from ds_active where openid = #{openid}");
		return sb.toString();
	}
	
	public String insert(ActiveEntity obj) {
		StringBuilder sb = new StringBuilder();
		sb.append("insert into ds_active(pid, app_code, openid, create_time, plat, phone, invite_code, used_code, activity_code, version_code) ");
		sb.append(" values(#{obj.pid}, #{obj.appCode}, #{obj.openid}, #{obj.createTime}, #{obj.plat}, #{obj.phone}, #{obj.inviteCode}, #{obj.usedCode}, #{obj.activityCode}, #{obj.versionCode}) ");
		return sb.toString();
	}
}
