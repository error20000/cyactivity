package com.changyou.activity.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.changyou.activity.bean.GiftItemEntity;
import com.changyou.activity.service.GiftItemService;
import com.changyou.activity.util.ResCode;
import com.cyou.activity.common.BaseController;
import com.cyou.common.parent.bean.Result;

@RestController
@RequestMapping("/wb/tpl0612/gift/item")
public class GiftItemController extends BaseController {
	
    @Autowired
    private GiftItemService service;


    /**
     * 查询预约奖项的物品列表
     * @return
     */
	@GetMapping("/all")
	public Result<GiftItemEntity> findAll() {
		List<GiftItemEntity> res = service.findAll();
		return new Result<>().setCodeAndMessage(ResCode.ResCode20000).setData(res);
	}
}
