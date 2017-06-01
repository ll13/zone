package com.mapper;

import java.util.List;
import com.po.Blog;

public interface BlogMapper {
	public List<Blog> getBlogByAuthor(Blog blog);
	public  Blog getBlogById(Blog blog);
	public List<Blog> RankOfClicknum(Blog blog); 
	
	
}
