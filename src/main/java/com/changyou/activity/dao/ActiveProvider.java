package com.changyou.activity.dao;

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
	
}
