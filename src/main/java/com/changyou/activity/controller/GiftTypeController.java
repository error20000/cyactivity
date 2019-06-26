package com.changyou.activity.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.changyou.activity.bean.GiftTypeEntity;
import com.changyou.activity.service.GiftTypeService;
import com.changyou.activity.util.ResCode;
import com.cyou.activity.common.BaseController;
import com.cyou.common.parent.bean.Result;

@RestController
@RequestMapping("/wb/{server}/gift/type")
public class GiftTypeController extends BaseController {
	
    @Autowired
    private GiftTypeService service;


    /**
     * 查询预约奖项
     * @return
     */
    @GetMapping("/all")
    public Result<GiftTypeEntity> findAll(){
    	List<GiftTypeEntity> res = service.findAll();
        return new Result<>().setCodeAndMessage(ResCode.ResCode20000).setData(res);
    }
}
