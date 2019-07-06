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
import com.changyou.activity.util.Utils;
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
	
	@SuppressWarnings("rawtypes")
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
		//判断手机号验证码 -- 预约前已登录，所以不用判断vcode
		/*String data = ptService.checkUserSendCodeService(obj.getPhone(), vcode).getData();
		if(!"0".equals(data)) {
			return new Result<>().setCodeAndMessage(ResCode.ResCode20014);
		}*/
		//获取邀请码
		//GiftCodeEntity giftCode = null;
		String code = "";
		synchronized (lock) {
			/*giftCode = gcMapper.unused();
			if(giftCode == null) {
				return new Result<>().setCodeAndMessage(ResCode.ResCode20012);
			}
			int gres = gcMapper.used(giftCode.getCode());
			if(gres == 0) {
				return new Result<>().setCodeAndMessage(ResCode.ResCode20013);
			}*/
			//随机生成
			code = getCode();
		}
		//保存
		obj.setPid(SnowflakeIdWorker.generateId());
		obj.setCreateTime(new Date());
		obj.setInviteCode(code);
		int res = baseMapper.insert(obj);
		if(res == 0) {
			return new Result<>().setCodeAndMessage(ResCode.ResCode20002);
		}else {
			return new Result<>().setCodeAndMessage(ResCode.ResCode20000);
		}
	}
	

	public ActiveEntity findInviteCodeByPhone(String phone) {
		ActiveEntity res = baseMapper.findInviteCodeByPhone(phone);
		if(res != null) {
			res.setPhone(encodeService.getDisplay(res.getPhone())); //隐藏号码
		}
		return res;
	}

	public ActiveEntity findInviteCodeByOpenid(String openid) {
		ActiveEntity res = baseMapper.findInviteCodeByOpenid(openid);
		if(res != null) {
			res.setPhone(encodeService.getDisplay(res.getPhone())); //隐藏号码
		}
		return res;
	}

	public int findInviteNum(String phone) {
		ActiveEntity obj = findInviteCodeByPhone(phone);
		if(obj == null) {
			return 0;
		}
		return baseMapper.findInviteNum(obj.getInviteCode());
	}
	
	public int findNum() {
		
		Integer offset = (Integer) redis.get(redisKey.activeOffsetNum);
		Integer time = (Integer) redis.get(redisKey.activeOffsetTime);
		
		offset = offset == null ? 0 : offset;
		time = time == null ? 0 : time;
		
		ActiveOffsetEntity acObj = null;
		if(offset == 0 && time == 0) {
			acObj = aoMapper.find();
		}
		if(LocalTime.now().getHour() + 1 > time) {
			if(acObj == null){
				acObj = aoMapper.find();
			}
			if(acObj == null) {
				acObj = new ActiveOffsetEntity();
			}
			offset = acObj.getNum();
			time = acObj.getTime();
			
			redis.set(redisKey.activeOffsetNum, offset, 1, TimeUnit.DAYS);
			redis.set(redisKey.activeOffsetTime, time, 1, TimeUnit.DAYS);
		}
		
		return baseMapper.count() + offset;
	}
	
	
	private String getCode() {
		String code = Utils.createVCode(6, "", false, "a");
		ActiveEntity aobj = baseMapper.isUsedCode(code);
		if(aobj == null) {
			return code;
		}else {
			return getCode();
		}
	}
}
