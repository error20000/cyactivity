package com.changyou.activity.bean;

import com.cyou.common.datasource.entity.SuperEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Data
@Table(name = "LOB_LEVEL_LOG")
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class TestEntity extends SuperEntity{
  @Id
  private long id;
  private String roleid;
  private String rolename;
  private String groupid;
  private String userid;
  private int rolelevel;
  private String channel;
  private String daytime;
  private Date logtime;
}
