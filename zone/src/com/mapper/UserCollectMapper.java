package com.mapper;



import com.po.UserCollect;



public interface UserCollectMapper {
	public  int insertUserCollect(UserCollect usercollect);
    public  int delectUserCollect(UserCollect usercollect);
    public  UserCollect checkCollect(UserCollect usercollect);
}
