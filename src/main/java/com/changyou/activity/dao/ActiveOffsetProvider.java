package com.changyou.activity.dao;

import com.changyou.activity.bean.ActiveOffsetEntity;

public class ActiveOffsetProvider {
	
	
	public String update(ActiveOffsetEntity obj) {
		StringBuilder sb = new StringBuilder();
		sb.append("update t_active_offset set num = #{num}, time = #{time} where pid = #{pid}");
		return sb.toString();
	}
	
	public String find() {
		StringBuilder sb = new StringBuilder();
		sb.append("select * from t_active_offset");
		return sb.toString();
	}
}
