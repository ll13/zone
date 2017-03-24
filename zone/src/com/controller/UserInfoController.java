package com.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mapper.UserInfoMapper;
import com.po.UserInfo;

@Controller
@RequestMapping("/userinfo/")
public class UserInfoController {
    
	
	@Resource(name="userInfoMapper")
	private UserInfoMapper userInfoMapper;
	
	@RequestMapping("login.do")
	public String login(String username,String password,Model model){
		
		UserInfo user=new UserInfo();
		user.setUserName(username);
		user.setPwd(password);
		UserInfo u = userInfoMapper.getUserByNameAndPwd(user);
		if(u!=null)	
		{
		    
			int totalRow=userInfoMapper.getCount();
			
			user.setCurrentPage(1);
			user.setTotalRow(totalRow);
			
			List<UserInfo> list = userInfoMapper.getUserByPage(user);
			model.addAttribute("alluser", list);
			model.addAttribute("currentPage",user.getCurrentPage());
			model.addAttribute("totalPage", user.getTotalPage());
			model.addAttribute("url", "userinfo/page.do");
			return "index2";
		}
		else
		{
			model.addAttribute("msg", "用户名或密码错误");
			return "login";
		}
	}
	
	
	@RequestMapping("register.do")
	public String register(String username,String password,String email,String phone)
	{
		
		UserInfo user=new UserInfo();
		user.setUserName(username);
		user.setPwd(password);
		user.setEmail(email);
		user.setPhone(phone);
		
		userInfoMapper.addUser(user);
		
		return "login";
	}
	
	
	@RequestMapping("page.do")
	public String page(UserInfo user,Model model)
	{
		
		int totalRow=userInfoMapper.getCount();
		
		user.setTotalRow(totalRow);
		
		List<UserInfo> list = userInfoMapper.getUserByPage(user);
		model.addAttribute("alluser", list);
		model.addAttribute("currentPage",user.getCurrentPage());
		model.addAttribute("totalPage", user.getTotalPage());
		model.addAttribute("url", "userinfo/page.do");
		return "index2";
	}
	
	
}
