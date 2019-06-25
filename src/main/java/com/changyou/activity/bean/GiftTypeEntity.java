package com.changyou.activity.bean;

import javax.persistence.Id;
import javax.persistence.Table;

import com.cyou.common.datasource.entity.SuperEntity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

@Data
@Table(name = "DS_GIFT_TYPE")
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class GiftTypeEntity extends SuperEntity {
	
	@Id
	private long pid;
	private String name;
	private int num;
	private String app_code;
	private String activity_code;
	private String version_code;
}
