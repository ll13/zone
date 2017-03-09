package com.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import net.spy.memcached.AddrUtil;
import net.spy.memcached.MemcachedClient;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mapper.NewsInfoMapper;
import com.po.NewsInfo;


@Controller
@RequestMapping("/newsinfo/")
public class NewsInfoController {
	
	@Resource(name="newsInfoMapper")
	private NewsInfoMapper newsInfoMapper;
	
	@RequestMapping("newslist.do")
	public String list(Model model) throws IOException
	{
		
		NewsInfo news=new NewsInfo();
		news.setCurrentPage(1);
		news.setTotalRow(newsInfoMapper.getTotal());


		MemcachedClient mc=new MemcachedClient(AddrUtil.getAddresses("127.0.0.1:11211"));
		List<NewsInfo> list =(List<NewsInfo>) mc.get("newsfirstpage");
		
		//第一次到数据库读取，放入缓存
		//后面就直接从缓存中取
		if(list==null)
		{
			list=newsInfoMapper.getNewsByPage(news);
			mc.set("newsfirstpage", 60*60*12, list);
		}
		
		
		
		 
		model.addAttribute("newslist", list);
		model.addAttribute("currentPage",1);
		model.addAttribute("totalPage",news.getTotalPage());
		model.addAttribute("url", "newsinfo/page.do");
		System.out.println(list);
		
		return "newslist";
	}
	
	@RequestMapping("page.do")
	public String page(NewsInfo news,Model model) throws Exception
	{
		
		news.setTotalRow(newsInfoMapper.getTotal());
		
		List<NewsInfo> list;
		if(news.getCurrentPage()==1){
			
			MemcachedClient mc=new MemcachedClient(AddrUtil.getAddresses("127.0.0.1:11211"));
		    list =(List<NewsInfo>) mc.get("newsfirstpage");
			
			//第一次到数据库读取，放入缓存
			//后面就直接从缓存中取
			if(list==null)
			{
				list=newsInfoMapper.getNewsByPage(news);
				mc.set("newsfirstpage", 60*60*12, list);
			}
			
			
			
		}else{
		 list =newsInfoMapper.getNewsByPage(news);
		}
		
		
		
		model.addAttribute("newslist", list);
		model.addAttribute("currentPage",news.getCurrentPage());
		model.addAttribute("totalPage",news.getTotalPage());
		model.addAttribute("url", "newsinfo/page.do");
		
		return "newslist";
	}
	
	@RequestMapping("detail.do")
	public String newsDetail(int newsid,Model model) throws Exception
	{
		
		
		MemcachedClient mc=new MemcachedClient(AddrUtil.getAddresses("127.0.0.1:11211"));
     	NewsInfo news =(NewsInfo) mc.get(newsid+"");
		
		//第一次到数据库读取，放入缓存
		//后面就直接从缓存中取
		if(news==null)
		{
			news=newsInfoMapper.getNewsDetail(newsid);
			mc.set(newsid+"", 60*60*12, news);
		}
		
		model.addAttribute("news", news);
		
		return "newsdetail";
	}
	
	
	

}
