<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html> 
<html>
<head>
      <title>zone</title>

     <base href="<%=basePath%>">
     <meta http-equiv="content-type" content="text/html;charset=utf-8"/>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
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
	 
	  
	  
</head>
 
 
 <body>
   
   	<div id="header">
	   	<div class="header_main">
	   	     <h1>MyZone</h1>
	   		
	          <div class="header_button">
                 <button id="blog_btn" class="btn">博客</button>
                 <button id="bbs_btn" class="btn">论坛</button>
                 <button id="question_btn" class="btn">提问</button>
                 <button id="download_btn" class="btn">下载</button>
                 <button id="score_btn" class="btn">积分</button>
                 <button id="information_btn" class="btn">个人主页</button>
             </div>
		   	
		   	 <div class="header_member">
                <a href="javascript:void(0)" id="register_a">注册</a>
                <a href="javascript:void(0)" id="user_a">用户</a>               
                |
                <a href="javascript:void(0)" id="login_a">登录</a>
                <a href="javascript:void(0)" id="logout_a">退出</a>
             </div>		
		   	
	   		
   	      </div>
       </div>
       
        <form id="register" title="会员注册" >
          
          <ol class="register_error"></ol>
          
          <p>
             <label for="user">账号:</label>
             <input type="text" name="name" class="text" id="user"/>
             <span class="star">*</span>
          </p>
          <p>
             <label for="user">密码:</label>
             <input type="password" name="pass" class="text" id="pass" />
              <span class="star">*</span>
          </p>
          <p>
             <label for="email">邮箱:</label>
             <input type="text" name="email" class="text" id="email"/>
             <span class="star">*</span>
          </p>
          <p>
             <label for="user">性别:</label>
             <input type="radio" name="sex" value="male" id="male" checked="checked">
                <label for="male">男</label>
             
             <input type="radio" name="sex" value="female" id="female">
                <label for="female">女</label>
             
          </p>
          <p>
             <label for="date">生日:</label>
             <input type="text" name="birthday" readonly="readonly" class="text" id="date"/>
          </p>
     </form>
     
     
     <form id="login" title="会员登录" >
          
          <ol class="login_error"></ol>
          
          <p>
             <label for="user">账号:</label>
             <input type="text" name="name" class="text" id="login_user"/>
             <span class="star">*</span>
          </p>
          <p>
             <label for="user">密码:</label>
             <input type="password" name="pass" class="text" id="login_pass" />
              <span class="star">*</span>
          </p>
          <input type="checkbox" name="expires" id="expires" checked="checked"><label for="expires">登录有效期一周</label>
     </form>
     
     
     
     <div id="loading">数据交互中</div>
     <div id="error">请登录后操作...</div>
     


 
 
       
       