package com.changyou.activity.dao;

import com.changyou.activity.bean.TestEntity;
import com.cyou.common.datasource.mapper.SuperMapper;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.SelectProvider;

import java.util.List;

@Mapper
public interface TestMapper extends SuperMapper<TestEntity> {
    @Insert("<script>" +
            "    insert into LOB_LEVEL_LOG (ID, ROLEID, ROLENAME, GROUPID, USERID, ROLELEVEL, CHANNEL, DAYTIME, LOGTIME)" +
            "    <foreach collection=\"list\" item=\"item\" index=\"index\" separator=\"union all\" >" +
            "      (select #{item.id}, #{item.roleid}, #{item.rolename}, #{item.groupid}, #{item.userid}, #{item.rolelevel}, #{item.channel}, #{item.daytime}, #{item.logtime} from dual)" +
            "    </foreach>" +
            "</script>")
    int batchInsert(@Param("list") List<TestEntity> datas);

    @SelectProvider(type = TestProvider.class, method = "test1")
    TestEntity testProvide(TestEntity attend);
}
