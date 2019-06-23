package com.changyou.activity.bean;

import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;

import com.cyou.common.datasource.entity.SuperEntity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

@Data
@Table(name = "T_ACTIVE")
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class ActiveEntity extends SuperEntity {

	@Id
	private long pid;
	private String app_code;
	private String openid;
	private Date create_time;
	private String plat;
	private String phone;
	private String invite_code;
	private String used_code;
}
