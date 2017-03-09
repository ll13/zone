<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<c:import url="common/top.do"></c:import>

    <div class="container" style="margin: 30px auto">
      <div class="col-md-9">
        
              
          <div class="panel panel-default">
              <div class="panel-heading">
                    ${news.newsTitle}
              </div>
              <div class="panel-body">
                      ${news.newsContent}                        
              </div>
              <div class="panel-footer">
                   	发布:${news.pubtime} 作者:${news.pubuser} 阅读:${news.clickNum}
              </div>
      </div>
       </div>
      
      
      
      
      
      <div class="col-md-3">
          
              	
   			<div class="list-group">
		      	<span class="list-group-item">
			   		<span class="btn  "><span class="glyphicon   glyphicon-heart"></span> </span> <a href="#"  style="font-size: 12pt;color: #222;">最热新闻</a>
			  	</span>
			   <ul class="nav list-group-item">
			   		<li  ><a href="/my"  >最热新闻1</a></li>
			     	<li  ><a href="/my"  >最热新闻2</a></li>
			       	<li  ><a href="/my"  >最热新闻3</a></li>
			        <li  ><a href="/my"  >最热新闻4</a></li>
			   </ul>
			</div>
          
      </div>
     
 
 </div>

<c:import url="common/bottom.do"></c:import>