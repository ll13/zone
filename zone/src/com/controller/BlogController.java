package com.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mapper.BlogMapper;
import com.po.Answer;
import com.po.Blog;

@Controller
public class BlogController {
	@Resource(name="blogMapper")
	BlogMapper blogMapper;
	
	
	@RequestMapping("/showBlog.do")
	public @ResponseBody List<Blog> showBlog(String type,String keyword,int page){
		Blog blog =new Blog();
		List<Blog> Bloglist=blogMapper.getBlogByAuthor(blog);

		
		
		return Bloglist;
}
	@RequestMapping("/showDetailBlog.do")
    public String showDetailBlog(int id,Model model){
		Blog Blog=new Blog();
		Blog.setId(id);
		
		Blog resultBlog=blogMapper.getBlogbyId(Blog);		
		//BlogMapper.updateBrowsenum(Blog);更新点击量。
		
		model.addAttribute("Blog", resultBlog);
		
		model.addAttribute("id", id);
		System.out.print("success");
		return "blog/Blog_detailBlog";
	}
}
