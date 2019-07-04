package com.changyou.activity.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.changyou.activity.bean.ActiveEntity;
import com.changyou.activity.bean.GiftCodeEntity;
import com.changyou.activity.bean.InviteConfigEntity;
import com.changyou.activity.bean.InviteGiftEntity;
import com.changyou.activity.bean.InviteRecordEntity;
import com.changyou.activity.dao.InviteRecordMapper;
import com.changyou.activity.util.ResCode;
import com.changyou.activity.util.SnowflakeIdWorker;
import com.cyou.activity.util.CheckPhone;
import com.cyou.common.datasource.service.SuperService;
import com.cyou.common.parent.bean.Result;

@Service
public class InviteRecordService extends SuperService<InviteRecordMapper, InviteRecordEntity> {

    @Autowired
    private ActiveService activeService;
    @Autowired
    private InviteConfigService configService;
    @Autowired
    private InviteGiftService giftService;

	
	@SuppressWarnings("rawtypes")
	public Result insert(InviteRecordEntity obj) {
		//判断手机号
		boolean isPhone = CheckPhone.isChinaPhone(obj.getPhone());
		if(!isPhone) {
			return new Result<>().setCodeAndMessage(ResCode.ResCode20010);
		}
		//判断领取时间
		InviteConfigEntity config = configService.findOne();
		long curTime = System.currentTimeMillis();
		if(config.getStartTime().getTime() > curTime) {
			return new Result<>().setCodeAndMessage(ResCode.ResCode20015);
		}else if(config.getEndTime().getTime() < curTime) {
			return new Result<>().setCodeAndMessage(ResCode.ResCode20016);
		}
		//判断邀请人数
		int inviteNum = activeService.findInviteNum(obj.getPhone());
		List<InviteGiftEntity> giftList = giftService.findList();
		InviteGiftEntity gift = null;
		for (InviteGiftEntity inviteGiftEntity : giftList) {
			if(inviteGiftEntity.getPid() == obj.getInviteGiftPid()) {
				gift = inviteGiftEntity;
				break;
			}
		}
		if(gift == null) {
			return new Result<>().setCodeAndMessage(ResCode.ResCode20017);
		}
		if(inviteNum < gift.getNum()) {
			return new Result<>().setCodeAndMessage(ResCode.ResCode20018);
		}
		//判断是否已领取
		InviteRecordEntity record = baseMapper.hasRecord(obj.getPhone(), obj.getInviteGiftPid());
		if(record != null) {
			return new Result<>().setCodeAndMessage(ResCode.ResCode20019);
		}
		//保存
		obj.setPid(SnowflakeIdWorker.generateId());
		obj.setCreateTime(new Date());
		int res = baseMapper.insert(obj);
		if(res == 0) {
			return new Result<>().setCodeAndMessage(ResCode.ResCode20002);
		}else {
			return new Result<>().setCodeAndMessage(ResCode.ResCode20000);
		}
	}
	

	public List<InviteRecordEntity> findAll() {
		return baseMapper.findAll();
	}
}
