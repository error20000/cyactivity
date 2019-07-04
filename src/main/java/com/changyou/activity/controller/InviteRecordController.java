package com.changyou.activity.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.changyou.activity.bean.InviteRecordEntity;
import com.changyou.activity.service.InviteRecordService;
import com.changyou.activity.util.ResCode;
import com.cyou.activity.common.BaseController;
import com.cyou.common.parent.bean.Result;

@RestController
@RequestMapping("/wb/{server}/invite/record")
public class InviteRecordController extends BaseController {
	
    @Autowired
    private InviteRecordService service;

    /**
     * 	查询邀请奖项列表
     * @return
     */
	@SuppressWarnings("unchecked")
	@PostMapping("/add")
	public Result<InviteRecordEntity> add(HttpServletRequest req) {
    	//判断参数
    	String phone = req.getParameter("phone");
    	String plat = req.getParameter("plat");
    	String serverName = req.getParameter("serverName");
    	String inviteGiftPid = req.getParameter("inviteGiftPid");
    	if(inviteGiftPid == null || "".equals(inviteGiftPid)
    			|| phone == null || "".equals(phone) ) {
    		return new Result<>().setCodeAndMessage(ResCode.ResCode20020);
    	}
    	InviteRecordEntity obj = new InviteRecordEntity();
    	obj.setPhone(phone);
    	obj.setPlat(plat);
    	obj.setServerName(serverName);
    	obj.setInviteGiftPid(Long.parseLong(inviteGiftPid));
    	obj.setAppCode(getGame());
    	obj.setActivityCode(getActivity());
    	obj.setVersionCode(getVersion());
		return service.insert(obj);
	}
}
