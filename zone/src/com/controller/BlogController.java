package com.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mapper.BlogMapper;
import com.mapper.QuestionMapper;
import com.po.Blog;
import com.po.Question;


@Controller
public class BlogController {
	@Resource(name="blogMapper")
	BlogMapper blogMapper;
	
	
	@RequestMapping("/showBlog.do")
	public @ResponseBody List<Blog> showQuestion(String type,int page){
		//Question question=new Question();
		List<Blog> Bloglist=blogMapper.getBlogByAuthor();
		
		
		return Bloglist;
}
	
}
