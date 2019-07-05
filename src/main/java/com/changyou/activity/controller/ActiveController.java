package com.changyou.activity.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.changyou.activity.bean.ActiveEntity;
import com.changyou.activity.service.ActiveService;
import com.changyou.activity.util.ResCode;
import com.cyou.activity.common.BaseController;
import com.cyou.activity.common.EnumOpenType;
import com.cyou.activity.common.entity.CoreUserOpenEntity;
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
    @SuppressWarnings("unchecked")
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
    	obj.setPlat(plat);
    	obj.setPhone(phone);
    	obj.setUsedCode(used_code);
    	obj.setActivityCode(getActivity());
    	obj.setVersionCode(getVersion());
    	obj.setAppCode(getGame());
    	obj.setOpenid(phone);
		return service.insert(obj, vcode);
	}
    
    /**
     * 	获取预约人数
     * @return
     */
    @SuppressWarnings("unchecked")
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
    @SuppressWarnings("unchecked")
    @PostMapping("/invite/num")
	public Result<ActiveEntity> findInviteNum(HttpServletRequest request) {
		String phone = getPhone(request);
		int res = service.findInviteNum(phone);
		return new Result<>().setCodeAndMessage(ResCode.ResCode20000).setData(res);
	}


	/**
	 * 	查询预约信息
	 * @param openid
	 * @return
	 */
    @SuppressWarnings("unchecked")
	@PostMapping("/info")
	public Result<ActiveEntity> info(HttpServletRequest request) {
		String phone = getPhone(request);
		ActiveEntity res = service.findInviteCodeByPhone(phone);
		return new Result<>().setCodeAndMessage(ResCode.ResCode20000).setData(res);
	}
    
    private String getPhone(HttpServletRequest request) {
		CoreUserOpenEntity user = getUser(request, EnumOpenType.PHONE);
		return user.getOpenid();
    }
}
