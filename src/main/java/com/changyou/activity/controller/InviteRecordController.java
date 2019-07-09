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
import com.cyou.activity.common.EnumOpenType;
import com.cyou.activity.common.entity.CoreUserOpenEntity;
import com.cyou.activity.service.EncodeService;
import com.cyou.common.parent.bean.Result;

@RestController
@RequestMapping("/wb/{server}/invite/record")
public class InviteRecordController extends BaseController {
	
    @Autowired
    private InviteRecordService service;
    @Autowired
    private EncodeService encodeService;

    /**
     * 	查询邀请奖项列表
     * @return
     */
	@SuppressWarnings("unchecked")
	@PostMapping("/add")
	public Result<InviteRecordEntity> add(HttpServletRequest req) {
    	String plat = req.getParameter("plat");
    	String serverName = req.getParameter("serverName");
    	String roleName = req.getParameter("roleName");
    	String inviteGiftPid = req.getParameter("inviteGiftPid");
    	if(inviteGiftPid == null || "".equals(inviteGiftPid)
    			|| serverName == null || "".equals(serverName)
    	    	|| roleName == null || "".equals(roleName)
    	    	|| plat == null || "".equals(plat) ) {
    		return new Result<>().setCodeAndMessage(ResCode.ResCode20020);
    	}
    	if(!roleName.matches("[A-Z0-9]{8}[\\-][A-Z0-9]{8}")) {
    		return new Result<>().setCodeAndMessage(ResCode.ResCode20021);
    	}
		String phone = getPhone(req);
    	InviteRecordEntity obj = new InviteRecordEntity();
    	obj.setPhone(phone);
    	obj.setPlat(plat);
    	obj.setServerName(serverName);
    	obj.setRoleName(roleName);
    	obj.setInviteGiftPid(Long.parseLong(inviteGiftPid));
    	obj.setAppCode(getGame());
    	obj.setActivityCode(getActivity());
    	obj.setVersionCode(getVersion());
		return service.insert(obj);
	}
	
	private String getPhone(HttpServletRequest request) {
		CoreUserOpenEntity user = getUser(request, EnumOpenType.PHONE);
		return encodeService.decode(user.getOpenid());
    }
	
	
}
