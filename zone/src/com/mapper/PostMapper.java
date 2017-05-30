package com.mapper;

import java.util.List;

import com.po.Post;

public interface PostMapper {
	 
	public  int insertPost(Post post);
	public  Post getPostbyid(Post post);
	public  List<Post> getPostbyPage(Post post);
	public  List<Post> getPostbyPageAndPid(Post post);
	public  List<Post> getPostbyPageUsername(Post post);
	public  List<Post> getPostbyPageUserCollect(Post post);
	public  int getPostTotalRow();
	public  int getPostTotalRowPid(Post post);
	public  int getPostTotalRowMy(Post post);
	public  int getPostTotalRowUserCollect(Post post);
	
	public  int getPostIdByTitleUsername(Post post);
	public  int updateReplynum(Post post);
	public  int upCollectnum(Post post);
    public  int downCollectnum(Post post); 
    public  int delectPostbyId(Post post);
    
}
