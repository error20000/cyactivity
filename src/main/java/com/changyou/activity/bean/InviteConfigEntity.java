package com.changyou.activity.bean;

import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;

import com.cyou.common.datasource.entity.SuperEntity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

@Data
@Table(name = "DS_INVITE_CONFIG")
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class InviteConfigEntity extends SuperEntity {

	@Id
	private long pid;
	private Date startTime;
	private Date endTime;
	private String appCode;
	private String activityCode;
	private String versionCode;
}
