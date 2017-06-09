package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mapper.PointRecordMapper;
import com.mapper.UserMapper;
import com.po.PointRecord;
import com.po.User;
import com.service.PointService;

@Service
public class PointServiceImpl implements PointService {
	@Resource(name = "userMapper")
	UserMapper userMapper;
	@Resource(name = "pointRecordMapper")
	PointRecordMapper pointRecordMapper;

	@Override
	public int getPoint(User user) {
		return user.getPoint();
	}

	@Override
	public List<PointRecord> getPointRecordList(User user) {
		return pointRecordMapper.getPointRecordList(user);
	}

	@Override
	public boolean changePoint(User user, int change, String reason) {
		if (getPoint(user) + change >= 0) {
			user.setPoint(getPoint(user) + change);
			userMapper.updatePoint(user);
			pointRecordMapper.addPointRecord(user, change, reason);
			return true;
		} else {
			return false;
		}
	}
	
	@Override
	public boolean addPoint(String username, int changePoint, String reason) {
		   User userbyName=new User();
		   userbyName.setName(username);
		   User user=userMapper.getUserByName(userbyName);
		   int userpoint=user.getPoint();
		   user.setPoint(userpoint + changePoint);
		   userMapper.updatePoint(user);
		  // pointRecordMapper.addPointRecord(user, changePoint, reason);
		   return true;
		
	}
	
	@Override
	public boolean reducePoint(String username, int changePoint, String reason) {
		User userbyName=new User();
		userbyName.setName(username);
		User user=userMapper.getUserByName(userbyName);
		int userpoint=user.getPoint();
		if (userpoint - changePoint >= 0) {
			user.setPoint(userpoint - changePoint);
			userMapper.updatePoint(user);
			//pointRecordMapper.addPointRecord(user, changePoint, reason);
			return true;
		} else {
			return false;
		}
	}
	
	
}
