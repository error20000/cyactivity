package com.changyou.activity.controller;

import com.changyou.activity.bean.TestEntity;
import com.changyou.activity.service.TestService;
import com.cyou.activity.common.BaseController;
import com.cyou.activity.common.CheckLoginParam;
import com.cyou.common.parent.bean.Result;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/wb/{server}")
public class TestController extends BaseController {
    @Autowired
    private TestService testService;

    /**
     * 测试自定义sql脚本
     * @param id
     * @param num
     * @return
     */
    @PostMapping("/test/{minLevelLogId}/{num}")
    public Result<Integer> insertLevelLog(@PathVariable("minLevelLogId") long id, @PathVariable("num") int num){
        testService.batchAdd(id, num);
        return new Result<>();
    }

    /**
     * 测试基本用法
     * @return
     */
    @GetMapping("/test1")
    public Result<TestEntity> query1(){
        TestEntity testEntity = testService.query1();
        return new Result<>().setData(testEntity);
    }
    /**
     * 测试java拼装sql
     * @return
     */
    @GetMapping("/test2")
    public Result<TestEntity> query2(){
        TestEntity testEntity = testService.query2();
        return new Result<>().setData(testEntity);
    }

    /**
     * 测试redis
     * @return
     */
    @GetMapping("/test3")
    public Result<Integer> query3(){
        return new Result<>().setData(testService.query3());
    }

    /**
     * 测试登录验证
     * @return
     */
    @PostMapping("/test4")
    public Result<Integer> update1(HttpServletRequest request){
        return new Result<>();
    }
    /**
     * 测试get登录验证
     * @return
     */
    @CheckLoginParam
    @PostMapping("/test5")
    public Result<Integer> get1(){
        return new Result<>();
    }
}
