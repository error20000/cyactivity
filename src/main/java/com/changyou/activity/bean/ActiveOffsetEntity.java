package com.changyou.activity.bean;

import javax.persistence.Id;
import javax.persistence.Table;

import com.cyou.common.datasource.entity.SuperEntity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

@Data
@Table(name = "DS_ACTIVE_OFFSET")
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class ActiveOffsetEntity extends SuperEntity {
	
	@Id
	private long pid;
	private int num;
	private int time;
	private String app_code;
	private String activity_code;
	private String version_code;
}
