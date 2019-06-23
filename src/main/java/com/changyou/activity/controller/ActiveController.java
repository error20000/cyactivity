package com.changyou.activity.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.changyou.activity.bean.ActiveEntity;
import com.changyou.activity.service.ActiveService;
import com.changyou.activity.util.ResCode;
import com.cyou.activity.common.BaseController;
import com.cyou.common.parent.bean.Result;

@RestController
@RequestMapping("/wb/tpl0612/active")
public class ActiveController extends BaseController {
	
    @Autowired
    private ActiveService service;
    
    /**
     * 获取预约人数
     * @return
     */
    @GetMapping("/num")
	public Result<ActiveEntity> findNum() {
		int res = service.findNum();
		return new Result<>().setCodeAndMessage(ResCode.ResCode20000).setData(res);
	}

    /**
     * 获取邀请的人数
     * @param inviteCode
     * @return
     */
	@GetMapping("/invite/num/{inviteCode}")
	public Result<ActiveEntity> findInviteNum(@PathVariable("inviteCode") String inviteCode) {
		int res = service.findInviteNum(inviteCode);
		return new Result<>().setCodeAndMessage(ResCode.ResCode20000).setData(res);
	}

	/**
	 * 通过手机号查询预约信息
	 * @param phone
	 * @return
	 */
	@GetMapping("/phone/{phone}")
	public Result<ActiveEntity> findInviteCodeByPhone(@PathVariable("phone") String phone) {
		ActiveEntity res = service.findInviteCodeByPhone(phone);
		return new Result<>().setCodeAndMessage(ResCode.ResCode20000).setData(res);
	}

	/**
	 * 通过openid查询预约信息
	 * @param openid
	 * @return
	 */
	@GetMapping("/openid/{openid}")
	public Result<ActiveEntity> findInviteCodeByOpenid(@PathVariable("openid") String openid) {
		ActiveEntity res = service.findInviteCodeByOpenid(openid);
		return new Result<>().setCodeAndMessage(ResCode.ResCode20000).setData(res);
	}

}