package com.service;

import java.util.List;

import com.po.PointRecord;
import com.po.User;

public interface PointService {
	public int getPoint(User user);
	
	public List<PointRecord> getPointRecordList(User user);
	
	public boolean changePoint(User user,int change,String reason);
	public boolean addPoint(String  username,int changePoint,String reason);
	public boolean reducePoint(String username,int changePoint,String reason);
}
