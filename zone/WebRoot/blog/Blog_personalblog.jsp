<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

       
      <link rel="shortcut icon" type="image/x-icon" href="img/logo.ico"></link>
      <link rel="stylesheet" href="css/reset.css" type="text/css"></link>	  
	  <link rel="stylesheet" href="css/smoothness/jquery.ui.css" type="text/css"></link>
	  <link rel="stylesheet" href="css/Top_Bottom.css" type="text/css"></link>
  
  
  
		<script type="text/javascript" src="js/jquery.js"></script>
	    <script type="text/javascript" src="js/jquery-migrate-1.2.1.js"></script>
	    <script type="text/javascript" src="js/jquery.ui.js"></script>
	    <script type="text/javascript" src="js/index.js"></script>
	    <script type="text/javascript" src="js/jquery.validate.js"></script>
	    <script type="text/javascript" src="js/jquery.form.js"></script>
	    <script type="text/javascript" src="js/jquery.cookie.js"></script>
		<script type="text/javascript" src="js/md5.js"></script>




		<link rel="stylesheet" href="css/bootstrap.css" type="text/css"></link>
		<link rel="stylesheet" href="uEditor/uEditor.css" type="text/css"></link>
		<link rel="stylesheet" href="css/Blog_personalblog.css" type="text/css"></link>
		
		<script type="text/javascript" src="js/bootstrap.js"></script>

</head>

<body>

  
   <c:import url="/common/top.do"></c:import>


<div id="main">
	<div class="main_top">
	</div>
    <div class="main_left">
     	<div class="info_title">
     		<p>个人资料</p>
     	</div>
     	<div class="info_pic">
     		<img src="" alt="img"></img>
        </div>
        <div class="interact">
        	<button type="button" class="concern">关注</button>
        	<button type="button" class="Privatechat">私信</button>
      	</div>
      	<div class="data">
      		<ul>
      			<li>data</li>
      		</ul>
	</div>
</div>
	<div class="main_right">
		
	</div>
</div>



<c:import url="/common/bottom.do"></c:import>