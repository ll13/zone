package com.mapper;

import java.util.List;

import com.po.PointRecord;
import com.po.User;

public interface PointRecordMapper {
	public List<PointRecord> getPointRecordList(User user);
	public boolean addPointRecord(User user,int change,String reason);
}
