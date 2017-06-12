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
      <link rel="stylesheet" href="css/bootstrap.css" type="text/css"></link>
      <link rel="stylesheet" href="css/smoothness/jquery.ui.css" type="text/css"></link>     
      <link rel="stylesheet" href="css/Top_Bottom.css" type="text/css"></link>
	  <link rel="stylesheet" href="css/user.css" type="text/css"></link>
  
  
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript" src="js/bootstrap.js"></script>		
	    <script type="text/javascript" src="js/jquery-migrate-1.2.1.js"></script>
	    <script type="text/javascript" src="js/jquery.ui.js"></script>	    
	    <script type="text/javascript" src="js/jquery.validate.js"></script>
	    <script type="text/javascript" src="js/jquery.form.js"></script>
	    <script type="text/javascript" src="js/jquery.cookie.js"></script>
		<script type="text/javascript" src="js/md5.js"></script>      				
		<script type="text/javascript" src="js/index.js"></script>		
        
      
   
   
   </head>

<body>

  
   <c:import url="/common/top.do"></c:import>


	<div id="main">

		<nav class="navbar navbar-default"  id='usernav'>
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="user.jsp">个人主页</a>
			</div>
		</div>
		<hr noshade='noshade' class="Line" size='1' />	
		<div>
		    <div  class='username_bar'>
		        <div class='username_div'>用户名   :<em> admin </em></div>
		        <div class='usersex_div'> 性别   :  <em>男   </em></div>
		    </div>
		    <div class='userdescription'>用户介绍 :  <p>&nbsp;&nbsp;暂无介绍</p> 
		    </div>
		</div>
		</nav>	
        
        	
		<div class="left_main">
		 	<ul id="myTab" class="nav nav-tabs">
	           <li class="active"><a href="#updateinformation" data-toggle="tab">修改信息 </a></li>
	           <li><a href="#updatepassword" data-toggle="tab">修改密码</a></li>
	           <li><a href="#showmessage" data-toggle="tab">查看信息</a></li>
	           <li><a href="#sendmessage" data-toggle="tab">发送信息</a></li>
	        </ul>
            <div id="myTabContent" class="tab-content">
	           <div class="tab-pane fade in active" id="updateinformation">
		          <p>blog</p>
	           </div>
	           <div class="tab-pane fade" id="updatepassword">
		          <p>post</p>
	           </div>
	           <div class="tab-pane fade" id="showmessage">
		          <p>question</p>
	           </div>
	           <div class="tab-pane fade" id="sendmessage">
		          <p>file</p>
	           </div>	
            </div>
		</div>
		
		
		<div class="right_main">
		   <div id="collectuser">
		     <h4>关注我的用户  <em>10 <em></h4>
		     <li><a>admin</a></li>
		     <li><a>admin</a></li>
		     <li><a>admin</a></li>
		     <li><a>admin</a></li>
		     <li><a>admin</a></li>
		   </div>
		   
		   <div id="mycollectuser">
		     <h4>我关注的用户  <em>10 <em></h4>
		     <li><a>admin</a></li>
		     <li><a>admin</a></li>
		     <li><a>admin</a></li>
		     <li><a>admin</a></li>
		     <li><a>admin</a></li>
		   </div>
		</div>
		
		
		
	</div>

	
	
	
	<c:import url="/common/bottom.do"></c:import>
</body>
</html>
