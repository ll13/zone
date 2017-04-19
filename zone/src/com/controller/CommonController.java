package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/common/")
public class CommonController {
	
	
	@RequestMapping("top.do")
	public String top(){
		
		
		 return "top";
	}
	
	@RequestMapping("bottom.do")
	public String bottom(){
		 return "bottom";
	}
	
	

}
