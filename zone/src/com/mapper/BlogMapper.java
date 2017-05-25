package com.mapper;

import java.util.List;

import com.po.Blog;



public interface BlogMapper {
	public List<Blog> getBlogByAuthor(Blog blog); 
}
