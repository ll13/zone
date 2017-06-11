package com.mapper;

import java.util.List;
import com.po.Blog;

public interface BlogMapper {
	public List<Blog> getBlogByAuthor(Blog blog);
	public  Blog getBlogById(Blog blog);
	public int addBlog(Blog blog);
	public int delBlog(Blog blog);
	public int updateBlog(Blog blog);
	public List<Blog> RankOfClicknum(Blog blog); 
	public List<Blog> RankOfClollectnum(Blog blog); 
	public List<Blog> RankOfCommentnum(Blog blog);
}
