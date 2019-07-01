package com.changyou.activity.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.changyou.activity.bean.InviteGiftEntity;
import com.changyou.activity.service.InviteGiftService;
import com.changyou.activity.util.ResCode;
import com.cyou.activity.common.BaseController;
import com.cyou.common.parent.bean.Result;

@RestController
@RequestMapping("/wb/{server}/invite/gift")
public class InviteGiftController extends BaseController {
	
    @Autowired
    private InviteGiftService service;


    /**
     * 	查询邀请奖项列表
     * @return
     */
	@GetMapping("/all")
	public Result<InviteGiftEntity> findAll() {
		List<Map<String, Object>> res = service.findAll();
		return new Result<>().setCodeAndMessage(ResCode.ResCode20000).setData(res);
	}
}
