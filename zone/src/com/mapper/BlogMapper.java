package com.mapper;

import java.util.List;

import com.po.Blog;



public interface BlogMapper {
	public int addContent(Blog blog);
	 public List<Blog> getBlog(Blog blog);
}
