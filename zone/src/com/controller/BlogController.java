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
	
	

	@RequestMapping("/RankOfClicknum.do")
	public @ResponseBody List<Blog> rankOfClicknum(String type,String keyword,int page){
		Blog blog =new Blog();
		List<Blog> Bloglist=blogMapper.RankOfClicknum(blog);
		return Bloglist;
}                     
	@RequestMapping("/RankOfCollectnum.do")
	public @ResponseBody List<Blog> rankOfCollectnum(String type,String keyword,int page){
		Blog blog =new Blog();
		List<Blog> Bloglist=blogMapper.RankOfClollectnum(blog);
		return Bloglist;
}                     
	@RequestMapping("/RankOfCommentnum.do")
	public @ResponseBody List<Blog> rankOfCommentnum(String type,String keyword,int page){
		Blog blog =new Blog();
		List<Blog> Bloglist=blogMapper.RankOfCommentnum(blog);
		return Bloglist;
}                     
	@RequestMapping("/showBlogByAuthor.do")
	public @ResponseBody List<Blog> showBlogByAuthor(String Author,Model model){
		Blog Blog =new Blog();
		Blog.setAuthor(Author);
		List<Blog> Bloglist=blogMapper.getBlogByAuthor(Blog);
		
		return Bloglist;
}                     
	@RequestMapping("/showDetailBlog.do")
    public String showDetailBlog(int id,Model model){
		Blog Blog=new Blog();
		Blog.setId(id);
		Blog resultBlog=blogMapper.getBlogById(Blog);		
		//BlogMapper.updateBrowsenum(Blog);更新点击量。
		model.addAttribute("Blog", resultBlog);
		
		model.addAttribute("id", id);
		
		return "blog/Blog_detailBlog";
	}
}
