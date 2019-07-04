package com.changyou.activity.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.changyou.activity.bean.InviteRecordEntity;
import com.cyou.common.datasource.mapper.SuperMapper;

@Mapper
public interface InviteRecordMapper extends SuperMapper<InviteRecordEntity> {

	@Select("select * from ds_invite_record")
	public List<InviteRecordEntity> findAll();
	
	@Select("select * from ds_invite_record where phone = #{phone} and invite_gift_pid=#{inviteGiftPid}")
	public InviteRecordEntity hasRecord(String phone, long inviteGiftPid);
	
	@Insert("insert into ds_invite_record(pid, phone, create_time, invite_gift_pid, app_code, activity_code, version_code) " +
            "  values(#{pid}, #{createTime}, #{phone}, #{inviteGiftPid}, #{appCode}, #{activityCode}, #{versionCode}) ")
	public int insert(InviteRecordEntity obj);
	
}
