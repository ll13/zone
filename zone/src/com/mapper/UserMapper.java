package com.mapper;

import com.po.User;

public interface UserMapper {
	public User getUserByName(User user);
	public int insertUser(User user);
	public User getUserByNameAndPass(User user);
	public User getUserById(User user);
	public boolean updatePoint(User user);

}
