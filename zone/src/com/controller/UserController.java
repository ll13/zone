package com.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mapper.UserMapper;
import com.po.User;


@Controller
public class UserController {
	
	@Resource(name="userMapper")
	UserMapper userMapper;
	
	@RequestMapping("/register.do")
	public @ResponseBody String register(User user)
	{
		int count = userMapper.insertUser(user);
		
		
		
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(count>0)
		{
			return "1";
		}
		
		return "0";
	}
	
	@RequestMapping("/checkUser.do")
	public @ResponseBody boolean checkUser(String name)
	{
		  User u=new User();
		  u.setName(name);
		  User userForDB = userMapper.getUserByName(u);
		  if(userForDB!=null)
		  {
			  return false;
		  }
		  else
		  {
			return true;
		  }
	}
	
	@RequestMapping("/login.do")
	public @ResponseBody String login(User user)
	{
		
		
		User u = userMapper.getUserByNameAndPass(user);
		
		if(u!=null)
		{
			return "1";
		}
		else
		{
			return "0";
		}
	}

}
