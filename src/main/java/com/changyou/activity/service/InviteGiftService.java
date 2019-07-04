package com.changyou.activity.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

import com.changyou.activity.bean.InviteGiftEntity;
import com.changyou.activity.dao.InviteGiftMapper;
import com.cyou.common.datasource.service.SuperService;

@Service
public class InviteGiftService extends SuperService<InviteGiftMapper, InviteGiftEntity> {
	
	public List<Map<String, Object>> findAll() {
		return baseMapper.findAll()
				.stream()
				.map(e -> { 
					Map<String, Object> node = new HashMap<>();
					node.put("pid", e.getPid());
					node.put("name", e.getName());
					node.put("num", e.getNum());
					node.put("icon", e.getIcon());
					return node;
				})
				.collect(Collectors.toList());
	}
	
	public List<InviteGiftEntity> findList() {
		return baseMapper.findAll();
	}
}
