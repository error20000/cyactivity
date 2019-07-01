package com.changyou.activity.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.changyou.activity.bean.ActiveEntity;
import com.changyou.activity.service.ActiveService;
import com.changyou.activity.util.ResCode;
import com.cyou.activity.common.BaseController;
import com.cyou.common.parent.bean.Result;

@RestController
@RequestMapping("/wb/{server}/active")
public class ActiveController extends BaseController {
	
    @Autowired
    private ActiveService service;
    
    /**
     * 	参与活动
     * @return
     */
    @PostMapping("/add")
	public Result<ActiveEntity> add(HttpServletRequest req) {
    	//判断参数
    	String vcode = req.getParameter("vcode");
    	String plat = req.getParameter("plat");
    	String phone = req.getParameter("phone");
    	String used_code = req.getParameter("used_code");
    	if(vcode == null || "".equals(vcode)
    			|| plat == null || "".equals(plat)
    			|| phone == null || "".equals(phone) ) {
    		return new Result<>().setCodeAndMessage(ResCode.ResCode20020);
    	}
    	//保存
    	ActiveEntity obj = new ActiveEntity();
    	obj.setApp_code("");
    	obj.setPlat(plat);
    	obj.setPhone(phone);
    	obj.setUsed_code(used_code);
    	
		return service.insert(obj, vcode);
	}
    
    /**
     * 	获取预约人数
     * @return
     */
    @GetMapping("/num")
	public Result<ActiveEntity> findNum() {
		int res = service.findNum();
		return new Result<>().setCodeAndMessage(ResCode.ResCode20000).setData(res);
	}

    /**
     * 	获取邀请的人数
     * @param inviteCode
     * @return
     */
    @PostMapping("/invite/num/{inviteCode}")
	public Result<ActiveEntity> findInviteNum(@PathVariable("inviteCode") String inviteCode) {
		int res = service.findInviteNum(inviteCode);
		return new Result<>().setCodeAndMessage(ResCode.ResCode20000).setData(res);
	}

	/**
	 * 	通过手机号查询预约信息
	 * @param phone
	 * @return
	 */
	@PostMapping("/phone/{phone}")
	public Result<ActiveEntity> findInviteCodeByPhone(@PathVariable("phone") String phone) {
		ActiveEntity res = service.findInviteCodeByPhone(phone);
		return new Result<>().setCodeAndMessage(ResCode.ResCode20000).setData(res);
	}

	/**
	 * 	通过openid查询预约信息
	 * @param openid
	 * @return
	 */
	@PostMapping("/openid/{openid}")
	public Result<ActiveEntity> findInviteCodeByOpenid(@PathVariable("openid") String openid) {
		ActiveEntity res = service.findInviteCodeByOpenid(openid);
		return new Result<>().setCodeAndMessage(ResCode.ResCode20000).setData(res);
	}

}
