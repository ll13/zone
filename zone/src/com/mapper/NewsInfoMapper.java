package com.mapper;

import java.util.List;

import com.po.NewsInfo;

public interface NewsInfoMapper {
	
	public List<NewsInfo> getAllNews();
	public List<NewsInfo> getNewsByPage(NewsInfo info);
	public int getTotal();
	public NewsInfo getNewsDetail(int newsid);
	
	

}
