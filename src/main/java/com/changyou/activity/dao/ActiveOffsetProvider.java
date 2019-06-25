package com.changyou.activity.dao;

import com.changyou.activity.bean.ActiveOffsetEntity;

public class ActiveOffsetProvider {
	
	
	public String update(ActiveOffsetEntity obj) {
		StringBuilder sb = new StringBuilder();
		sb.append("update ds_active_offset set num = #{num}, time = #{time} where pid = #{pid}");
		return sb.toString();
	}
	
	public String find() {
		StringBuilder sb = new StringBuilder();
		sb.append("select * from ds_active_offset");
		return sb.toString();
	}
}
