package com.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mapper.UserInfoMapper;
import com.po.UserInfo;






@Controller
@RequestMapping("/aa/")
public class Test {
	
	@Resource(name="userInfoMapper")
	private UserInfoMapper userInfoMapper;
	
	@RequestMapping("test.do")
	public String mytest(Model model){
		
		
		
		List<UserInfo>   list = userInfoMapper.getAllUser();
		System.out.println(list);
		
		model.addAttribute("alluser", list);
		
		return "index";
	}

}
