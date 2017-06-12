package com.mapper;

import java.util.List;

import com.po.User;

public interface UserMapper {
	public User getUserByName(User user);
	public int insertUser(User user);
	public User getUserByNameAndPass(User user);
	public User getUserById(User user);
	public boolean updatePoint(User user);
	public List<User> getMyCollectUser(User user);
	public List<User> getCollectme(User user);
	public int updateUser(User user);
	public int updatePass(User user);

}
