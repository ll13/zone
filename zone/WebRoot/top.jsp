<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html> 
<html>
<head>
 <base href="<%=basePath%>">
 <meta http-equiv="content-type" content="text/html;charset=utf-8"/>
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/bootstrap.css" type="text/css"></link>
  <link rel="stylesheet" href="css/login.css" type="text/css"></link>
  <script type="text/javascript" src="js/jquery.js"></script>
  <script type="text/javascript" src="js/bootstrap.min.js"></script>

 </head>
 <body>
   <nav class="nav navbar-inverse  " style="filter:alpha(Opacity=90);-moz-opacity:0.9;opacity: 0.9" role="navigation">
   	<div class="container">
	   		<div class="navbar-header">
	   	     <a href="#" class="navbar-brand">
	   	         <strong>南大软件学院</strong>
	   	     </a>
	   		</div>
	
		   	<ul class="nav navbar-nav">
		   			<li><a href="#">首页</a></li>
		   			<li><a href="newsinfo/newslist.do">新闻</a></li>
		   			
		   			<li><a href="#">观点</a></li>
		   			<li><a href="#">科技</a></li>
		   	</ul>
	   		<div class="navbar-form navbar-right">
	   			<div class="form-group">	
		   			<div class="input-group">
		   				<input type="text" class="form-control" placeholder="请输入文章关键字"  />
		   				<div class="input-group-btn">
		   					<button class="btn btn-block"><span class="glyphicon glyphicon-search"></span></button>
		   				</div>
		   			</div>	
	   			</div>
	   			<div class="form-group" style="padding-left: 10px; margin: 0px 12px;">
		   			<a href="#" style="color: #D2D2D2;">登录</a>
		   			<span  style="color: #D2D2D2;padding-left: 5px;">|</span>
		   			<a href="#" style="color: #D2D2D2;padding-left: 5px;">注册</a>
	   			</div>
	   		</div>	
   	  </div>
   </nav> 