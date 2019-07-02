package com.changyou.activity.bean;

import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;

import com.cyou.common.datasource.entity.SuperEntity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

@Data
@Table(name = "DS_ACTIVE")
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class ActiveEntity extends SuperEntity {

	@Id
	private long pid;
	private String appCode;
	private String openid;
	private Date createTime;
	private String plat;
	private String phone;
	private String inviteCode;
	private String usedCode;
	private String activityCode;
	private String versionCode;
}
