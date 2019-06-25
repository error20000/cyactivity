package com.changyou.activity.service;

import java.time.LocalTime;
import java.util.Date;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.changyou.activity.bean.ActiveEntity;
import com.changyou.activity.bean.ActiveOffsetEntity;
import com.changyou.activity.bean.GiftCodeEntity;
import com.changyou.activity.dao.ActiveMapper;
import com.changyou.activity.dao.ActiveOffsetMapper;
import com.changyou.activity.dao.GiftCodeMapper;
import com.changyou.activity.util.RedisKey;
import com.changyou.activity.util.ResCode;
import com.changyou.activity.util.SnowflakeIdWorker;
import com.cyou.activity.common.Redis;
import com.cyou.activity.service.EncodeService;
import com.cyou.activity.service.PtService;
import com.cyou.activity.util.CheckPhone;
import com.cyou.common.datasource.service.SuperService;
import com.cyou.common.parent.bean.Result;

@Service
public class ActiveService extends SuperService<ActiveMapper, ActiveEntity> {
	
    @Autowired
    private Redis redis;
    @Autowired
    private RedisKey redisKey;
    @Autowired
    private EncodeService encodeService;
    @Autowired
    private PtService ptService;
    @Autowired
    private GiftCodeMapper gcMapper;
    @Autowired
    private ActiveOffsetMapper aoMapper;

    private static Byte lock = 'a';
	
	public Result insert(ActiveEntity obj, String vcode) {
		//判断手机号
		boolean isPhone = CheckPhone.isChinaPhone(obj.getPhone());
		if(!isPhone) {
			return new Result<>().setCodeAndMessage(ResCode.ResCode20010);
		}
		//判断手机号是否已预约
		ActiveEntity test = findInviteCodeByPhone(obj.getPhone());
		if(test != null) {
			return new Result<>().setCodeAndMessage(ResCode.ResCode20011);
		}
		//判断手机号验证码
		String data = ptService.checkUserSendCodeService(obj.getPhone(), vcode).getData();
		if(!"0".equals(data)) {
			return new Result<>().setCodeAndMessage(ResCode.ResCode20014);
		}
		//获取邀请码
		GiftCodeEntity giftCode = null;
		synchronized (lock) {
			giftCode = gcMapper.unused();
			if(giftCode == null) {
				return new Result<>().setCodeAndMessage(ResCode.ResCode20012);
			}
			int gres = gcMapper.used(giftCode.getCode());
			if(gres == 0) {
				return new Result<>().setCodeAndMessage(ResCode.ResCode20013);
			}
		}
		//保存
		obj.setPid(SnowflakeIdWorker.generateId());
		obj.setCreate_time(new Date());
		obj.setInvite_code(giftCode.getCode());
		obj.setPhone(encodeService.encode(obj.getPhone())); //加密手机号
		int res = baseMapper.insert(obj);
		if(res == 0) {
			return new Result<>().setCodeAndMessage(ResCode.ResCode20002);
		}else {
			return new Result<>().setCodeAndMessage(ResCode.ResCode20000);
		}
	}
	

	public ActiveEntity findInviteCodeByPhone(String phone) {
		ActiveEntity res = baseMapper.findInviteCodeByPhone(phone);
		String str = encodeService.decode(res.getPhone()); //解密手机号
		res.setPhone(encodeService.getDisplay(str)); //隐藏号码
		return res;
	}

	public ActiveEntity findInviteCodeByOpenid(String openid) {
		ActiveEntity res = baseMapper.findInviteCodeByOpenid(openid);
		String str = encodeService.decode(res.getPhone()); //解密手机号
		res.setPhone(encodeService.getDisplay(str)); //隐藏号码
		return res;
	}

	public int findInviteNum(String inviteCode) {
		return baseMapper.findInviteNum(inviteCode);
	}
	
	public int findNum() {
		
		int offset = (int) redis.get(redisKey.activeOffsetNum);
		int time = (int) redis.get(redisKey.activeOffsetTime);
		
		ActiveOffsetEntity acObj = null;
		if(offset == 0 && time == 0) {
			acObj = aoMapper.find();
		}
		if(LocalTime.now().getHour() + 1 > time) {
			if(acObj == null){
				acObj = aoMapper.find();
			}
			offset = acObj.getNum();
			time = acObj.getTime();
			
			redis.set(redisKey.activeOffsetNum, offset, 1, TimeUnit.DAYS);
			redis.set(redisKey.activeOffsetTime, time, 1, TimeUnit.DAYS);
		}
		
		return baseMapper.count() + offset;
	}
	
}
