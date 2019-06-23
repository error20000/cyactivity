package com.changyou.activity.bean;

import javax.persistence.Id;
import javax.persistence.Table;

import com.cyou.common.datasource.entity.SuperEntity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

@Data
@Table(name = "T_INVITE_GIFT")
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class InviteGiftEntity extends SuperEntity {

	@Id
	private long pid;
	private String name;
	private int num;
	private String code;
	private String icon;
}
