package com.controller;

import java.util.List;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mapper.CatalogMapper;
import com.mapper.PostCollectMapper;
import com.mapper.PostMapper;
import com.mapper.ReplyMapper;
import com.po.Catalog;
import com.po.Post;
import com.po.PostCollect;
import com.po.Reply;
import com.util.Cache;






@Controller
public class BbsController {
	
	@Resource(name="postMapper")
	PostMapper postMapper;
	@Resource(name="replyMapper")
	ReplyMapper replyMapper;
	@Resource(name="postCollectMapper")
	PostCollectMapper postCollectMapper;
	@Resource(name="catalogMapper")
	CatalogMapper catalogMapper;
	
	int postPageSize=3;
	
	
	
	@RequestMapping("/addPost.do")
	public @ResponseBody String addPost(String username,String title,String postContent,String pid){
		Post post=new Post();
		post.setTitle(title);
		post.setContent(postContent);
		post.setUsername(username);
		post.setPid(Integer.parseInt(pid));
        postMapper.insertPost(post);
		int id=postMapper.getPostIdByTitleUsername(post);
		return id+"";
	}
	
	@RequestMapping("/getcatalog.do")
	public @ResponseBody List<Catalog> getcatalog(){		
	    List<Catalog>  clist = catalogMapper.getAllCatalog();		    
	   return clist;
	}
	
	@RequestMapping("/getPostTotalPage.do")
	public @ResponseBody String getPostTotalPage(String type,String username,String pid){
		
		 int totalRow=0;		 
		 Post post=new Post();
		
		 if(type.equals("all")){
			 totalRow=postMapper.getPostTotalRow();
	     }if(type.equals("pid")){
	    	 post.setPid(Integer.parseInt(pid));
	    	 totalRow=postMapper.getPostTotalRowPid(post);
	     }if(type.equals("mypost")){
	    	 post.setUsername(username);
	    	 totalRow=postMapper.getPostTotalRowMy(post);
	     }if(type.equals("collect")){
	    	 post.setUsername(username);
	    	 totalRow=postMapper.getPostTotalRowUserCollect(post);
	     }
		
		 
		 post.setTotalRow(totalRow);		
		 int totalPage=post.calculateTotalPage(totalRow, postPageSize);
		
		return ""+totalPage;
	}
	
			
	@RequestMapping("/showPost.do")
	public @ResponseBody List<Post> showPost(String type,String pid,int page,String username){
		Post post=new Post();
		post.setPageSize(postPageSize);		
		post.setCurrentPage(page);
		List<Post> postlist=null;
		
		
		if(type.equals("all")&&page==1){
			Cache cache=Cache.getInstance();
			 postlist=(List<Post>)cache.getElementbyKey("postlist");
			 if(postlist==null){
			 postlist=postMapper.getPostbyPage(post);
			 cache.putElementbyKey("postlist", postlist);
			 }			 
		}if(type.equals("all")&&page>1){
			postlist=postMapper.getPostbyPage(post);
		}if(type.equals("pid")){
			post.setPid(Integer.parseInt(pid));
			postlist=postMapper.getPostbyPageAndPid(post);
		}if(type.equals("mypost")){
			post.setUsername(username);
			postlist=postMapper.getPostbyPageUsername(post);
		}if(type.equals("collect")){
			post.setUsername(username);
			postlist=postMapper.getPostbyPageUserCollect(post);
		}
		
		return postlist;
	} 
	
	
	@RequestMapping("/showDetailPost.do")
    public String showDetailPost(int postid,Model model){
		Post post=new Post();
		post.setId(postid);	
		Post resultPost=postMapper.getPostbyid(post);				
		model.addAttribute("post", resultPost);
		
		Reply reply=new Reply();
		reply.setPid(postid);
		List<Reply> resultReplyList=replyMapper.getReplybypid(reply);
		model.addAttribute("replylist", resultReplyList);		
		model.addAttribute("postid", postid);
		return "detailPost";  
	}
	
	@RequestMapping("/checkPostCollect.do")
	public @ResponseBody String checkPostCollect(String username,int postid){
		PostCollect postCollect=new PostCollect();
		postCollect.setPostid(postid);
		postCollect.setUsername(username);
		PostCollect pc=postCollectMapper.checkCollect(postCollect);
		if(pc!=null){
			return "1";
		}
		return "0";
		
		
	}
	
	@RequestMapping("/addReply.do")
	public @ResponseBody String addReply(String username,String postid,int floor,String content){
		Reply reply=new Reply();
		reply.setPid(Integer.parseInt(postid));
		reply.setUsername(username);
		reply.setContent(content);
		reply.setFloor(floor);
		
		Post post=new Post();
		post.setId(Integer.parseInt(postid));
	    postMapper.updateReplynum(post);
		
		int result=replyMapper.insertReply(reply);
		if(result==1){
			return "1";
		}
		return "0";
	}
	
	@RequestMapping("/upCollectnum.do")
	public @ResponseBody String upCollectnum(String postid,String username){
		Post post=new Post();
		post.setId(Integer.parseInt(postid));
		postMapper.upCollectnum(post);
		PostCollect pc=new PostCollect();
		pc.setPostid(Integer.parseInt(postid));
		pc.setUsername(username);
		postCollectMapper.insertPostCollect(pc);
		
		
		return "1";
	}
	
	@RequestMapping("/downCollectnum.do")
	public @ResponseBody String downCollectnum(String postid,String username){
		Post post=new Post();
		post.setId(Integer.parseInt(postid));
		postMapper.downCollectnum(post);
		
		PostCollect pc=new PostCollect();
		pc.setPostid(Integer.parseInt(postid));
		pc.setUsername(username);
		postCollectMapper.delectPostCollect(pc);
		return "1";
	}
	
	@RequestMapping("/updatePost.do")
	public @ResponseBody String updatePost(String id,String title,String content,String pid){
		Post post=new Post();
		post.setId(Integer.parseInt(id));
		post.setTitle(title);
		post.setContent(content);
		post.setPid(Integer.parseInt(pid));
		postMapper.updatePost(post);
		return "1";
	}
	
	@RequestMapping("/delectPost.do")
	public @ResponseBody String delectPost(String postid){
		Post post=new Post();
		post.setId(Integer.parseInt(postid));
		postMapper.delectPostbyId(post);
		return "1";
	}
	
	
	
}
