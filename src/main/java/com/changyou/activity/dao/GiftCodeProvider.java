package com.changyou.activity.dao;

public class GiftCodeProvider {
	
	
	public String unused() {
		StringBuilder sb = new StringBuilder();
		sb.append("select * from ds_gift_code where status = 0 and rownum <= 1");
		return sb.toString();
	}
	

	public String used(String code) {
		StringBuilder sb = new StringBuilder();
		sb.append("update ds_gift_code set status = 1 where code = #{code}");
		return sb.toString();
	}
	
}
