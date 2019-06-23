package com.changyou.activity.bean;

import javax.persistence.Table;

import com.cyou.common.datasource.entity.SuperEntity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

@Data
@Table(name = "T_GIFT_CODE")
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class GiftCodeEntity extends SuperEntity {
	
	private String code;
	private int status;
}
