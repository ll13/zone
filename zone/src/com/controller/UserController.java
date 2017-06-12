package com.controller;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mapper.MessageMapper;
import com.mapper.UserCollectMapper;
import com.mapper.UserMapper;
import com.po.User;


@Controller
public class UserController {
	
	@Resource(name="userMapper")
	UserMapper userMapper;
	@Resource(name="userCollectMapper")
	UserCollectMapper userCollectMapper;
	@Resource(name="messageMapper")
	MessageMapper messageMapper;
	
	@RequestMapping("/register.do")
	public @ResponseBody String register(User user)
	{
		int count = userMapper.insertUser(user);				
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
	
	@RequestMapping("/showinformation.do")
	public @ResponseBody String showinformation(String username,Model model){
		User user=new User();
		user.setName(username);
		User userForDB=userMapper.getUserByName(user);
		model.addAttribute("userinformation", userForDB);
		return "1";
	}
	
	@RequestMapping("/showMyCollectUser.do")
	public @ResponseBody String showMyCollectUser(String username,Model model){
		User user=new User();
		user.setName(username);
		List <User> listForDB=userMapper.getMyCollectUser(user);
		model.addAttribute("userinformation", listForDB);
		return "1";
	}
	
	@RequestMapping("/showCollectme.do")
	public @ResponseBody String showCollectme(String username,Model model){
		User user=new User();
		user.setName(username);
		List<User> listForDB=userMapper.getCollectme(user);
		model.addAttribute("userinformation", listForDB);
		return "1";
	}
	
	@RequestMapping("/updateUserInformation.do")
	public @ResponseBody String updateUserInformation(User user){		
		int  result=userMapper.updateUser(user);
		
		return result+"";
	}
	
	@RequestMapping("/updateUserPassword.do")
	public @ResponseBody String updateUserPassword(String oldpass,String newpass ,String username){
		User user=new User();
		user.setName(username);
		user.setPass(oldpass);
		User check=userMapper.getUserByNameAndPass(user);
		if(check!=null){
			User newUser=new User();
			newUser.setName(username);
			newUser.setPass(newpass);
			userMapper.updatePass(newUser);
			return "1";
			
		}
		return "0";
	}

}
